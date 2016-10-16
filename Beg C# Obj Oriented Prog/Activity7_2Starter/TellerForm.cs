using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Activity7_2Starter
{
    public partial class TellerForm : Form
    {
        CheckingAccount oCheckingAccount = new CheckingAccount();
        SavingsAccount oSavingsAccount = new SavingsAccount();

        public TellerForm()
        {
            InitializeComponent();
        }

        private void btnGetBalance_Click(object sender, EventArgs e)
        {
            try
            {
                if (rdbChecking.Checked)
                {
                    oCheckingAccount.AccountNumber = int.Parse(txtAccountNumber.Text);
                    txtBalance.Text = oCheckingAccount.GetBalance().ToString();
                }
                else if (rdbSavings.Checked)
                {
                    oSavingsAccount.AccountNumber = int.Parse(txtAccountNumber.Text);
                    txtBalance.Text = oSavingsAccount.GetBalance().ToString();
                } 
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnWithdraw_Click(object sender, EventArgs e)
        {
           
            try
            {
              
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            txtAccountNumber.Text = "";
            txtAmount.Text = "";
            txtBalance.Text = "";
        }
    }
}
