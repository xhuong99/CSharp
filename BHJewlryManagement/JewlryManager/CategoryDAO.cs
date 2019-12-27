using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JewlryManager
{
    public class CategoryDAO
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

        public string GetCategoryName(string id)
        {
            try
            {
                Open();
                string sql = "Select NameCate from Category where IDCate=@ID";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.AddWithValue("@ID", id);
                rd = cmd.ExecuteReader();
                string name;
                if (rd.Read())
                {
                    name = rd.GetString(0);
                    return name;
                }
            }
            finally
            {
                Close();
            }
            return null;
        }

        public List<Category> GetCategories()
        {
            List<Category> list = new List<Category>();
            try
            {
                Open();
                string sql = "Select IDCate, NameCate from Category";
                cmd = new SqlCommand(sql, cnn);
                rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    Category cate = new Category();
                    cate.IDCate = rd.GetInt32(0);
                    cate.NameCate = rd.GetString(1);
                    list.Add(cate);
                }
                
            }
            finally
            {
                Close();
            }
            return list;
        }

        public int GetCategoryID(string name)
        {
            try
            {
                Open();
                string sql = "Select IDCate from Category where NameCate=@Name";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.AddWithValue("@Name", name);
                rd = cmd.ExecuteReader();
                int id;
                if (rd.Read())
                {
                    id = rd.GetInt32(0);
                    return id;
                }
            }
            finally
            {
                Close();
            }
            return 0;
        }
    }
}
