using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JewlryManager;

namespace BHJewlryManagement
{
    public partial class ViewDetailsBill : System.Web.UI.Page
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
                lnkLoginout.Text = "Logout";
                lnkProfile.Visible = true;
                lnkProfile.Text = acc.NameAcc;
                lnkLoginout.Visible = true;
            }
            if (!IsPostBack)
            {
                GetCategories();
                GetListProductInBill();
            }
        }

        private void GetListProductInBill()
        {
            int orderID = int.Parse(Request["IDOrd"]);
            CartDAO dao = new CartDAO();
            CartObj cart = dao.getOrderDetailById(orderID);
            gvBills.DataSource = cart.GetCartDetail();
            gvBills.DataBind();
            lbTotal.Text = cart.Total.ToString();
        }

        private void GetCategories()
        {
            CategoryDAO dao = new CategoryDAO();
            List<Category> listCat = new List<Category>();
            listCat = dao.GetCategories();
            listCategory.DataSource = listCat;
            listCategory.DataBind();
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