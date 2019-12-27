using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JewlryManager
{
    public class Account
    {
        public string IDAcc { get; set; }
        public string PassAcc { get; set; }
        public string EmailAcc { get; set; }
        public string NameAcc { get; set; }
        public string PhoneAcc { get; set; }
        public string AddrAcc { get; set; }
        public bool GenAcc { get; set; }
        public bool IsAdmin { get; set; }

        public Account()
        {

        }
    }
}
