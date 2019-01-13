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
        da.SelectCommand.Parameters.AddWithValue("paraId", 1);
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
}