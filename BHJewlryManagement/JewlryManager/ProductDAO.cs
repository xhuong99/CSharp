using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JewlryManager
{
    public class ProductDAO
    {
        private SqlConnection cnn;
        private SqlCommand cmd;
        private SqlDataReader rd;

        private void Open()
        {
            cnn = DBUtilities.makeConnection();
            cnn.Open();
            if (cnn.State == System.Data.ConnectionState.Closed)
            {
                cnn.Open();
            }
        }

        private void Close()
        {
            if (rd != null)
            {
                rd.Close();
            }
            if (cnn != null)
            {
                cnn.Close();
            }
        }

        public List<Product> GetProduct()
        {
            List<Product> list = new List<Product>();
            CategoryDAO dao = new CategoryDAO();
            ColorDAO colorDAO = new ColorDAO();
            try
            {
                Open();
                string sql = "select IDPro, IDCate, IDCol, NamePro, PricePro, Image from Product";
                cmd = new SqlCommand(sql, cnn);
                rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    Product pro = new Product();
                    pro.IDPro = int.Parse(rd["IDPro"].ToString());
                    pro.IDCate = dao.GetCategoryName(rd["IDCate"].ToString());
                    pro.IDCol = colorDAO.GetColor(rd["IDCol"].ToString());
                    pro.NamePro = rd["NamePro"].ToString();
                    pro.PricePro = float.Parse(rd["PricePro"].ToString());
                    pro.Image = rd["Image"].ToString();
                    list.Add(pro);
                }
            }
            finally
            {
                Close();
            }
            return list;
        }

        public bool DeleteProduct(int id)
        {
            try
            {
                Open();
                string sql = "Delete from Product where IDPro=@ID";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.AddWithValue("@ID", id);
                int result = cmd.ExecuteNonQuery();
                return result > 0;
            }
            finally
            {
                Close();
            }
        }

        public bool UpdateProduct(Product p)
        {
            try
            {
                Open();
                string sql = "Update Product Set IDCate=@IDCate, IDCol=@IDCol, NamePro=@Name, PricePro=@Price where IDPro=@ID";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.AddWithValue("@IDCate", p.IDCate);
                cmd.Parameters.AddWithValue("@IDCol", p.IDCol);
                cmd.Parameters.AddWithValue("@Name", p.NamePro);
                cmd.Parameters.AddWithValue("@Price", p.PricePro);
                cmd.Parameters.AddWithValue("@ID", p.IDPro);
                int result = cmd.ExecuteNonQuery();
                return result > 0;
            }
            finally
            {
                Close();
            }
        }

        public bool AddNewProduct(Product p)
        {
            try
            {
                Open();
                string sql = "Insert Into Product Values(@ID,@IDCate,@IDCol,@Name,@Price)";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.AddWithValue("@ID", p.IDPro);
                cmd.Parameters.AddWithValue("@IDCate", p.IDCate);
                cmd.Parameters.AddWithValue("@IDCol", p.IDCol);
                cmd.Parameters.AddWithValue("@Name", p.NamePro);
                cmd.Parameters.AddWithValue("@Price", p.PricePro);
                int result = cmd.ExecuteNonQuery();
                return result > 0;
            }
            finally
            {
                Close();
            }
        }

        public List<Product> SearchProductByName(string searchValue)
        {
            List<Product> list = new List<Product>();
            CategoryDAO dao = new CategoryDAO();
            ColorDAO colorDAO = new ColorDAO();
            try
            {
                Open();
                string sql = "Select IDPro, IDCate, IDCol, NamePro, PricePro from Product where NamePro like @Search";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.AddWithValue("@Search", "%" + searchValue + "%");
                rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    Product pro = new Product();
                    pro.IDPro = int.Parse(rd["IDPro"].ToString());
                    pro.IDCate = dao.GetCategoryName(rd["IDCate"].ToString());
                    pro.IDCol = colorDAO.GetColor(rd["IDCol"].ToString());
                    pro.NamePro = rd["NamePro"].ToString();
                    pro.PricePro = float.Parse(rd["PricePro"].ToString());

                    list.Add(pro);
                }
            }
            finally
            {
                Close();
            }
            return list;
        }

        public List<Product> GetProductsByCate(string id)
        {
            List<Product> list = new List<Product>();
            CategoryDAO dao = new CategoryDAO();
            ColorDAO colorDAO = new ColorDAO();
            try
            {
                Open();
                string sql = "Select IDPro, IDCate, IDCol, NamePro, PricePro, Image from Product where IDCate=@ID";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.AddWithValue("@ID", id);
                rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    Product pro = new Product();
                    pro.IDPro = int.Parse(rd["IDPro"].ToString());
                    pro.IDCate = dao.GetCategoryName(rd["IDCate"].ToString());
                    pro.IDCol = colorDAO.GetColor(rd["IDCol"].ToString());
                    pro.NamePro = rd["NamePro"].ToString();
                    pro.PricePro = float.Parse(rd["PricePro"].ToString());
                    pro.Image = rd["Image"].ToString();
                    list.Add(pro);
                }
            }
            finally
            {
                Close();
            }
            return list;
        }

        public Product GetProductByID(string id)
        {
            CategoryDAO dao = new CategoryDAO();
            ColorDAO colorDAO = new ColorDAO();
            try
            {
                Open();
                string sql = "Select IDPro, IDCate, IDCol, NamePro, PricePro, Image from Product where IDPro=@ID";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.AddWithValue("@ID", id);
                rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    Product pro = new Product();
                    pro.IDPro = int.Parse(rd["IDPro"].ToString());
                    pro.IDCate = dao.GetCategoryName(rd["IDCate"].ToString());
                    pro.IDCol = colorDAO.GetColor(rd["IDCol"].ToString());
                    pro.NamePro = rd["NamePro"].ToString();
                    pro.PricePro = float.Parse(rd["PricePro"].ToString());
                    pro.Image = rd["Image"].ToString();
                    return pro;
                }
            }
            finally
            {
                Close();
            }
            return null;
        }
    }
}
