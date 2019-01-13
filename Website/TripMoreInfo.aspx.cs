using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TripMoreInfo : System.Web.UI.Page
{
    string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

        SqlDataAdapter da;
        DataSet ds = new DataSet();

        //Create Adapter
        //WRITE SQL Statement to retrieve all columns from Customer by customer Id using query parameter
        StringBuilder sqlCommand = new StringBuilder();
        sqlCommand.AppendLine("Select * from TripInformation where");
        sqlCommand.AppendLine("Id = @paraId");
        //***TO Simulate system error  *****
        // change custId in where clause to custId1 or 
        // change connection string in web config to a wrong file name  

        SqlConnection myConn = new SqlConnection(DBConnect);
        da = new SqlDataAdapter(sqlCommand.ToString(), myConn);
        da.SelectCommand.Parameters.AddWithValue("paraId", 1);
        // fill dataset
        da.Fill(ds, "tripinfoTable");
        int rec_cnt = ds.Tables["tripinfoTable"].Rows.Count;
        if (rec_cnt > 0)
        {
            DataRow row = ds.Tables["tripinfoTable"].Rows[0];  // Sql command returns only one record
            lblTitle.Text = row["TripName"].ToString();
            lblTripType.Text = row["TripType"].ToString();
            lblCountry.Text = row["TripCountry"].ToString();
            lblLocation.Text = row["TripLocation"].ToString();
            lblSlots.Text = row["TripSlots"].ToString();
            lblStartDate.Text = row["TripStartDate"].ToString();
            lblEndDate.Text = row["TripEndDate"].ToString();
            lblTeacherInCharge.Text = row["TripTeacherInCharge"].ToString();
            lblPlaneFee.Text = row["TripPlaneFee"].ToString();
            lblInsuFee.Text = row["TripInsuFee"].ToString();
            lblAccoFee.Text = row["TripAccoFee"].ToString();
            lblDetails.Text = row["TripDetails"].ToString();        }
        else
        {

        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int currTripSlots = Convert.ToInt16(lblSlots.Text) - 1;
        StringBuilder sqlStr = new StringBuilder();
        // Execute NonQuery return an integer value
        SqlCommand sqlCmd = new SqlCommand();
        // Step1 : Create SQL insert command to add record to TDMaster using     

        //         parameterised query in values clause
        //
        sqlStr.AppendLine("UPDATE TripInformation SET TripSlots = @paraTripSlots");
        sqlStr.AppendLine("WHERE Id = @paraId");


        // Step 2 :Instantiate SqlConnection instance and SqlCommand instance

        SqlConnection myConn = new SqlConnection(DBConnect);

        sqlCmd = new SqlCommand(sqlStr.ToString(), myConn);

        // Step 3 : Add each parameterised query variable with value
        //          complete to add all parameterised queries
        sqlCmd.Parameters.AddWithValue("@paraId", 1);
        sqlCmd.Parameters.AddWithValue("@paraTripSlots", currTripSlots);

        // Step 4 Open connection the execute NonQuery of sql command   

        myConn.Open();
        sqlCmd.ExecuteNonQuery();

        // Step 5 :Close connection
        myConn.Close();
    }
}