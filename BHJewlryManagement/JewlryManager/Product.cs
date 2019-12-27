using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JewlryManager
{
    public class Product
    {
        public int IDPro { get; set; }
        public string IDCate { get; set; }
        public string IDCol { get; set; }
        public string NamePro { get; set; }
        public float PricePro { get; set; }
        public string Image { get; set; }

        //This is used for get the Quantity of product(s)
        public int QuanOrdD { get; set; }

        //This is used for get the Total of product(s)
        public float Total { get; set; }
    }
}
