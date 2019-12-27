using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JewlryManager;

namespace BHJewlryManagement
{
    public partial class ViewCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                lnkLoginout.Text = "Login";
                lnkLoginout.Visible = true;
            }
            else if(Session["user"] != null)
            {
                Account acc = (Account)Session["user"];
                lnkLoginout.Text = "Logout";
                lnkLoginout.Visible = true;
                lnkProfile.Text = acc.NameAcc;
                lnkProfile.Visible = true;
            }
            if (!IsPostBack)
            {
                GetCategories();
                UpdateGridViewCart();
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
        private void UpdateGridViewCart()
        {
            if (Session["Cart"] != null)
            {
                CartObj cart = (CartObj)Session["Cart"];
                if (cart != null)
                {
                    Dictionary<int, int> items = cart.items;
                    if (items != null)
                    {
                        float total = 0;
                        List<CartItem> list = new List<CartItem>();
                        CartDAO dao = new CartDAO();
                        foreach (int key in items.Keys)
                        {
                            items.TryGetValue(key, out int quantity);
                            //key is IDPro
                            string img = dao.getImage(key);
                            string name = dao.getNamePro(key);
                            string color = dao.getColorName(key);
                            float unitPrice = float.Parse(dao.getPricePro(key));
                            float subtotal = quantity * unitPrice;
                            CartItem newItem = new CartItem(img, name, color, unitPrice, quantity);
                            list.Add(newItem);
                            total = total + subtotal;
                        }
                        lbTotal.Text = "" + total;
                        dl.DataSource = list;
                        dl.DataBind();

                    }
                }
            }
            else
            {
                Response.Redirect(@"~\View\ShoppingPage.aspx");
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            string namePro = ((Button)sender).CommandArgument;
            CartDAO dao = new CartDAO();
            int idPro = int.Parse(dao.getIDProByNamePro(namePro));
            if (Session["Cart"] != null)
            {
                CartObj cart = (CartObj)Session["Cart"];
                foreach (int item in cart.items.Keys)
                {
                    if (item.Equals(idPro))
                    {
                        cart.RemoveItemToCart(idPro);
                        break;
                    }
                }
                if (cart.items == null)
                {
                    cart = null;
                }
                Session["Cart"] = cart;
                UpdateGridViewCart();
            }
        }
        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                if (Session["Cart"] != null)
                {
                    CartObj cart = (CartObj)Session["Cart"];
                    CartDAO cartDAO = new CartDAO();
                    Account acc = (Account)Session["user"];
                    string idAcc = acc.IDAcc;
                    string date = DateTime.Now.ToString("MM/dd/yyyy");
                    float total = float.Parse(lbTotal.Text);
                    cartDAO.storeOrder(date, idAcc, total);
                    int iDOrd = int.Parse(cartDAO.getMaxIDOrder(acc.NameAcc));
                    foreach (int key in cart.items.Keys)
                    {
                        cart.items.TryGetValue(key, out int quan);
                        cartDAO.storeOrderDetails(iDOrd, key, quan);
                    }
                    Session.Remove("Cart");
                    UpdateGridViewCart();
                }
                else
                {
                    Response.Redirect(@"~\View\ShoppingPage.aspx");
                }
            }
            else
            {
                Response.Redirect(@"~\View\LoginPage.aspx");
            }
        }

        protected void btnSub_Click(object sender, EventArgs e)
        {
            CartObj cart = (CartObj)Session["Cart"];
            if (cart == null)
            {
                cart = new CartObj();
            }
            CartDAO dao = new CartDAO();
            string namePro = ((Button)sender).CommandArgument.ToString();
            cart.SubtractOneItemInCart(int.Parse(dao.getIDProByNamePro(namePro)));
            Session["Cart"] = cart;
            UpdateGridViewCart();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            CartObj cart = (CartObj)Session["Cart"];
            if (cart == null)
            {
                cart = new CartObj();
            }
            CartDAO dao = new CartDAO();
            string namePro = ((Button)sender).CommandArgument.ToString();
            cart.AddItemToCart(int.Parse(dao.getIDProByNamePro(namePro)), 1);
            Session["Cart"] = cart;
            UpdateGridViewCart();
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