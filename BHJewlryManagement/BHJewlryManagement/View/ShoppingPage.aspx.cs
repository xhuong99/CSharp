using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JewlryManager;

namespace BHJewlryManagement
{
    public partial class ShoppingPage : System.Web.UI.Page
    {
        public string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                lnkLoginout.Text = "Login";
            }
            else if (Session["user"] != null)
            {
                Account acc = (Account)Session["user"];
                lnkLoginout.Text = "Logout";
                lnkProfile.Text = acc.NameAcc;
                lnkProfile.Visible = true;
            }
            if (!IsPostBack)
            {
                GetCategories();
                string id = Request.QueryString["IDCate"];
                if (id != null)
                {
                    GetProductByCate(id);
                }
                else
                {
                    GetProducts();
                }
            }
            GetCartObj();
        }

        private void GetCartObj()
        {

            if (Session["cart"] != null)
            {
                btnCheckOut.Visible = true;
                CartObj cart = (CartObj)Session["cart"];
                CartDAO cartDAO = new CartDAO();
                List<CartItem> list = new List<CartItem>();
                foreach (int key in cart.items.Keys)
                {
                    cart.items.TryGetValue(key, out int quantity);
                    string img = cartDAO.getImage(key);
                    string namePro = cartDAO.getNamePro(key);
                    string color = cartDAO.getColorName(key);
                    float unitPrice = float.Parse(cartDAO.getPricePro(key));
                    CartItem cartItem = new CartItem(img, namePro, color, unitPrice, quantity);
                    list.Add(cartItem);
                }
                gvCart.DataSource = list;
                gvCart.DataBind();
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

        private void GetProductByCate(string idCate)
        {
            ProductDAO dao = new ProductDAO();
            List<Product> list = new List<Product>();
            list = dao.GetProductsByCate(idCate);
            dlProducts.DataSource = list;
            dlProducts.DataBind();
        }

        private void GetProducts()
        {
            ProductDAO dao = new ProductDAO();
            List<Product> list = new List<Product>();
            list = dao.GetProduct();
            dlProducts.DataSource = list;
            dlProducts.DataBind();

        }

        protected void lnkProduct_Click(object sender, EventArgs e)
        {
            id = ((LinkButton)sender).CommandArgument;
            GetProductByCate(id);
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

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"~\View\ViewCart.aspx");
        }
    }
}