using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;
using System.Web.UI.DataVisualization.Charting;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ButtonBlog.Enabled = false;
    }

    protected void ButtonDetails_Click(object sender, EventArgs e)
    {
        MultiViewTrip.ActiveViewIndex = 0;
        ButtonDetails.Enabled = false;
        ButtonStats.Enabled = true;
        LabelComments.Text = "";
    } 

    protected void ButtonBlog_Click(object sender, EventArgs e)
    {
        MultiViewTrip.ActiveViewIndex = 1;
    }       

    protected void ButtonStats_Click(object sender, EventArgs e)
    {
        MultiViewTrip.ActiveViewIndex = 2;
        Series series = Chart1.Series["Series1"];
        string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        SqlConnection myConn = new SqlConnection(DBConnect);

        StringBuilder sqlCommand = new StringBuilder();
        sqlCommand.AppendLine("Select tdRating, tdReview from TableStats");
        SqlDataAdapter da = new SqlDataAdapter(sqlCommand.ToString(), myConn);

        DataSet ds = new DataSet();
        da.Fill(ds, "TableStats");

        int count = ds.Tables["TableStats"].Rows.Count;
        LabelComments.Text = "Comments from students: " + "<br />";
        for (int i = 0; i < count; i++)
        {
            DataRow row = ds.Tables["TableStats"].Rows[i];
            LabelComments.Text += "Student " + (i + 1) + ": " + row["tdRating"].ToString() + "/5. Comment: " + row["tdReview"] + "<br/>";
            series.Points.AddXY("Student " + (i + 1).ToString(), row["tdRating"]);
        }
        ButtonStats.Enabled = false;
        ButtonDetails.Enabled = true;
    }


    
}
