/******************************************************************************
**		File: OfficeSupplydb_Schema.sql
**		Name: Physical Database Schema SQL Script
**		Desc: This script will create the .NET OfficeSupply database schema
**
**		Date: 7/15/2005
**
*******************************************************************************/

USE master;

-- create the database
IF NOT EXISTS (SELECT dbid FROM sysdatabases WHERE name = 'OfficeSupply')
CREATE DATABASE OfficeSupply;
GO

-------------------------------------------------------------------------------
--
-- Database Tables
--
-------------------------------------------------------------------------------

-- switch to the OfficeSupply database
USE OfficeSupply;
GO
-------------------------------------------------------------------------------
-- Employee Table
-------------------------------------------------------------------------------
CREATE TABLE Employee
(
    EmployeeID		int		not null,
    UserName            varchar(20)     NOT NULL,
    [Password]          varchar(25)     NOT NULL,
    Department		Char(2)		Not null,
    Manager		bit		Not Null
);

-- add the primary key constraints
ALTER TABLE Employee ADD
    CONSTRAINT PK_Employee
    PRIMARY KEY CLUSTERED (EmployeeID);

-- grant access
GRANT ALL ON Employee TO PUBLIC;
GO
 
-------------------------------------------------------------------------------
-- Supplier Table
-------------------------------------------------------------------------------
CREATE TABLE Supplier
(
    SuppID              int                    NOT NULL,
    [Name]              varchar(80)            NOT NULL
    );

-- add the primary key constraints
ALTER TABLE Supplier ADD
    CONSTRAINT PK_Supplier
    PRIMARY KEY  CLUSTERED (SuppID);
GO
-- grant access
GRANT ALL ON Supplier TO PUBLIC;
GO

-------------------------------------------------------------------------------
-- Orders Table
-------------------------------------------------------------------------------
CREATE TABLE Orders
(
    OrderID             int         IDENTITY   NOT NULL,
    EmployeeID          int                    NOT NULL,
    OrderDate           datetime               NOT NULL,
    Status              char(1)                NOT NULL
);
GO
-- add the primary key constraints
ALTER TABLE Orders ADD
    CONSTRAINT PK_Orders
    PRIMARY KEY  CLUSTERED (OrderID);
-- add the foreign key constraints
ALTER TABLE Orders ADD 
    CONSTRAINT FK_Orders_Employee FOREIGN KEY (EmployeeID)
    REFERENCES Employee (EmployeeID);
    
ALTER TABLE Orders WITH NOCHECK ADD 
	CONSTRAINT DF_Orders_StatusCode DEFAULT ('P') FOR Status
	
ALTER TABLE Orders WITH NOCHECK ADD 
	CONSTRAINT DF_Orders_OrderDate DEFAULT (GETDATE()) FOR OrderDate
GO

-- grant access
GRANT ALL ON Orders TO PUBLIC;
GO



-------------------------------------------------------------------------------
-- Category Table
-------------------------------------------------------------------------------
CREATE TABLE Category
(
    CatID               int               NOT NULL,
    [Name]              varchar(80)            NULL,  
    Descript            varchar(255)           NULL
);

-- add the primary key
ALTER TABLE Category ADD 
    CONSTRAINT PK_Category
    PRIMARY KEY  CLUSTERED (CatID);

-- grant access
GRANT ALL ON Category TO PUBLIC;
GO

-------------------------------------------------------------------------------
-- Product Table
-------------------------------------------------------------------------------
CREATE TABLE Product
(
    ProductID           char(10)               NOT NULL,
    CatID               int                    NOT NULL,
    [Name]              varchar(80)            NULL,
    Descript            varchar(255)           NULL,
    UnitCost            decimal(10, 2)         NULL,
    SuppID              int                    NULL
);

-- add the primary key constraints
ALTER TABLE Product ADD 
    CONSTRAINT PK_Product
    PRIMARY KEY  CLUSTERED (ProductID);

-- add the foreign key constraints
ALTER TABLE Product ADD 
    CONSTRAINT FK_Product_Category FOREIGN KEY (CatID)
    REFERENCES category (CatID);
ALTER TABLE Product ADD
    CONSTRAINT FK_Product_Supplier FOREIGN KEY (SuppID)
    REFERENCES Supplier (SuppID);
-- grant access
GRANT ALL ON Product TO PUBLIC;
GO









-------------------------------------------------------------------------------
-- OrderItem Table
-------------------------------------------------------------------------------
CREATE TABLE OrderItem
(
    OrderID             int                    NOT NULL,
    ProductID           char(10)               NOT NULL,
    Quantity            int                    NOT NULL  
);

-- add the primary key constraints
ALTER TABLE OrderItem ADD
    CONSTRAINT PK_OrderItem
    PRIMARY KEY  CLUSTERED (OrderID, ProductID);

-- add the foreign key constraints
ALTER TABLE OrderItem ADD 
    CONSTRAINT FK_OrderItem_Orders FOREIGN KEY (OrderID)
    REFERENCES Orders (OrderID);

ALTER TABLE OrderItem ADD 
    CONSTRAINT FK_OrderItem_Product FOREIGN KEY (ProductID)
    REFERENCES Product (ProductID);

-- grant access
GRANT ALL ON OrderItem TO PUBLIC;
GO


-- switch to the OfficeSupply database
USE OfficeSupply;

-- insert Employee table data
INSERT INTO Employee VALUES(1, 'dclark','drc','HR',0);
INSERT INTO Employee VALUES(2, 'jsmith','js','IS',1);
INSERT INTO Employee VALUES(3, 'mjones','mj','HR',1);
INSERT INTO Employee VALUES(4, 'klink','kl','IS',0);

-- insert category table data
INSERT INTO category VALUES(1,'Audio Visual','');
INSERT INTO category VALUES(2,'Art Supplies','');
INSERT INTO category VALUES(3,'Cleaning Supplies','');
INSERT INTO category VALUES(4,'Computer Supplies','');
INSERT INTO category VALUES(5,'Desk Accessories','');
INSERT INTO category VALUES(6,'Writing Supplies','');
INSERT INTO category VALUES(7,'Printer Supplies','');


-- insert Supplier table data
INSERT INTO Supplier VALUES (1,'XYZ Office Supplies');
INSERT INTO Supplier VALUES (2,'ABC Office Products');


-- insert Product table data
INSERT INTO Product VALUES ('ACM-10414 ',2,'Ruler','12 inch stainless steel',3.79,2);
INSERT INTO Product VALUES ('APO-CG7070',1,'Transparency','Quick dry ink jet',24.49,1);
INSERT INTO Product VALUES ('APO-FXL   ',1,'Overhead Bulb','High intensity replacement bulb',12.00,1);
INSERT INTO Product VALUES ('APO-MP1200',1,'Laser Pointer','General purpose laser pointer',29.99,2);
INSERT INTO Product VALUES ('BIN-68401 ',2,'Colored Pencils','Non toxic 12 pack',2.84,1);
INSERT INTO Product VALUES ('DRA-91249 ',3,'All-Purpose Cleaner','Use on all washable surfaces',4.29,2);
INSERT INTO Product VALUES ('FOH-28124 ',3,'Paper Hand Towels','320 sheets per roll',5.25,1);
INSERT INTO Product VALUES ('IMN-41143 ',4,'CD-R','700 mb with jewel case',1.09,1);
INSERT INTO Product VALUES ('IMN-44766 ',4,'3.5 inch Disks','High Density Formatted Box of 10',5.99,1);
INSERT INTO Product VALUES ('KMW-12164 ',4,'Monitor wipes','Non abrasive lint free',6.99,2);
INSERT INTO Product VALUES ('KMW-22256 ',4,'Dust Blaster','Ozone safe no CFCs',8.99,2);
INSERT INTO Product VALUES ('MMM-6200  ',2,'Clear Tape','1 inch wide 6 rolls',3.90,1);
INSERT INTO Product VALUES ('MMM-9700P ',1,'Overhead Projector','Portable with travel cover',759.97,1);
INSERT INTO Product VALUES ('OIC-5000  ',2,'Glue Stick','Oderless non toxic',1.99,2);

GO


SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

Use OfficeSupply
go
-------------------------------------------------------------------------------
-- up_PlaceOrder
-------------------------------------------------------------------------------
/******************************************************************************
	Add order to database. Example of using this stored proc is shown below.
	
	declare @xmlOrder varchar(8000)
	set @xmlOrder = 
		'
		<Order EmployeeID="1">
		  <OrderItem ProductID="EST-1" Quantity="4" />
		  <OrderItem ProductID="EST-5" Quantity="2" />
		  <OrderItem ProductID="EST-9" Quantity="6" />
		</Orders>
		'

	exec up_PlaceOrder @xmlOrder
	
*******************************************************************************/
Create  PROCEDURE up_PlaceOrder
(
    @xmlOrder                 varchar(8000)
)
AS

    DECLARE @idoc int		-- xml doc
    DECLARE @OrderID int	-- new order

    -- parse xml doc
    EXEC sp_xml_preparedocument @idoc output, @xmlOrder


    SET NOCOUNT ON
    DECLARE @CurrentError int

    -- start transaction, updating three tables
    BEGIN TRANSACTION

    -- add new order to Orders table
    INSERT INTO Orders (EmployeeID)
    SELECT EmployeeID
    FROM OpenXML(@idoc, '/Order')
    WITH Orders

    -- check for error
    SELECT @CurrentError = @@Error

    IF @CurrentError != 0
        BEGIN
   	        GOTO ERROR_HANDLER
        END

    -- get new order id
    SELECT @OrderID = @@IDENTITY

    -- add line items to LineItem table
    INSERT INTO OrderItem
    SELECT @OrderID, ProductID, Quantity
    FROM OpenXML(@idoc, '/Order/OrderItem')
    WITH OrderItem

    -- check for error
    SELECT @CurrentError = @@Error

    IF @CurrentError != 0
        BEGIN
   	        GOTO ERROR_HANDLER
        END

    
    -- end of transaction
    COMMIT TRANSACTION

    SET NOCOUNT OFF

    -- done with xml doc
    EXEC sp_xml_removedocument @idoc

    -- return the new order
    RETURN @OrderID

    ERROR_HANDLER:
        ROLLBACK TRANSACTION
        SET NOCOUNT OFF    
        RETURN 0    

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


GRANT Execute ON up_PlaceOrder TO PUBLIC;
GO
