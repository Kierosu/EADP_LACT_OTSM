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
        string adminNo = Session["ssUsername"].ToString();
        double gpa = 0;
        string diploma = "";
        string userYear = "";
        if (2 + 2 == 4)
        {
            TripInformations myTD = new TripInformations();
            // Extract student gpa, diploma and year
            DataSet ds = new DataSet();
            DataTable tdData = new DataTable();
            //
            // Step 3 :Create SQLcommand to select all columns from TDMaster by parameterised customer id
            //          where TD is not matured yet

            StringBuilder sqlStr = new StringBuilder();
            sqlStr.AppendLine("SELECT * From Users");
            sqlStr.AppendLine("where Username = @paraUsername");

            // Step 4 :Instantiate SqlConnection instance and SqlDataAdapter instance

            SqlConnection myConn = new SqlConnection(DBConnect);
            SqlDataAdapter da = new SqlDataAdapter(sqlStr.ToString(), myConn);

            da.SelectCommand.Parameters.AddWithValue("paraUsername", adminNo);

            // Step 6: fill dataset
            da.Fill(ds, "TableTD");


            // Step 7: Iterate the rows from TableTD above to create a collection of TD
            //         for this particular customer 

            int rec_cnt = ds.Tables["TableTD"].Rows.Count;
            if (rec_cnt > 0)
            {
                DataRow row = ds.Tables["TableTD"].Rows[0];
                gpa = Convert.ToDouble(row["GPA"]);
                diploma = row["Diploma"].ToString();
                userYear = row["userYear"].ToString();
            }
            else
            {

            }
        }
        if (2 + 2 == 4)
        {
            // Get all Trips Available
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
                    if(row["TripSlots"].ToString() != "0")
                    {
                        if (gpa > Convert.ToDouble(row["TripMinGPA"]))
                        {
                            if(diploma == row["DiplmaDIT"].ToString())
                            {
                                if(userYear == row["YearOne"].ToString())
                                {
                                    myTD.Id = Convert.ToInt16(row["Id"]);
                                    myTD.TripName = row["TripName"].ToString();
                                    myTD.TripType = row["TripType"].ToString();
                                    myTD.TripCountry = row["TripCountry"].ToString();
                                    myTD.TripLocation = row["TripLocation"].ToString();
                                    myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                                    myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                                    myTD.TripSlots = row["TripSlots"].ToString();
                                    tdList.Add(myTD);
                                }
                                else if (userYear == row["YearTwo"].ToString())
                                {
                                    myTD.Id = Convert.ToInt16(row["Id"]);
                                    myTD.TripName = row["TripName"].ToString();
                                    myTD.TripType = row["TripType"].ToString();
                                    myTD.TripCountry = row["TripCountry"].ToString();
                                    myTD.TripLocation = row["TripLocation"].ToString();
                                    myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                                    myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                                    myTD.TripSlots = row["TripSlots"].ToString();
                                    tdList.Add(myTD);
                                }
                                else if(userYear == row["YearThree"].ToString())
                                {
                                    myTD.Id = Convert.ToInt16(row["Id"]);
                                    myTD.TripName = row["TripName"].ToString();
                                    myTD.TripType = row["TripType"].ToString();
                                    myTD.TripCountry = row["TripCountry"].ToString();
                                    myTD.TripLocation = row["TripLocation"].ToString();
                                    myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                                    myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                                    myTD.TripSlots = row["TripSlots"].ToString();
                                    tdList.Add(myTD);
                                }
                            }
                            else if (diploma == row["DiplmaDBI"].ToString())
                            {
                                if (userYear == row["YearOne"].ToString())
                                {
                                    myTD.Id = Convert.ToInt16(row["Id"]);
                                    myTD.TripName = row["TripName"].ToString();
                                    myTD.TripType = row["TripType"].ToString();
                                    myTD.TripCountry = row["TripCountry"].ToString();
                                    myTD.TripLocation = row["TripLocation"].ToString();
                                    myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                                    myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                                    myTD.TripSlots = row["TripSlots"].ToString();
                                    tdList.Add(myTD);
                                }
                                else if (userYear == row["YearTwo"].ToString())
                                {
                                    myTD.Id = Convert.ToInt16(row["Id"]);
                                    myTD.TripName = row["TripName"].ToString();
                                    myTD.TripType = row["TripType"].ToString();
                                    myTD.TripCountry = row["TripCountry"].ToString();
                                    myTD.TripLocation = row["TripLocation"].ToString();
                                    myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                                    myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                                    myTD.TripSlots = row["TripSlots"].ToString();
                                    tdList.Add(myTD);
                                }
                                else if (userYear == row["YearThree"].ToString())
                                {
                                    myTD.Id = Convert.ToInt16(row["Id"]);
                                    myTD.TripName = row["TripName"].ToString();
                                    myTD.TripType = row["TripType"].ToString();
                                    myTD.TripCountry = row["TripCountry"].ToString();
                                    myTD.TripLocation = row["TripLocation"].ToString();
                                    myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                                    myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                                    myTD.TripSlots = row["TripSlots"].ToString();
                                    tdList.Add(myTD);
                                }
                            }
                            else if (diploma == row["DiplmaDCS"].ToString())
                            {
                                if (userYear == row["YearOne"].ToString())
                                {
                                    myTD.Id = Convert.ToInt16(row["Id"]);
                                    myTD.TripName = row["TripName"].ToString();
                                    myTD.TripType = row["TripType"].ToString();
                                    myTD.TripCountry = row["TripCountry"].ToString();
                                    myTD.TripLocation = row["TripLocation"].ToString();
                                    myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                                    myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                                    myTD.TripSlots = row["TripSlots"].ToString();
                                    tdList.Add(myTD);
                                }
                                else if (userYear == row["YearTwo"].ToString())
                                {
                                    myTD.Id = Convert.ToInt16(row["Id"]);
                                    myTD.TripName = row["TripName"].ToString();
                                    myTD.TripType = row["TripType"].ToString();
                                    myTD.TripCountry = row["TripCountry"].ToString();
                                    myTD.TripLocation = row["TripLocation"].ToString();
                                    myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                                    myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                                    myTD.TripSlots = row["TripSlots"].ToString();
                                    tdList.Add(myTD);
                                }
                                else if (userYear == row["YearThree"].ToString())
                                {
                                    myTD.Id = Convert.ToInt16(row["Id"]);
                                    myTD.TripName = row["TripName"].ToString();
                                    myTD.TripType = row["TripType"].ToString();
                                    myTD.TripCountry = row["TripCountry"].ToString();
                                    myTD.TripLocation = row["TripLocation"].ToString();
                                    myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                                    myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                                    myTD.TripSlots = row["TripSlots"].ToString();
                                    tdList.Add(myTD);
                                }
                            }
                            else if (diploma == row["DiplmaDSF"].ToString())
                            {
                                if (userYear == row["YearOne"].ToString())
                                {
                                    myTD.Id = Convert.ToInt16(row["Id"]);
                                    myTD.TripName = row["TripName"].ToString();
                                    myTD.TripType = row["TripType"].ToString();
                                    myTD.TripCountry = row["TripCountry"].ToString();
                                    myTD.TripLocation = row["TripLocation"].ToString();
                                    myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                                    myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                                    myTD.TripSlots = row["TripSlots"].ToString();
                                    tdList.Add(myTD);
                                }
                                else if (userYear == row["YearTwo"].ToString())
                                {
                                    myTD.Id = Convert.ToInt16(row["Id"]);
                                    myTD.TripName = row["TripName"].ToString();
                                    myTD.TripType = row["TripType"].ToString();
                                    myTD.TripCountry = row["TripCountry"].ToString();
                                    myTD.TripLocation = row["TripLocation"].ToString();
                                    myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                                    myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                                    myTD.TripSlots = row["TripSlots"].ToString();
                                    tdList.Add(myTD);
                                }
                                else if (userYear == row["YearThree"].ToString())
                                {
                                    myTD.Id = Convert.ToInt16(row["Id"]);
                                    myTD.TripName = row["TripName"].ToString();
                                    myTD.TripType = row["TripType"].ToString();
                                    myTD.TripCountry = row["TripCountry"].ToString();
                                    myTD.TripLocation = row["TripLocation"].ToString();
                                    myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                                    myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                                    myTD.TripSlots = row["TripSlots"].ToString();
                                    tdList.Add(myTD);
                                }
                            }
                            else if (diploma == row["DiplmaDFI"].ToString())
                            {
                                if (userYear == row["YearOne"].ToString())
                                {
                                    myTD.Id = Convert.ToInt16(row["Id"]);
                                    myTD.TripName = row["TripName"].ToString();
                                    myTD.TripType = row["TripType"].ToString();
                                    myTD.TripCountry = row["TripCountry"].ToString();
                                    myTD.TripLocation = row["TripLocation"].ToString();
                                    myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                                    myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                                    myTD.TripSlots = row["TripSlots"].ToString();
                                    tdList.Add(myTD);
                                }
                                else if (userYear == row["YearTwo"].ToString())
                                {
                                    myTD.Id = Convert.ToInt16(row["Id"]);
                                    myTD.TripName = row["TripName"].ToString();
                                    myTD.TripType = row["TripType"].ToString();
                                    myTD.TripCountry = row["TripCountry"].ToString();
                                    myTD.TripLocation = row["TripLocation"].ToString();
                                    myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                                    myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                                    myTD.TripSlots = row["TripSlots"].ToString();
                                    tdList.Add(myTD);
                                }
                                else if (userYear == row["YearThree"].ToString())
                                {
                                    myTD.Id = Convert.ToInt16(row["Id"]);
                                    myTD.TripName = row["TripName"].ToString();
                                    myTD.TripType = row["TripType"].ToString();
                                    myTD.TripCountry = row["TripCountry"].ToString();
                                    myTD.TripLocation = row["TripLocation"].ToString();
                                    myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                                    myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                                    myTD.TripSlots = row["TripSlots"].ToString();
                                    tdList.Add(myTD);
                                }
                            }
                            else if (diploma == row["DiplmaDBA"].ToString())
                            {
                                if (userYear == row["YearOne"].ToString())
                                {
                                    myTD.Id = Convert.ToInt16(row["Id"]);
                                    myTD.TripName = row["TripName"].ToString();
                                    myTD.TripType = row["TripType"].ToString();
                                    myTD.TripCountry = row["TripCountry"].ToString();
                                    myTD.TripLocation = row["TripLocation"].ToString();
                                    myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                                    myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                                    myTD.TripSlots = row["TripSlots"].ToString();
                                    tdList.Add(myTD);
                                }
                                else if (userYear == row["YearTwo"].ToString())
                                {
                                    myTD.Id = Convert.ToInt16(row["Id"]);
                                    myTD.TripName = row["TripName"].ToString();
                                    myTD.TripType = row["TripType"].ToString();
                                    myTD.TripCountry = row["TripCountry"].ToString();
                                    myTD.TripLocation = row["TripLocation"].ToString();
                                    myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                                    myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                                    myTD.TripSlots = row["TripSlots"].ToString();
                                    tdList.Add(myTD);
                                }
                                else if (userYear == row["YearThree"].ToString())
                                {
                                    myTD.Id = Convert.ToInt16(row["Id"]);
                                    myTD.TripName = row["TripName"].ToString();
                                    myTD.TripType = row["TripType"].ToString();
                                    myTD.TripCountry = row["TripCountry"].ToString();
                                    myTD.TripLocation = row["TripLocation"].ToString();
                                    myTD.TripStartDate = Convert.ToDateTime(row["TripStartDate"]);
                                    myTD.TripTeacherInCharge = row["TripTeacherInCharge"].ToString();
                                    myTD.TripSlots = row["TripSlots"].ToString();
                                    tdList.Add(myTD);
                                }
                            }
                        }
                        //  Step 9: Add each timeDeposit instance to array list
                    }
                }
            }
            else
            {
                tdList = null;
            }

            GridViewTD.DataSource = tdList;
            GridViewTD.DataBind();
        }
       
    }



    protected void GridViewTD_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int i = Convert.ToInt32(e.CommandArgument);
        GridViewRow row = GridViewTD.Rows[i];
        Session["ssTripId"] = row.Cells[0].Text;
        Response.Redirect("TripMoreInfo.aspx");
    }
}