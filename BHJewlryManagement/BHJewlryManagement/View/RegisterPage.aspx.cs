using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JewlryManager;

namespace BHJewlryManagement
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        public string id;

        bool valid()
        {
            int flag = 0;
            if (txtUsername.Text.Length <= 0 || txtUsername.Text.Length > 20)
            {
                usernameErr.Text = "Username must be from 1 to 20 characters";
                usernameErr.Visible = true;
                flag = 1;
            }
            else
            {
                usernameErr.Visible = false;
            }
            if (txtPassword.Text.Length <= 0 || txtPassword.Text.Length > 20)
            {
                passwordErr.Text = "Password must be from 1 to 20 characters";
                passwordErr.Visible = true;
                flag = 1;
            }
            else
            {
                passwordErr.Visible = false;
            }

            if (txtFullname.Text.Length <= 0 || txtFullname.Text.Length > 30)
            {
                nameErr.Text = "Full name must be from 1 to 30 characters";
                nameErr.Visible = true;
                flag = 1;
            }
            else
            {
                nameErr.Visible = false;
            }

            if (!Regex.IsMatch(txtPhone.Text, @"^(0)\d{9,10}$"))
            {
                phoneErr.Text = "Phone number wrong format!!";
                phoneErr.Visible = true;
                flag = 1;
            }
            else
            {
                phoneErr.Visible = false;
            }

            if (!Regex.IsMatch(txtEmail.Text, @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"))
            {
                emailErr.Text = "Email wrong format!!";
                emailErr.Visible = true;
                flag = 1;
            }
            else
            {
                emailErr.Visible = false;
            }

            if (txtAddress.Text.Length <= 0 || txtAddress.Text.Length > 50)
            {
                addressErr.Text = "Address must be from 1 to 50 characters";
                addressErr.Visible = true;
                flag = 1;
            }
            else
            {
                addressErr.Visible = false;
            }
            if (flag == 1)
            {
                return false;
            }
            return true;
        }
        private void GetCategories()
        {
            CategoryDAO dao = new CategoryDAO();
            List<Category> listCat = new List<Category>();
            listCat = dao.GetCategories();
            listCategory.DataSource = listCat;
            listCategory.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCategories();
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!valid())
            {
                return;
            }
            string gen = listGen.SelectedValue;
            bool gnd = true;
            if (gen.Equals("Female"))
            {
                gnd = false;
            }
            else
            {
                gnd = true;
            }
            AccountDAO dao = new AccountDAO();
            Account account = new Account();
            account.IDAcc = txtUsername.Text.Trim();
            account.PassAcc = txtPassword.Text;
            account.NameAcc = txtFullname.Text;
            account.EmailAcc = txtEmail.Text;
            account.PhoneAcc = txtPhone.Text;
            account.AddrAcc = txtAddress.Text;
            account.GenAcc = gnd;
            account.IsAdmin = false;
            if (dao.CheckDuplicated(txtUsername.Text))
            {
                usernameErr.Text = "Username duplicated!";
                usernameErr.Visible = true;
                return;
            }
            dao.CreateAccount(account);
            Response.Redirect(@"~\View\LoginPage.aspx");

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtAddress.Text = "";
            txtEmail.Text = "";
            txtFullname.Text = "";
            txtPassword.Text = "";
            txtPhone.Text = "";
            txtUsername.Text = "";
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"~\View\LoginPage.aspx");
        }

    }
}