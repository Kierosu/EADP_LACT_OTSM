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

public partial class BlogEAD : System.Web.UI.Page
{
    string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
    int blogId = 0;
    int tripId = 0;
    string adminNo = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        blogId = Convert.ToInt32(Session["ssId"]);
        tripId = Convert.ToInt32(Session["ssBlogTripId"]);
        adminNo = Session["ssUsername"].ToString();
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
                        
                    }
                }
            }
            else
            {

            }
        }
        if (2 + 2 == 4)
        {
            // Show 1 picture from blog
            SqlDataAdapter da;
            DataSet ds = new DataSet();

            //Create Adapter
            //WRITE SQL Statement to retrieve all columns from Customer by customer Id using query parameter
            StringBuilder sqlCommand = new StringBuilder();
            sqlCommand.AppendLine("Select * from blogs where");
            sqlCommand.AppendLine("Id = @paraId");
            //***TO Simulate system error  *****
            // change custId in where clause to custId1 or 
            // change connection string in web config to a wrong file name  

            SqlConnection myConn = new SqlConnection(DBConnect);
            da = new SqlDataAdapter(sqlCommand.ToString(), myConn);
            da.SelectCommand.Parameters.AddWithValue("paraId", blogId);
            // fill dataset
            da.Fill(ds, "tripblogTable");
            int rec_cnt = ds.Tables["tripblogTable"].Rows.Count;
            if (rec_cnt > 0)
            {
                DataRow row = ds.Tables["tripblogTable"].Rows[0];  // Sql command returns only one record
                if (!Page.IsPostBack)
                {
                    tbBlogTitle.Text = row["BlogTitle"].ToString();
                    tbBlogDetails.Text = row["BlogDetails"].ToString();
                }
            }
            else
            {

            }
        }


    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile == true)
        {
            string blogTitle = tbBlogTitle.Text;
            int length = FileUpload1.PostedFile.ContentLength;
            byte[] blogImage = new byte[length];
            FileUpload1.PostedFile.InputStream.Read(blogImage, 0, length);
            string blogDetails = tbBlogDetails.Text;

            StringBuilder sqlStr = new StringBuilder();
            // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand();
            // Step1 : Create SQL insert command to add record to TDMaster using     

            //         parameterised query in values clause
            //
            sqlStr.AppendLine("UPDATE blogs SET BlogTitle = @paraBlogTitle ,BlogImage = @paraBlogImage ,BlogTitle = @paraBlogDetails");
            sqlStr.AppendLine("WHERE Id = @paraId");


            // Step 2 :Instantiate SqlConnection instance and SqlCommand instance

            SqlConnection myConn = new SqlConnection(DBConnect);

            sqlCmd = new SqlCommand(sqlStr.ToString(), myConn);

            // Step 3 : Add each parameterised query variable with value
            //          complete to add all parameterised queries
            sqlCmd.Parameters.AddWithValue("@paraId", blogId);
            sqlCmd.Parameters.AddWithValue("@paraBlogTitle", blogTitle);
            sqlCmd.Parameters.AddWithValue("@paraBlogImage", blogImage);
            sqlCmd.Parameters.AddWithValue("@paraBlogDetails", blogDetails);

            // Step 4 Open connection the execute NonQuery of sql command   

            myConn.Open();
            sqlCmd.ExecuteNonQuery();

            // Step 5 :Close connection
            myConn.Close();
        }
        else
        {
            string blogTitle = tbBlogTitle.Text;
            int length = FileUpload1.PostedFile.ContentLength;
            string blogDetails = tbBlogDetails.Text;

            StringBuilder sqlStr = new StringBuilder();
            // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand();
            // Step1 : Create SQL insert command to add record to TDMaster using     

            //         parameterised query in values clause
            //
            sqlStr.AppendLine("UPDATE blogs SET BlogTitle = @paraBlogTitle,BlogDetails = @paraBlogDetails");
            sqlStr.AppendLine("WHERE Id = @paraId");


            // Step 2 :Instantiate SqlConnection instance and SqlCommand instance

            SqlConnection myConn = new SqlConnection(DBConnect);

            sqlCmd = new SqlCommand(sqlStr.ToString(), myConn);

            // Step 3 : Add each parameterised query variable with value
            //          complete to add all parameterised queries
            sqlCmd.Parameters.AddWithValue("@paraId", blogId);
            sqlCmd.Parameters.AddWithValue("@paraBlogTitle", blogTitle);
            sqlCmd.Parameters.AddWithValue("@paraBlogDetails", blogDetails);

            // Step 4 Open connection the execute NonQuery of sql command   

            myConn.Open();
            sqlCmd.ExecuteNonQuery();

            // Step 5 :Close connection
            myConn.Close();
            Response.Redirect("BlogEdit.aspx");
        }
    }

    protected void ButtonDelete_Click(object sender, EventArgs e)
    {
        StringBuilder sqlStr = new StringBuilder();
        // Execute NonQuery return an integer value
        SqlCommand sqlCmd = new SqlCommand();
        // Step1 : Create SQL insert command to add record to TDMaster using     

        //         parameterised query in values clause
        //
        sqlStr.AppendLine("DELETE FROM blogs");
        sqlStr.AppendLine("WHERE Id = @paraId");

        // Step 2 :Instantiate SqlConnection instance and SqlCommand instance

        SqlConnection myConn = new SqlConnection(DBConnect);

        sqlCmd = new SqlCommand(sqlStr.ToString(), myConn);

        // Step 3 : Add each parameterised query variable with value
        //          complete to add all parameterised queries
        sqlCmd.Parameters.AddWithValue("@paraId", blogId);

        // Step 4 Open connection the execute NonQuery of sql command   

        myConn.Open();
        sqlCmd.ExecuteNonQuery();

        // Step 5 :Close connection
        myConn.Close();
        Response.Redirect("BlogEdit.aspx");
    }
}