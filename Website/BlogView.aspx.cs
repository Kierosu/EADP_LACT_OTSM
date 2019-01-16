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

public partial class BlogView : System.Web.UI.Page
{
    string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
    int tripId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        tripId = Convert.ToInt32(Session["ssTripId"]);
        string adminNo = Session["ssUsername"].ToString();
        AddBlogs();
        if (2 + 2 == 4)
        {
            TripInformations myTD = new TripInformations();
            // If student belong to trip can Add blog
            DataSet ds = new DataSet();
            DataTable tdData = new DataTable();
            //
            // Step 3 :Create SQLcommand to select all columns from TDMaster by parameterised customer id
            //          where TD is not matured yet

            StringBuilder sqlStr = new StringBuilder();
            sqlStr.AppendLine("SELECT * From TripStudents");
            sqlStr.AppendLine("where Id = @paraId");

            // Step 4 :Instantiate SqlConnection instance and SqlDataAdapter instance

            SqlConnection myConn = new SqlConnection(DBConnect);
            SqlDataAdapter da = new SqlDataAdapter(sqlStr.ToString(), myConn);

            da.SelectCommand.Parameters.AddWithValue("paraId", tripId);

            // Step 6: fill dataset
            da.Fill(ds, "TableTD");


            // Step 7: Iterate the rows from TableTD above to create a collection of TD
            //         for this particular customer 

            int rec_cnt = ds.Tables["TableTD"].Rows.Count;
            if (rec_cnt > 0)
            {
                DataRow row = ds.Tables["TableTD"].Rows[0];
                int totalSlots = Convert.ToInt32(row["TripSlots"]);
                for (int i = 1; i <= totalSlots; i++)
                {
                    if (adminNo == row["student" + i.ToString()].ToString())
                    {
                        Button1.Visible = true;
                        Button2.Visible = true;
                    }
                }
            }
            else
            {

            }
        }
        

    }

    private void AddBlogs()
    {
        //Add into trips
        using (SqlConnection con = new SqlConnection(DBConnect))
        {
            SqlCommand cmd = new SqlCommand("Select * from blogs where TripId = @paraTripId", con);
            cmd.Parameters.AddWithValue("@paraTripId", tripId);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            GridViewTD.DataSource = rdr;
            GridViewTD.DataBind();
            con.Close();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["ssBlogTripId"] = Session["ssTripId"];
        Response.Redirect("BlogPost.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["ssBlogTripId"] = Session["ssTripId"];
        Response.Redirect("BlogEdit.aspx");
    }
}