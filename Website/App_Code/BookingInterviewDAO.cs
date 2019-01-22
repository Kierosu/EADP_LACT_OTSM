using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for BookInterviewDAO
/// </summary>

namespace LACTWebsite
{
    public class BookingInterviewDAO
    {
        // Place the DBConnect to class variable to be shared by all the methodsin this class
        string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        public int BookingInterview(string interviewName, string interviewDate, string userUsername, string userAllergy, string userDietRestrict, string userMedication, string userFirstTimeApply, string userNationality)
        {

            StringBuilder sqlStr = new StringBuilder();
            int result = 0;    // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand();
            // Step1 : Create SQL insert command to add record to TDMaster using     

            //         parameterised query in values clause
            //
            sqlStr.AppendLine("INSERT INTO BookingInterview (interviewName, interviewDate, Username, allergy, medication, ");
            sqlStr.AppendLine("dietRestrict, nationality, firstTimeApply)");
            sqlStr.AppendLine("VALUES (@paraInterviewName, @paraInterviewDate, @paraUsername, @paraAllergy, @paraMedication, ");
            sqlStr.AppendLine("@paraDietRestrict, @paraNationality, @paraFirstTimeApply)");

            // Step 2 :Instantiate SqlConnection instance and SqlCommand instance

            SqlConnection myConn = new SqlConnection(DBConnect);

            sqlCmd = new SqlCommand(sqlStr.ToString(), myConn);

            // Step 3 : Add each parameterised query variable with value
            //          complete to add all parameterised queries
            sqlCmd.Parameters.AddWithValue("@paraInterviewName", interviewName);
            sqlCmd.Parameters.AddWithValue("@paraInterviewDate", interviewDate);
            sqlCmd.Parameters.AddWithValue("@paraUsername", userUsername);
            sqlCmd.Parameters.AddWithValue("@paraAllergy", userAllergy);
            sqlCmd.Parameters.AddWithValue("@paraMedication", userMedication);
            sqlCmd.Parameters.AddWithValue("@paraDietRestrict", userDietRestrict);
            sqlCmd.Parameters.AddWithValue("@paraNationality", userNationality);
            sqlCmd.Parameters.AddWithValue("@paraFirstTimeApply", userFirstTimeApply);

            // Step 4 Open connection the execute NonQuery of sql command   

            myConn.Open();
            result = sqlCmd.ExecuteNonQuery();

            // Step 5 :Close connection
            myConn.Close();

            return result;
        }

        public List<BookingInterview> getBookedInterview(string interviewName)
        {
            // Step 2 : declare a list to hold collection of customer's timeDeposit
            //           DataSet instance and dataTable instance 

            List<BookingInterview> bookingList = new List<BookingInterview>();
            DataSet ds = new DataSet();
            DataTable tdData = new DataTable();
            //
            // Step 3 :Create SQLcommand to select all columns from TDMaster by parameterised customer id
            //          where TD is not matured yet

            StringBuilder sqlStr = new StringBuilder();
            sqlStr.AppendLine("SELECT BookingInterview.interviewName, CreateInterview.interviewName, Users.Username");
            sqlStr.AppendLine("FROM BookingInterview");
            sqlStr.AppendLine("INNER JOIN CreateInterview ON BookingInterview.interviewName = CreateInterview.interviewName");
            sqlStr.AppendLine("INNER JOIN Users ON BookingInterview.Username = Users.Username");

            // Step 4 :Instantiate SqlConnection instance and SqlDataAdapter instance

            SqlConnection myConn = new SqlConnection(DBConnect);
            SqlDataAdapter da = new SqlDataAdapter(sqlStr.ToString(), myConn);

            // Step 5 :add value to parameter 

            da.SelectCommand.Parameters.AddWithValue("paraInterviewName", interviewName);

            // Step 6: fill dataset
            da.Fill(ds, "TableBooking");

            // Step 7: Iterate the rows from TableTD above to create a collection of TD
            //         for this particular customer 

            int rec_cnt = ds.Tables["TableBooking"].Rows.Count;
            if (rec_cnt > 0)
            {
                foreach (DataRow row in ds.Tables["TableBooking"].Rows)
                {
                    BookingInterview allBooking = new BookingInterview();

                    // Step 8 Set attribute of timeDeposit instance for each row of record in TableTD

                    allBooking.interviewName = row["interviewName"].ToString();
                    allBooking.interviewDate = row["interviewDate"].ToString();
                    allBooking.userUsername = row["Username"].ToString();
                    allBooking.userAllergy = row["allergy"].ToString();
                    allBooking.userMedication = row["medication"].ToString();
                    allBooking.userDietRestrict = row["dietRestrict"].ToString();
                    allBooking.userNationality = row["nationality"].ToString();
                    allBooking.userFirstTimeApply = row["firstTimeApply"].ToString();
                    allBooking.userFullName = row["FullName"].ToString();
                    allBooking.userDiploma = row["Diploma"].ToString();
                    allBooking.userGPA = Convert.ToDecimal(row["GPA"]);

                    //  Step 9: Add each timeDeposit instance to array list
                    bookingList.Add(allBooking);
                }
            }
            else
            {
                bookingList = null;
            }

            return bookingList;
        }
    }
}