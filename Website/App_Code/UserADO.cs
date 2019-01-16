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
            sqlQuery.AppendLine("OPEN SYMMETRIC KEY SymmetricKey1");
            sqlQuery.AppendLine("DECRYPTION BY CERTIFICATE Certificate1;");
            sqlQuery.AppendLine("SELECT Username, Password_encrypt, Role, FullName");
            sqlQuery.AppendLine("FROM Users");
            sqlQuery.AppendLine("WHERE Username = @paraUsername AND CONVERT(varchar, DecryptByKey(Password_encrypt)) = @paraPassword AND Role = @paraRole;");
            sqlQuery.AppendLine("CLOSE SYMMETRIC KEY SymmetricKey1;");

            da = new SqlDataAdapter(sqlQuery.ToString(), userConn);
            da.SelectCommand.Parameters.AddWithValue("@paraUsername", username);
            da.SelectCommand.Parameters.AddWithValue("@paraPassword", password);
            da.SelectCommand.Parameters.AddWithValue("@paraRole", role);

            User loginUser = new User();

            da.Fill(ds, "userTable");
            int noOfRow = ds.Tables["userTable"].Rows.Count;
            if (noOfRow > 0)
            {
                DataRow row = ds.Tables["userTable"].Rows[0];
                loginUser.userUsername = row["Username"].ToString();
                loginUser.userRole = row["Role"].ToString();
                loginUser.userFullName = row["FullName"].ToString();
            }
            else
            {
                loginUser = null;
            }
            return loginUser;
        }
        public User GetUserInfo(string fullName)
        {
            SqlConnection userConn = new SqlConnection(dbConnStr);

            SqlDataAdapter da;
            DataSet ds = new DataSet();

            StringBuilder sqlQuery = new StringBuilder();
            sqlQuery.AppendLine("SELECT *");
            sqlQuery.AppendLine("FROM Users");
            sqlQuery.AppendLine("WHERE FullName = @paraFullName");

            da = new SqlDataAdapter(sqlQuery.ToString(), userConn);
            da.SelectCommand.Parameters.AddWithValue("@paraFullName", fullName);

            User userInfo = new User();

            da.Fill(ds, "userTable");
            int noOfRow = ds.Tables["userTable"].Rows.Count;
            if (noOfRow > 0)
            {
                DataRow row = ds.Tables["userTable"].Rows[0];
                userInfo.userUsername = row["Username"].ToString();
                userInfo.userFullName = row["FullName"].ToString();
                userInfo.userEmail = row["Email"].ToString();
                userInfo.userRole = row["Role"].ToString();
                userInfo.userPhoneNo = row["PhoneNo"].ToString();
            }
            else
            {
                userInfo = null;
            }
            return userInfo;
        }
    }

}
