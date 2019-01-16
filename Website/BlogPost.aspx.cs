using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BlogPost : System.Web.UI.Page
{
    string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile == true)
        {
            string blogTitle = tbBlogTitle.Text;
            int length = FileUpload1.PostedFile.ContentLength;
            byte[] blogImage = new byte[length];
            FileUpload1.PostedFile.InputStream.Read(blogImage, 0, length);
            string tripId = "1";
            string blogDetails = tbBlogDetails.Text;

            StringBuilder sqlStr = new StringBuilder();
            // Execute NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand();
            // Step1 : Create SQL insert command to add record to TDMaster using     

            //         parameterised query in values clause
            //
            sqlStr.AppendLine("INSERT INTO blogs (TripId,BlogTitle,BlogImage,BlogDetails)");
            sqlStr.AppendLine("VALUES (@paraTripId,@paraBlogTitle,@paraBlogImage,@paraBlogDetails)");


            // Step 2 :Instantiate SqlConnection instance and SqlCommand instance

            SqlConnection myConn = new SqlConnection(DBConnect);

            sqlCmd = new SqlCommand(sqlStr.ToString(), myConn);

            // Step 3 : Add each parameterised query variable with value
            //          complete to add all parameterised queries
            sqlCmd.Parameters.AddWithValue("@paraTripId", tripId);
            sqlCmd.Parameters.AddWithValue("@paraBlogTitle", blogTitle);
            sqlCmd.Parameters.AddWithValue("@paraBlogImage", blogImage);
            sqlCmd.Parameters.AddWithValue("@paraBlogDetails", blogDetails);

            // Step 4 Open connection the execute NonQuery of sql command   

            myConn.Open();
            sqlCmd.ExecuteNonQuery();

            // Step 5 :Close connection
            myConn.Close();
        }

    }
}