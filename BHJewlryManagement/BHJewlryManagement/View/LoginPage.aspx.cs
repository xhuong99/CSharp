using JewlryManager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHJewlryManagement
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                Response.Redirect(@"~\View\AdminPage.aspx");
            } else if (Session["user"] != null)
            {
                Response.Redirect(@"~\View\ShoppingPage.aspx");
            }
            if (!IsPostBack)
            {
                GetCategories();
            }
        }

        private void GetCategories()
        {
            CategoryDAO dao = new CategoryDAO();
            List<Category> listCat = new List<Category>();
            listCat = dao.GetCategories();
            listCategory.DataSource = listCat;
            listCategory.DataBind();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            AccountDAO dao = new AccountDAO();
            Account user = dao.CheckLogin(txtUsername.Text, txtPassword.Text);
            if (user != null)
            {
                if (user.IsAdmin)
                {
                    Session["admin"] = user;
                    Response.Redirect(@"~\View\AdminPage.aspx");
                }
                else
                {
                    Session["user"] = user;
                    Response.Redirect(@"~\View\ShoppingPage.aspx");
                }
            }
            else
            {
                loginErr.Text = "\n Wrong username or corresponding password!";
                loginErr.Visible = true;
            }
        }

        protected void lnkRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"~\View\RegisterPage.aspx");
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtUsername.Text = "";
            txtPassword.Text = "";
        }


        protected void lnkLoginout_Click(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect(@"~\View\LoginPage.aspx");
            }
            else if (Session["user"] != null)
            {
                Session.RemoveAll();
                IDAcc.Visible = false;
                Response.Redirect(@"~\View\ShoppingPage.aspx");
            }
        }
    }
}