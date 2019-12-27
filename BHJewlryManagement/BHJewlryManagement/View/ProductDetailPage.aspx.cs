using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JewlryManager;

namespace BHJewlryManagement
{
    public partial class ProductDetailPage : System.Web.UI.Page
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
                ShowDetailsProduct();
                txtQuantity.Text = "1";
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
                    CartItem cartItem = new CartItem(img,namePro,color,unitPrice,quantity);
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

        private void ShowDetailsProduct()
        {
            ProductDAO dao = new ProductDAO();
            string id = Request.QueryString["IDPro"];
            Product pro = dao.GetProductByID(id);
            lbName.Text = pro.NamePro;
            lbCate.Text = pro.IDCate;
            lbCol.Text = pro.IDCol;
            lbPrice.Text = pro.PricePro.ToString();
            imgItem.ImageUrl = pro.Image;
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

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            CartObj cart = (CartObj)Session["Cart"];
            if (cart == null)
            {
                cart = new CartObj();
            }
            string id = Request.QueryString["IDPro"];
            cart.AddItemToCart(int.Parse(id), int.Parse(txtQuantity.Text));
            Session["Cart"] = cart;
            GetCartObj();
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect(@"~\View\LoginPage.aspx");
            } else
            {
                Response.Redirect(@"~\View\ViewCart.aspx");
            }
        }
    }
}