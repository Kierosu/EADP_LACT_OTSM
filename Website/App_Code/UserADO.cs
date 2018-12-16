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
        public void Login(string username, string password)
        {
            SqlConnection userConn = new SqlConnection(dbConnStr);

            SqlDataAdapter da;
            DataSet ds = new DataSet();

            StringBuilder sqlQuery = new StringBuilder();
            sqlQuery.AppendLine("SELECT @paraUsername, @paraPassword");
            sqlQuery.AppendLine("FROM User");

            da = new SqlDataAdapter(sqlQuery.ToString(), userConn);
            da.SelectCommand.Parameters.AddWithValue("paraUsername", username);
            da.SelectCommand.Parameters.AddWithValue("paraPassword", password);

            da.Fill(ds, "userTable");
            int noOfRow = ds.Tables["userTable"].Rows.Count;
            if (noOfRow > 0)
            {

            }
            else
            {

            }
        }
    }

}
