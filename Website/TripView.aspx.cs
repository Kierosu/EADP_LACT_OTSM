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

public partial class TripView : System.Web.UI.Page
{
    string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        List<TripInformations> tdList = new List<TripInformations>();
        DataSet ds = new DataSet();
        DataTable tdData = new DataTable();
        //
        // Step 3 :Create SQLcommand to select all columns from TDMaster by parameterised customer id
        //          where TD is not matured yet

        StringBuilder sqlStr = new StringBuilder();
        sqlStr.AppendLine("SELECT * From TripInformation");

        // Step 4 :Instantiate SqlConnection instance and SqlDataAdapter instance

        SqlConnection myConn = new SqlConnection(DBConnect);
        SqlDataAdapter da = new SqlDataAdapter(sqlStr.ToString(), myConn);

        // Step 5 :add value to parameter 


        // Step 6: fill dataset
        da.Fill(ds, "TableTD");

        // Step 7: Iterate the rows from TableTD above to create a collection of TD
        //         for this particular customer 

        int rec_cnt = ds.Tables["TableTD"].Rows.Count;
        if (rec_cnt > 0)
        {
            foreach (DataRow row in ds.Tables["TableTD"].Rows)
            {
                TripInformations myTD = new TripInformations();

                // Step 8 Set attribute of timeDeposit instance for each row of record in TableTD

                myTD.TripName = row["TripName"].ToString();
                myTD.TripType = row["TripType"].ToString();
                myTD.TripCountry = row["TripName"].ToString();
                myTD.TripLocation = row["TripName"].ToString();
                myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                myTD.TripSlots = row["TripSlots"].ToString();
                //  Step 9: Add each timeDeposit instance to array list
                tdList.Add(myTD);
            }
        }
        else
        {
            tdList = null;
        }

        GridViewTD.DataSource = tdList;
        GridViewTD.DataBind();
    }

    protected void GridViewTD_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("TripMoreInfo.aspx");
    }
}