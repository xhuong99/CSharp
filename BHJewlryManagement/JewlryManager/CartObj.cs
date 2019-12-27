using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JewlryManager
{
    public class CartObj
    {
        public CartObj()
        {
            items = new Dictionary<int, int>();
        }

        public Dictionary<int, int> items { get; set; }
        public float Total { get; set; }
        public int IsExistedItem(int id, DataTable dt)
        {
            int row = -1;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i][0].ToString().Equals(id.ToString()))
                {
                    row = i;
                }
            }
            return row;
        }
        public void AddItemToCart(int itemID, int quan)
        {
            if (items == null)
            {
                items = new Dictionary<int, int>();
            }
            if (items.TryGetValue(itemID, out int quantity))
            {
                items.Remove(itemID);
                quantity += quan;
            }
            else
            {
                quantity = quan;
            }
            //end if items.Key is existed
            //TryGetValue return bool

            items.Add(itemID, quantity);
        }
        public void SubtractOneItemInCart(int itemID)
        {
            if (items.TryGetValue(itemID, out int quantity))
            {
                if (quantity > 1)
                {
                    items.Remove(itemID);
                    items.Add(itemID, quantity - 1);
                }
            }
        }
        public void RemoveItemToCart(int itemID)
        {
            items.Remove(itemID);

            if (items.Count == 0)
            {
                items = null;
            }//delete empty cart
        }

        public void PutToCart(int id, int quantity)
        {
            this.items.Add(id, quantity);
        }

        public List<Product> GetCartDetail()    //Product in cart
        {
            if (items == null)
            {
                return null;
            }
            Total = 0;
            List<Product> products = new List<Product>();
            foreach (var key in items.Keys)
            {
                ProductDAO dao = new ProductDAO();
                Product pro = dao.GetProductByID(key.ToString());
                pro.QuanOrdD = items[key];
                pro.Total = pro.QuanOrdD * pro.PricePro;
                Total += pro.Total;
                products.Add(pro);
            }
            return products;
        }
    }
}
