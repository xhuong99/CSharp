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
    public partial class AddProductPage : System.Web.UI.Page
    {
        bool valid()
        {
            int flag = 0;
            if (!Regex.IsMatch(txtID.Text, @"\d{1,}"))
            {
                idErr.Text = "*\nID must be a number!";
                idErr.Visible = true;
            }
            else
            {
                idErr.Visible = false;
            }

            if (txtName.Text.Length <= 0 || txtName.Text.Length > 50)
            {
                nameErr.Text = "* \nName product must be from 1 to 50 characters!";
                nameErr.Visible = true;
                flag = 1;
            }
            else
            {
                nameErr.Visible = false;
            }

            if (!Regex.IsMatch(txtPrice.Text, @"\d{1,}([\.]\d{1,})?"))
            {
                priceErr.Text = "* \nPrice must be a number!";
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
                UpdateAddInfo();
            }
        }
        private void UpdateAddInfo()
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
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtID.Text = "";
            txtName.Text = "";
            txtPrice.Text = "";
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (!valid())
            {
                return;
            }
            ProductDAO dao = new ProductDAO();
            Product pro = new Product();
            pro.IDPro = int.Parse(txtID.Text);
            pro.IDCate = listCategory.SelectedValue;
            pro.IDCol = listColor.SelectedValue;
            pro.NamePro = txtName.Text;
            pro.PricePro = float.Parse(txtPrice.Text);
            bool r = dao.AddNewProduct(pro);
            if (r)
            {
                Response.Redirect(@"~\View\AdminPage.aspx");
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("admin");
            Response.Redirect(@"~\View\LoginPage.aspx");
        }
    }
}