using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Services;

namespace LACTWebsite
{
    public class NotificationsADO
    {
        string dbConnStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

        public List<AutoNoti> GetAutoDataList(string username)
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

            List<AutoNoti> autoNotiList = new List<AutoNoti>();

            da.Fill(ds, "autoNotiTable");
            int noOfRow = ds.Tables["autoNotiTable"].Rows.Count;
            if (noOfRow > 0)
            {
                foreach (DataRow row in ds.Tables["autoNotiTable"].Rows)
                {
                    AutoNoti autoNotiUser = new AutoNoti();
                    autoNotiUser.autoUsername = row["Username"].ToString();
                    autoNotiUser.autoID = Convert.ToInt32(row["autoNotiId"]);
                    autoNotiUser.autoEvent = row["autoEvent"].ToString();
                    autoNotiUser.autoEventValue = row["autoEventValue"].ToString();
                    autoNotiUser.autoSubject = row["autoSubject"].ToString();
                    autoNotiUser.autoMessage = row["autoMessage"].ToString();
                    autoNotiList.Add(autoNotiUser);
                } 
            }
            else
            {
                autoNotiList = null;
            }
            return autoNotiList;
        }

        public int AddAutoNoti(string username, string theEvent, string eventValue, string message, string subject)
        {
            SqlConnection userConn = new SqlConnection(dbConnStr);

            StringBuilder sqlQuery = new StringBuilder();
            sqlQuery.AppendLine("INSERT INTO AutoNotifications(Username, autoEvent, autoEventValue, autoMessage, autoSubject)");
            sqlQuery.AppendLine("VALUES (@paraUsername, @paraEvent, @paraEventValue, @paraMessage, @paraSubject)");

            SqlCommand sqlCmd = new SqlCommand(sqlQuery.ToString(), userConn);
            sqlCmd.Parameters.AddWithValue("paraUsername", username);
            sqlCmd.Parameters.AddWithValue("paraEvent", theEvent);
            sqlCmd.Parameters.AddWithValue("paraEventValue", eventValue);
            sqlCmd.Parameters.AddWithValue("paraMessage", message);
            sqlCmd.Parameters.AddWithValue("paraSubject", subject);

            userConn.Open();

            int result = sqlCmd.ExecuteNonQuery();

            userConn.Close();

            return result;
        }

        public AutoNoti GetAutoDataByID(string username, int id)
        {
            SqlConnection userConn = new SqlConnection(dbConnStr);

            SqlDataAdapter da;
            DataSet ds = new DataSet();

            StringBuilder sqlQuery = new StringBuilder();
            sqlQuery.AppendLine("SELECT *");
            sqlQuery.AppendLine("FROM AutoNotifications");
            sqlQuery.AppendLine("WHERE Username = @paraUsername AND autoNotiId = @paraAutoNotiId");

            da = new SqlDataAdapter(sqlQuery.ToString(), userConn);
            da.SelectCommand.Parameters.AddWithValue("paraUsername", username);
            da.SelectCommand.Parameters.AddWithValue("paraAutoNotiId", id);

            AutoNoti autoNotiGet = new AutoNoti();

            da.Fill(ds, "autoNotiTable");
            int noOfRow = ds.Tables["autoNotiTable"].Rows.Count;
            if (noOfRow > 0)
            {
                DataRow row = ds.Tables["autoNotiTable"].Rows[0];
                autoNotiGet.autoUsername = row["Username"].ToString();
                autoNotiGet.autoID = Convert.ToInt32(row["autoNotiId"]);
                autoNotiGet.autoEvent = row["autoEvent"].ToString();
                autoNotiGet.autoEventValue = row["autoEventValue"].ToString();
                autoNotiGet.autoSubject = row["autoSubject"].ToString();
                autoNotiGet.autoMessage = row["autoMessage"].ToString();               
            }
            else
            {
                autoNotiGet = null;
            }
            return autoNotiGet;
        }

        public int UpdateAutoNoti(string username, string theEvent, string eventValue, string message, string subject, int id)
        {
            SqlConnection userConn = new SqlConnection(dbConnStr);

            StringBuilder sqlQuery = new StringBuilder();
            sqlQuery.AppendLine("UPDATE AutoNotifications");
            sqlQuery.AppendLine("SET autoEvent = @paraEvent, autoEventValue = @paraEventValue, autoMessage = @paraMessage, autoSubject = @paraSubject");
            sqlQuery.AppendLine("WHERE Username = @paraUsername AND autoNotiId = @paraAutoNotiId");

            SqlCommand sqlCmd = new SqlCommand(sqlQuery.ToString(), userConn);
            sqlCmd.Parameters.AddWithValue("paraUsername", username);
            sqlCmd.Parameters.AddWithValue("paraEvent", theEvent);
            sqlCmd.Parameters.AddWithValue("paraEventValue", eventValue);
            sqlCmd.Parameters.AddWithValue("paraMessage", message);
            sqlCmd.Parameters.AddWithValue("paraSubject", subject);
            sqlCmd.Parameters.AddWithValue("paraAutoNotiId", id);

            userConn.Open();

            int result = sqlCmd.ExecuteNonQuery();

            userConn.Close();

            return result;
        }

        public int DeleteAutoNoti(string username, int id)
        {
            SqlConnection userConn = new SqlConnection(dbConnStr);

            StringBuilder sqlQuery = new StringBuilder();
            sqlQuery.AppendLine("DELETE FROM AutoNotifications");
            sqlQuery.AppendLine("WHERE Username = @paraUsername AND autoNotiId = @paraAutoNotiId");

            SqlCommand sqlCmd = new SqlCommand(sqlQuery.ToString(), userConn);
            sqlCmd.Parameters.AddWithValue("paraUsername", username);
            sqlCmd.Parameters.AddWithValue("paraAutoNotiId", id);

            userConn.Open();

            int result = sqlCmd.ExecuteNonQuery();

            userConn.Close();

            return result;
        }
        public void SendMail(string userEmail, string message, string sender, string subject)
        {
            MailMessage mail = new MailMessage();

            mail.From = new MailAddress("eadplact2018@gmail.com");
            mail.To.Add(new MailAddress(userEmail));

            mail.Subject = subject;
            mail.IsBodyHtml = true;
            mail.Body = "<h4>This is sent by " + sender + ".</h4><p>" + message + "</p>";

            var mailclient = new SmtpClient();
            mailclient.Host = "smtp.gmail.com";
            mailclient.Port = 587;

            mailclient.EnableSsl = true;

            mailclient.Credentials = new System.Net.NetworkCredential("eadplact2018@gmail.com", "eadp2k19lact");
            mailclient.Send(mail);
        }
        
    }
}
