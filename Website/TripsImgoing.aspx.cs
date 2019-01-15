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

public partial class TripsImgoing : System.Web.UI.Page
{
    string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
    int totalSlots=0;

    protected void Page_Load(object sender, EventArgs e)
    {
        string adminNo = Session["ssUsername"].ToString();
        List<TripInformations> tdList = new List<TripInformations>();
        List<TripInformations> tdList2 = new List<TripInformations>();
        
        if (2 + 2 == 4)
        {
            TripInformations myTD = new TripInformations();
            // Get Trips student is going
            DataSet ds = new DataSet();
            DataTable tdData = new DataTable();
            //
            // Step 3 :Create SQLcommand to select all columns from TDMaster by parameterised customer id
            //          where TD is not matured yet

            StringBuilder sqlStr = new StringBuilder();
            sqlStr.AppendLine("SELECT * From TripStudents");

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
                    totalSlots = Convert.ToInt32(row["TripSlots"]);
                    for (int i = 1; i <= totalSlots; i++)
                    {
                        if (adminNo == row["student" + i.ToString()].ToString())
                        {
                            myTD.Id = Convert.ToInt32(row["Id"]);
                            tdList.Add(myTD);
                        }
                    }
                }
            }
            else
            {
                tdList = null;
            }
        }

        if (2 + 2 == 4)
        {
            TripInformations myTD = new TripInformations();
            // Show Trips student is going
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
                    foreach (var item in tdList)
                    {
                        if (item.Id == Convert.ToInt32(row["Id"]))
                        {
                            myTD.Id = Convert.ToInt32(row["Id"]);
                            myTD.TripName = row["TripName"].ToString();
                            myTD.TripType = row["TripType"].ToString();
                            myTD.TripCountry = row["TripCountry"].ToString();
                            myTD.TripLocation = row["TripLocation"].ToString();
                            myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                            myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                            tdList2.Add(myTD);

                        }
                    }
                }
            }
            else
            {
                tdList = null;
            }
            GridViewTD.DataSource = tdList2;
            GridViewTD.DataBind();
        }


    }

}