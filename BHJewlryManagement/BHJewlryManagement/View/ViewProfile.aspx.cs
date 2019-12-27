using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JewlryManager;
namespace BHJewlryManagement
{
    public partial class ViewProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                lnkLoginout.Text = "Login";
                lnkLoginout.Visible = true;
            }
            else if (Session["user"] != null)
            {
                Account acc = (Account)Session["user"];
                lnkProfile.Text = acc.NameAcc;
                lnkProfile.Visible = true;
                lnkLoginout.Text = "Logout";
                lnkLoginout.Visible = true;
            }
            if (!IsPostBack)
            {
                GetCategories();
                GetProfile();
                GetOrdersBill();
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

        private void GetProfile()
        {
            Account user = (Account)Session["user"];
            lbName.Text = user.NameAcc;
            lbAddress.Text = user.AddrAcc;
            lbPhone.Text = user.PhoneAcc;
        }

        private void GetOrdersBill()
        {
            Account user = (Account)Session["user"];
            CartDAO dao = new CartDAO();
            List<Order> list = dao.GetOrders(user.IDAcc);
            gvBills.DataSource = list;
            gvBills.DataBind();
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
                lnkProfile.Visible = false;
                Response.Redirect(@"~\View\ShoppingPage.aspx");
            }
        }

    }
}