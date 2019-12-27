using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JewlryManager
{
    public class Order
    {
        public int IDOrd { get; set; }
        public string DateOrd { get; set; }
        public string IDAcc { get; set; }
        public float TotalPrice { get; set; }
    }
}
