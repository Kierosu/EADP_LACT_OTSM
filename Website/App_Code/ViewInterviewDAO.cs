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

        string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        public int deleteInterviewInfo(String interviewName)
        {

            StringBuilder sqlStr = new StringBuilder();
            int result = 0;    // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand();
            // Step1 : Create SQL insert command to add record to TDMaster using     

            //         parameterised query in values clause
            //
            sqlStr.AppendLine("DELETE FROM CreateInterview");
            sqlStr.AppendLine("WHERE interviewName = @paraInterviewName");

            // Step 2 :Instantiate SqlConnection instance and SqlCommand instance

            SqlConnection myConn = new SqlConnection(DBConnect);

            sqlCmd = new SqlCommand(sqlStr.ToString(), myConn);

            // Step 3 : Add each parameterised query variable with value
            //          complete to add all parameterised queries
            sqlCmd.Parameters.AddWithValue("@paraInterviewName", interviewName);

            // Step 4 Open connection the execute NonQuery of sql command   

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            // Step 5 :Close connection
            myConn.Close();

            return result;
        }

        public int updateInterview(String interviewName, DateTime interviewStartDate, DateTime interviewEndDate, string interviewLocation, string interviewReminder)
        {
            StringBuilder sqlStr = new StringBuilder();
            int result = 0;    // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand();
            // Step1 : Create SQL insert command to add record to TDMaster using     

            //         parameterised query in values clause
            //
            sqlStr.AppendLine("UPDATE CreateInterview set startDate = @paraInterviewStartDate, ");
            sqlStr.AppendLine("endDate = @paraInterviewEndDate, location = @paraLocation, reminder = @paraReminder");
            sqlStr.AppendLine("WHERE interviewName = @paraInterviewName");

            // Step 2 :Instantiate SqlConnection instance and SqlCommand instance

            SqlConnection myConn = new SqlConnection(DBConnect);

            sqlCmd = new SqlCommand(sqlStr.ToString(), myConn);

            // Step 3 : Add each parameterised query variable with value
            //          complete to add all parameterised queries
            sqlCmd.Parameters.AddWithValue("@paraInterviewName", interviewName);
            sqlCmd.Parameters.AddWithValue("@paraInterviewStartDate", interviewStartDate);
            sqlCmd.Parameters.AddWithValue("@paraInterviewEndDate", interviewEndDate);
            sqlCmd.Parameters.AddWithValue("@paraLocation", interviewLocation);
            sqlCmd.Parameters.AddWithValue("@paraReminder", interviewReminder);

            // Step 4 Open connection the execute NonQuery of sql command   

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            // Step 5 :Close connection
            myConn.Close();

            return result;
        }
    }
}