using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JewlryManager
{
    public class CartItem
    {
        public string Image { get; set; }
        public string NamePro { get; set; }
        public string Color { get; set; }
        public float UnitPrice { get; set; }
        public int Quantity { get; set; }


        public CartItem(string image, string namePro, string color, float unitPrice, int quantity)
        {
            Image = image;
            NamePro = namePro;
            Color = color;
            UnitPrice = unitPrice;
            Quantity = quantity;
        }
    }

}
