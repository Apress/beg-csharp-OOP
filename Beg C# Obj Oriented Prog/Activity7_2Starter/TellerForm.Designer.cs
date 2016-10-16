namespace Activity7_2Starter
{
    partial class TellerForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtAccountNumber = new System.Windows.Forms.TextBox();
            this.txtBalance = new System.Windows.Forms.TextBox();
            this.txtAmount = new System.Windows.Forms.TextBox();
            this.rdbChecking = new System.Windows.Forms.RadioButton();
            this.rdbSavings = new System.Windows.Forms.RadioButton();
            this.btnGetBalance = new System.Windows.Forms.Button();
            this.btnWithdraw = new System.Windows.Forms.Button();
            this.btnClear = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(16, 31);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(90, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Account Number:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(16, 56);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(49, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Balance:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(16, 82);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(46, 13);
            this.label3.TabIndex = 2;
            this.label3.Text = "Amount:";
            // 
            // txtAccountNumber
            // 
            this.txtAccountNumber.Location = new System.Drawing.Point(145, 31);
            this.txtAccountNumber.Name = "txtAccountNumber";
            this.txtAccountNumber.Size = new System.Drawing.Size(100, 20);
            this.txtAccountNumber.TabIndex = 3;
            // 
            // txtBalance
            // 
            this.txtBalance.Enabled = false;
            this.txtBalance.Location = new System.Drawing.Point(145, 56);
            this.txtBalance.Name = "txtBalance";
            this.txtBalance.Size = new System.Drawing.Size(100, 20);
            this.txtBalance.TabIndex = 4;
            // 
            // txtAmount
            // 
            this.txtAmount.Location = new System.Drawing.Point(145, 83);
            this.txtAmount.Name = "txtAmount";
            this.txtAmount.Size = new System.Drawing.Size(100, 20);
            this.txtAmount.TabIndex = 5;
            // 
            // rdbChecking
            // 
            this.rdbChecking.AutoSize = true;
            this.rdbChecking.Location = new System.Drawing.Point(19, 153);
            this.rdbChecking.Name = "rdbChecking";
            this.rdbChecking.Size = new System.Drawing.Size(70, 17);
            this.rdbChecking.TabIndex = 6;
            this.rdbChecking.TabStop = true;
            this.rdbChecking.Text = "Checking";
            this.rdbChecking.UseVisualStyleBackColor = true;
            // 
            // rdbSavings
            // 
            this.rdbSavings.AutoSize = true;
            this.rdbSavings.Location = new System.Drawing.Point(19, 176);
            this.rdbSavings.Name = "rdbSavings";
            this.rdbSavings.Size = new System.Drawing.Size(63, 17);
            this.rdbSavings.TabIndex = 7;
            this.rdbSavings.TabStop = true;
            this.rdbSavings.Text = "Savings";
            this.rdbSavings.UseVisualStyleBackColor = true;
            // 
            // btnGetBalance
            // 
            this.btnGetBalance.Location = new System.Drawing.Point(145, 153);
            this.btnGetBalance.Name = "btnGetBalance";
            this.btnGetBalance.Size = new System.Drawing.Size(75, 23);
            this.btnGetBalance.TabIndex = 9;
            this.btnGetBalance.Text = "Get Balance";
            this.btnGetBalance.UseVisualStyleBackColor = true;
            this.btnGetBalance.Click += new System.EventHandler(this.btnGetBalance_Click);
            // 
            // btnWithdraw
            // 
            this.btnWithdraw.Location = new System.Drawing.Point(145, 194);
            this.btnWithdraw.Name = "btnWithdraw";
            this.btnWithdraw.Size = new System.Drawing.Size(75, 23);
            this.btnWithdraw.TabIndex = 10;
            this.btnWithdraw.Text = "Withdraw";
            this.btnWithdraw.UseVisualStyleBackColor = true;
            this.btnWithdraw.Click += new System.EventHandler(this.btnWithdraw_Click);
            // 
            // btnClear
            // 
            this.btnClear.Location = new System.Drawing.Point(145, 231);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(75, 23);
            this.btnClear.TabIndex = 11;
            this.btnClear.Text = "Clear";
            this.btnClear.UseVisualStyleBackColor = true;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // TellerForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(292, 266);
            this.Controls.Add(this.btnClear);
            this.Controls.Add(this.btnWithdraw);
            this.Controls.Add(this.btnGetBalance);
            this.Controls.Add(this.rdbSavings);
            this.Controls.Add(this.rdbChecking);
            this.Controls.Add(this.txtAmount);
            this.Controls.Add(this.txtBalance);
            this.Controls.Add(this.txtAccountNumber);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "TellerForm";
            this.Text = "Teller";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtAccountNumber;
        private System.Windows.Forms.TextBox txtBalance;
        private System.Windows.Forms.TextBox txtAmount;
        private System.Windows.Forms.RadioButton rdbChecking;
        private System.Windows.Forms.RadioButton rdbSavings;
        private System.Windows.Forms.Button btnGetBalance;
        private System.Windows.Forms.Button btnWithdraw;
        private System.Windows.Forms.Button btnClear;
    }
}

