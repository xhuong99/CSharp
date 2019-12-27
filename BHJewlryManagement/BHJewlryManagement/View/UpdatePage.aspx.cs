using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JewlryManager;

namespace BHJewlryManagement
{
    public partial class UpdatePage : System.Web.UI.Page
    {
        bool valid()
        {
            int flag = 0;
            if (txtName.Text.Length <= 0 || txtName.Text.Length > 50)
            {
                nameErr.Text = "Name product must be from 1 to 50 characters";
                nameErr.Visible = true;
                flag = 1;
            }
            else
            {
                nameErr.Visible = false;
            }

            if (!Regex.IsMatch(txtPrice.Text, @"\d{1,}([\.]\d{1,})?"))
            {
                priceErr.Text = "ID must be a number!";
                priceErr.Visible = true;
                flag = 1;
            }
            else
            {
                priceErr.Visible = false;
            }

            if (flag == 1)
            {
                return false;
            }

            return true;
        }
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
                UpdateInfo();
            }

        }
        private void UpdateInfo()
        {
            List<Category> listCate = new List<Category>();
            List<Color> listCol = new List<Color>();
            CategoryDAO categoryDAO = new CategoryDAO();
            ColorDAO colorDAO = new ColorDAO();

            listCate = categoryDAO.GetCategories();
            listCategory.DataSource = listCate;
            listCategory.DataBind();
            listCol = colorDAO.GetColors();
            listColor.DataSource = listCol;
            listColor.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!valid())
            {
                return;
            }
            ProductDAO dao = new ProductDAO();
            Product p = new Product();
            p.IDPro = int.Parse(Request.QueryString["IDPro"]);
            p.IDCate = listCategory.SelectedValue;
            p.IDCol = listColor.SelectedValue;
            p.NamePro = txtName.Text;
            p.PricePro = float.Parse(txtPrice.Text);
            bool r = dao.UpdateProduct(p);
            if (r)
            {
                Response.Redirect(@"~\View\AdminPage.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"~\View\AdminPage.aspx");
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("admin");
            Response.Redirect(@"~\View\LoginPage.aspx");
        }
    }
}