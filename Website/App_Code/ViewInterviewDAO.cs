using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for ViewInterviewDAO
/// </summary>
namespace LACTWebsite
{
    public class ViewInterviewDAO
    {
        public CreateInterview getInterviewInfo(string interviewName)
        {
            //Get connection string from web.config
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

            SqlDataAdapter da;
            DataSet ds = new DataSet();

            //Create Adapter
            //WRITE SQL Statement to retrieve all columns from Customer by customer Id using query parameter
            StringBuilder sqlCommand = new StringBuilder();
            sqlCommand.AppendLine("Select * from CreateInterview where");
            sqlCommand.AppendLine("interviewName = @paraInterviewName");
            //***TO Simulate system error  *****
            // change custId in where clause to custId1 or 
            // change connection string in web config to a wrong file name  

            CreateInterview obj = new CreateInterview();   // create a customer instance

            SqlConnection myConn = new SqlConnection(DBConnect);
            da = new SqlDataAdapter(sqlCommand.ToString(), myConn);
            da.SelectCommand.Parameters.AddWithValue("paraInterviewName", interviewName);
            // fill dataset
            da.Fill(ds, "interviewTable");
            int rec_cnt = ds.Tables["interviewTable"].Rows.Count;
            if (rec_cnt > 0)
            {
                DataRow row = ds.Tables["interviewTable"].Rows[0];  // Sql command returns only one record
                obj.interviewName = row["interviewName"].ToString();
                obj.interviewStartDate = Convert.ToDateTime(row["startDate"]);
                obj.interviewEndDate = Convert.ToDateTime(row["endDate"]);
                obj.interviewLocation = row["location"].ToString();
                obj.interviewReminder = row["reminder"].ToString();
            }
            else
            {
                obj = null;
            }

            return obj;
        }
    }
}