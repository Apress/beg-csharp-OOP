using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Activity6_2
{
    class Employee
    {
        private int _empID;
        private string _loginName;
        private string _passWord;
        private int _SSN;
        private string _department;

        public int EmpID
        {
            get { return _empID; }
        }
        
        public string LoginName
        {
            get { return _loginName; }
            set { _loginName = value; }
        }
       
        public string PassWord
        {
            get { return _passWord; }
            set { _passWord = value; }
        }
       
        public int SSN
        {
            get { return _SSN; }
            set { _SSN = value; }
        }
       
        public string Department
        {
            get { return _department; }
            set { _department = value; }
        }
    }
}
