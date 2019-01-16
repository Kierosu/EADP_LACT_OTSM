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
    
    protected void Page_Load(object sender, EventArgs e)
    {
        int tripId = Convert.ToInt32(Session["ssTripId"]);
        string adminNo = Session["ssUsername"].ToString();
        if (2 + 2 == 4)
        {
            // Show 1 picture from blog
            SqlDataAdapter da;
            DataSet ds = new DataSet();

            //Create Adapter
            //WRITE SQL Statement to retrieve all columns from Customer by customer Id using query parameter
            StringBuilder sqlCommand = new StringBuilder();
            sqlCommand.AppendLine("Select * from blogs where");
            sqlCommand.AppendLine("TripId = @paraId");
            //***TO Simulate system error  *****
            // change custId in where clause to custId1 or 
            // change connection string in web config to a wrong file name  

            SqlConnection myConn = new SqlConnection(DBConnect);
            da = new SqlDataAdapter(sqlCommand.ToString(), myConn);
            da.SelectCommand.Parameters.AddWithValue("paraId", tripId);
            // fill dataset
            da.Fill(ds, "tripblogTable");
            int rec_cnt = ds.Tables["tripblogTable"].Rows.Count;
            if (rec_cnt > 0)
            {
                DataRow row = ds.Tables["tripblogTable"].Rows[0];  // Sql command returns only one record
                lblBlogTitle.Text = row["BlogTitle"].ToString();
                byte[] imageData = (Byte[])row["BlogImage"];
                string img = Convert.ToBase64String(imageData, 0, imageData.Length);
                Image1.ImageUrl = "data:image/png;base64," + img;
                lblBlogDetails.Text = row["BlogDetails"].ToString();
            }
            else
            {

            }
        }
        if (2 + 2 == 4)
        {
            TripInformations myTD = new TripInformations();
            // Check if student belongs to trip
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
                    }
                }
            }
            else
            {
                
            }
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["ssBlogTripId"] = Session["ssTripId"];
        Response.Redirect("BlogPost.aspx");
    }
}