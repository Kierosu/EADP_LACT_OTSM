using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace LACTWebsite
{
    public class NotificationsADO
    {
        string dbConnStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        public AutoNoti GetAutoData(string username)
        {
            SqlConnection userConn = new SqlConnection(dbConnStr);

            SqlDataAdapter da;
            DataSet ds = new DataSet();

            StringBuilder sqlQuery = new StringBuilder();
            sqlQuery.AppendLine("SELECT *");
            sqlQuery.AppendLine("FROM AutoNotifications");
            sqlQuery.AppendLine("WHERE Username = @paraUsername");

            da = new SqlDataAdapter(sqlQuery.ToString(), userConn);
            da.SelectCommand.Parameters.AddWithValue("paraUsername", username);

            AutoNoti autoNotiUser = new AutoNoti();

            da.Fill(ds, "autoNotiTable");
            int noOfRow = ds.Tables["autoNotiTable"].Rows.Count;
            if (noOfRow > 0)
            {
                DataRow row = ds.Tables["autoNotiTable"].Rows[0];
                autoNotiUser.autoUsername = row["Username"].ToString();
                autoNotiUser.autoID = Convert.ToInt32(row["Id"]);
                autoNotiUser.autoEvent = row["Event"].ToString();
                autoNotiUser.autoSubject = row["Subject"].ToString();
                autoNotiUser.autoMessage = row["Message"].ToString();
            }
            else
            {
                autoNotiUser = null;
            }
            return autoNotiUser;
        }
    }
}
