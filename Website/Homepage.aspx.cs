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
using System.Collections;

public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        ButtonBlog.Enabled = false;
        if (!IsPostBack)
        {
            fillData();
        }
    }

    private void fillData()
    {
        string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        SqlConnection con = new SqlConnection(DBConnect);
        con.Open();
        DataTable dt = new DataTable();
        SqlDataAdapter adapt = new SqlDataAdapter("Select * from TableStats", con);
        adapt.Fill(dt);
        con.Close();
        PagedDataSource pds = new PagedDataSource();
        DataView dv = new DataView(dt);
        pds.DataSource = dv;
        pds.AllowPaging = true;
        pds.PageSize = 4;
        pds.CurrentPageIndex = PageNumber;
        if (pds.PageCount > 1)
        {
            rptPaging.Visible = true;
            ArrayList arraylist = new ArrayList();
            for (int i = 0; i < pds.PageCount; i++)
                arraylist.Add((i + 1).ToString());
            rptPaging.DataSource = arraylist;
            rptPaging.DataBind();
        }
        else
        {
            rptPaging.Visible = false;
        }
        Repeater1.DataSource = pds;
        Repeater1.DataBind();
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
        string aspectsList = "";
        MultiViewTrip.ActiveViewIndex = 2;
        //charts variables
        Series series = Chart1.Series["Series1"];
        string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        SqlConnection myConn = new SqlConnection(DBConnect);

        StringBuilder sqlCommand = new StringBuilder();
        sqlCommand.AppendLine("Select tdRating, tdReview, tdAspect from TableStats;");
        
        SqlDataAdapter da = new SqlDataAdapter(sqlCommand.ToString(), myConn);
        //get info from TableStats and TableAspects
        DataSet ds = new DataSet();
        da.Fill(ds, "TableStats");
        int count = ds.Tables["TableStats"].Rows.Count;
        LabelComments.Text = "Comments from students: " + "<br />";
        //print out all data
        for (int i = 0; i < count; i++)
        {
            DataRow row = ds.Tables["TableStats"].Rows[i];
            LabelComments.Text += "Student " + (i + 1) + ": " + row["tdRating"].ToString() + "/5. Comment: " + row["tdReview"] + "<br/>";
            series.Points.AddXY("Student " + (i + 1).ToString(), row["tdRating"]);
            aspectsList += row["tdAspect"];
            string[] aspects = aspectsList.Split(',');
            for (int j = 0; j < aspects.Length; j++)
            {
                LabelAspects.Text += " Aspect " + (j + 1) + ": " + aspects[j];

            }
            LabelAspects.Text += "<br/>";
            ButtonStats.Enabled = false;
            ButtonDetails.Enabled = true;
            aspectsList = "";
        }
     

    }



    public int PageNumber
    {
        get
        {
            if (ViewState["PageNumber"] != null)
                return Convert.ToInt32(ViewState["PageNumber"]);
            else
                return 0;
        }
        set
        {
            ViewState["PageNumber"] = value;
        }
    }

    protected void rptPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
        fillData();
    }
}
