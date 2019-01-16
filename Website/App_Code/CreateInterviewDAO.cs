using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Collections.Generic;

namespace LACTWebsite
{
    public class CreateInterviewDAO
    {
        // Place the DBConnect to class variable to be shared by all the methodsin this class
        string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        public int CreateInterview(String interviewName, DateTime interviewStartDate, DateTime interviewEndDate, string interviewLocation, string interviewReminder)
        {

            StringBuilder sqlStr = new StringBuilder();
            int result = 0;    // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand();
            // Step1 : Create SQL insert command to add record to TDMaster using     

            //         parameterised query in values clause
            //
            sqlStr.AppendLine("INSERT INTO CreateInterview (interviewName, startDate, endDate, location, ");
            sqlStr.AppendLine("reminder)");
            sqlStr.AppendLine("VALUES (@paraInterviewName,@paraInterviewStartDate, @paraInterviewEndDate, @paraLocation,");
            sqlStr.AppendLine("@paraReminder)");


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