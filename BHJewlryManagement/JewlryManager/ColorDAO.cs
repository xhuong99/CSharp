using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JewlryManager
{
    public class ColorDAO
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

        public string GetColor(string id)
        {
            try
            {
                Open();
                string sql = "Select NameCol from Color where IDCol=@ID";
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

        public List<Color> GetColors()
        {
            List<Color> list = new List<Color>();
            try
            {
                Open();
                string sql = "Select IDCol, NameCol from Color";
                cmd = new SqlCommand(sql, cnn);
                rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    Color color = new Color();
                    color.IDCol = rd.GetInt32(0);
                    color.NameCol = rd.GetString(1);
                    list.Add(color);
                }
            }
            finally
            {
                Close();
            }
            return list;
        }
    }
}
