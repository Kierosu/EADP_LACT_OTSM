using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;

namespace LACTWebsite
{
    public class UserADO
    {
        string dbConnStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        public User Login(string username, string password, string role)
        {
            SqlConnection userConn = new SqlConnection(dbConnStr);

            SqlDataAdapter da;
            DataSet ds = new DataSet();

            StringBuilder sqlQuery = new StringBuilder();
            sqlQuery.AppendLine("SELECT Username, Password, Role, FullName");
            sqlQuery.AppendLine("FROM Users");
            sqlQuery.AppendLine("WHERE Username = @paraUsername AND Password = @paraPassword AND Role = @paraRole");

            da = new SqlDataAdapter(sqlQuery.ToString(), userConn);
            da.SelectCommand.Parameters.AddWithValue("paraUsername", username);
            da.SelectCommand.Parameters.AddWithValue("paraPassword", password);
            da.SelectCommand.Parameters.AddWithValue("paraRole", role);

            User loginUser = new User();

            da.Fill(ds, "userTable");
            int noOfRow = ds.Tables["userTable"].Rows.Count;
            if (noOfRow > 0)
            {
                DataRow row = ds.Tables["userTable"].Rows[0];
                loginUser.userUsername = row["Username"].ToString();
                loginUser.userPassword = row["Password"].ToString();
                loginUser.userRole = row["Role"].ToString();
                loginUser.userFullName = row["FullName"].ToString();
            }
            else
            {
                loginUser = null;
            }
            return loginUser;
        }
    }

}
