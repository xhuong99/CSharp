using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace JewlryManager
{
    public class DBUtilities
    {
        public static SqlConnection makeConnection()
        {
            string strConnection = @"Data Source=. ; Initial Catalog=BHJewlryDB;  User ID=sa;Password=160412";
            return new SqlConnection(strConnection);
        } 
    }
}
