using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JewlryManager;

namespace BHJewlryManagement
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                Account acc = (Account)Session["admin"];
                IDAcc.Text = acc.NameAcc;
                IDAcc.Visible = true;
                lnkLogout.Visible = true;
            }
            else
            {
                Response.Redirect(@"~\View\LoginPage.aspx");
            }
            if (!IsPostBack)
            {
                UpdateGridView();
            }
        }

        private void UpdateGridView()
        {
            ProductDAO dao = new ProductDAO();
            List<Product> products = dao.GetProduct();
            gvProduct.DataSource = products;
            gvProduct.DataBind();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            ProductDAO dao = new ProductDAO();
            string id = ((LinkButton)sender).CommandArgument;
            dao.DeleteProduct(int.Parse(id));
            UpdateGridView();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ProductDAO dao = new ProductDAO();
            string searchValue = txtSearch.Text;
            List<Product> products = dao.SearchProductByName(searchValue);
            gvProduct.DataSource = products;
            gvProduct.DataBind();
        }

        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"~\View\AddProductPage.aspx");
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("admin");
            Response.Redirect(@"~\View\ShoppingPage.aspx");
        }
    }

}