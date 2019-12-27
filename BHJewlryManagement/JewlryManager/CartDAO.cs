using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace JewlryManager
{
    public class CartDAO
    {
        public string getPricePro(int id)
        {
            string sql = "select PricePro from [Product] where IDPro=@id";
            SqlConnection con = DBUtilities.makeConnection();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                da.Fill(dt);
            }
            finally
            {
                con.Close();
            }
            return dt.Rows[0][0].ToString();
        }

        public string getNamePro(int id)
        {
            string sql = "select NamePro from [Product] where IDPro=@id";
            SqlConnection con = DBUtilities.makeConnection();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                da.Fill(dt);
            }
            finally
            {
                con.Close();
            }
            return dt.Rows[0][0].ToString();
        }

        public string getColorName(int id)
        {
            string sql = "select NameCol from [Product] inner join Color on [Product].IDCol = [Color].IDCol where IDPro=@id";
            SqlConnection con = DBUtilities.makeConnection();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                da.Fill(dt);
            }
            finally
            {
                con.Close();
            }
            return dt.Rows[0][0].ToString();
        }

        public string getIDProByNamePro(string name)
        {
            string sql = "select IDPro from [Product] where NamePro=@name";
            SqlConnection con = DBUtilities.makeConnection();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@name", name);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                da.Fill(dt);
            }
            finally
            {
                con.Close();
            }
            return dt.Rows[0][0].ToString();
        }

        public string getImage(int id)
        {
            string sql = "select Image from [Product] where IDPro=@id";
            SqlConnection con = DBUtilities.makeConnection();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                da.Fill(dt);
            }
            finally
            {
                con.Close();
            }
            return dt.Rows[0][0].ToString();
        }
        public bool storeOrderDetails(int iDOrdD, int iDPro, int quanOrdD)
        {
            string sql = "insert into [OrderDetails] values (@IDOrdD, @IDPro, @QuanOrdD)";
            SqlConnection con = DBUtilities.makeConnection();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@IDOrdD", iDOrdD);
            cmd.Parameters.AddWithValue("@IDPro", iDPro);
            cmd.Parameters.AddWithValue("@QuanOrdD", quanOrdD);
            int result;
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                result = cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
            return result > 0;

        }
        public bool storeOrder(string dateOrd, string iDAcc, float total)
        {
            string sql = " insert into [Order](DateOrd,IDAcc,TotalPrice) values (@DateOrd, @IDAcc, @Total)";
            SqlConnection con = DBUtilities.makeConnection();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@DateOrd", dateOrd);
            cmd.Parameters.AddWithValue("@IDAcc", iDAcc);
            cmd.Parameters.AddWithValue("@Total", total);
            int result;
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                result = cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
            return result > 0;
        }
        public string getMaxIDOrder(string nameAcc)
        {
            string sql = "select MAX(IDOrd) from [Order] inner join [Account]" +
                " on [Account].IDAcc = [Order].IDAcc where [Account].NameAcc=@nameAcc";
            SqlConnection con = DBUtilities.makeConnection();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@nameAcc", nameAcc);
            int count = 0;
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                count = (int)cmd.ExecuteScalar();
            }
            finally
            {
                con.Close();
            }
            return count.ToString();
        }

        public List<Order> GetOrders(string idAcc)
        {
            List<Order> list = new List<Order>();
            string sql = "select IDOrd, DateOrd, IDAcc, TotalPrice from [Order] where IDAcc=@ID";
            SqlConnection cnn = DBUtilities.makeConnection();
            SqlCommand cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.AddWithValue("@ID", idAcc);

            try
            {
                if (cnn.State == ConnectionState.Closed)
                {
                    cnn.Open();
                }
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    Order order = new Order();
                    order.IDOrd = int.Parse(rd["IDOrd"].ToString());
                    order.DateOrd = rd["DateOrd"].ToString();
                    order.IDAcc = rd["IDAcc"].ToString();
                    order.TotalPrice = float.Parse(rd["TotalPrice"].ToString());

                    list.Add(order);
                }
            }
            finally
            {
                cnn.Close();
            }
            return list;
        }

        public CartObj getOrderDetailById(int orderId)
        {
            CartObj cart = new CartObj();
            SqlConnection cnn = DBUtilities.makeConnection();
            string sql = "select IDPro, QuanOrdD from OrderDetails where IDOrdD=@id";
            SqlCommand cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.AddWithValue("@id", orderId);
            try
            {
                if (cnn.State == ConnectionState.Closed)
                {
                    cnn.Open();
                }
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    int id = rd.GetInt32(0);
                    int quantity = rd.GetInt32(1);
                    cart.PutToCart(id, quantity);
                }
            }
            finally
            {
                cnn.Close();
            }
            return cart;
        }

        public List<Product> GetOrderDetails(string idOrd)
        {
            List<Product> list = new List<Product>();
            CategoryDAO cateDao = new CategoryDAO();
            ColorDAO colorDAO = new ColorDAO();
            string sql = "select IDPro, IDCate, NamePro, PricePro from Product where IDPro IN " +
                "(select IDPro from OrderDetails where IDOrdD IN " +
                "(select IDOrd from [Order] where IDOrd=@ID))";
            SqlConnection cnn = DBUtilities.makeConnection();
            SqlCommand cmd = new SqlCommand(sql, cnn);
            cmd.Parameters.AddWithValue("@ID", idOrd);

            try
            {
                if (cnn.State == ConnectionState.Closed)
                {
                    cnn.Open();
                }
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    Product pro = new Product();
                    pro.IDPro = int.Parse(rd["IDPro"].ToString());
                    pro.IDCate = cateDao.GetCategoryName(rd["IDCate"].ToString());
                    pro.NamePro = rd["NamePro"].ToString();
                    pro.PricePro = float.Parse(rd["PricePro"].ToString());
                    list.Add(pro);
                }
            }
            finally
            {
                cnn.Close();
            }
            return list;
        }
    }
}
