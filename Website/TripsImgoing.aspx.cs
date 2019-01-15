﻿using System;
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

                    TripInformations myTD = new TripInformations();
                    for (int i = 0; i < totalSlots; i++)
                    {
                        if (adminNo == row["students" + totalSlots.ToString()].ToString())
                        {
                            myTD.Id = Convert.ToInt32(row["Id"]);
                        }
                    }
                    // Step 8 Set attribute of timeDeposit instance for each row of record in TableTD
                }
            }
            else
            {
                tdList = null;
            }
        }

        
    }

}