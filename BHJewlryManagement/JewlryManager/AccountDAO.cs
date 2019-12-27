using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JewlryManager
{
    public class AccountDAO
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

        public bool CheckDuplicated(string id)
        {
            try
            {
                Open();
                string sql = "Select IDAcc from Account where IDAcc=@ID";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.AddWithValue("@ID", id);
                rd = cmd.ExecuteReader();
                return rd.HasRows;
            }
            finally
            {
                Close();
            }
        }

        public Account CheckLogin(string id, string pass)
        {
            try
            {
                Open();
                string sql = "Select IDAcc, NameAcc, IsAdmin, AddrAcc, PhoneAcc, GenAcc, EmailAcc from Account where IDAcc=@ID and PassAcc=@Pass";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.AddWithValue("@ID", id);
                cmd.Parameters.AddWithValue("@Pass", pass);
                rd = cmd.ExecuteReader();
                Account user = new Account();
                if (rd.Read())
                {
                    user.IDAcc = rd.GetString(0);
                    user.NameAcc = rd.GetString(1);
                    user.IsAdmin = rd.GetBoolean(2);
                    user.AddrAcc = rd.GetString(3);
                    user.PhoneAcc = rd.GetString(4);
                    user.GenAcc = rd.GetBoolean(5);
                    user.EmailAcc = rd.GetString(6);
                    user.PassAcc = pass;
                    return user;
                }
            }
            finally
            {
                Close();
            }
            return null;
        }

        public bool CreateAccount(Account user)
        {
            try
            {
                Open();
                string sql = "Insert into Account values (@ID,@Pass,@Email,@Name,@Phone,@Address,@Gen,@Ad)";
                cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.AddWithValue("@ID", user.IDAcc);
                cmd.Parameters.AddWithValue("@Pass", user.PassAcc);
                cmd.Parameters.AddWithValue("@Email", user.EmailAcc);
                cmd.Parameters.AddWithValue("@Name", user.NameAcc);
                cmd.Parameters.AddWithValue("@Phone", user.PhoneAcc);
                cmd.Parameters.AddWithValue("@Address", user.AddrAcc);
                cmd.Parameters.AddWithValue("@Gen", user.GenAcc);
                cmd.Parameters.AddWithValue("@Ad", user.IsAdmin);
                int result = cmd.ExecuteNonQuery();
                return (result > 0);
            }
            finally
            {
                Close();
            }
        }
    }
}
