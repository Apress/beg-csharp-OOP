using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Activity7_1
{
    public partial class TellerForm : Form
    {
        public TellerForm()
        {
            InitializeComponent();
        }

        private void btnGetBalance_Click(object sender, EventArgs e)
        {
            
            try
            {
               
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
