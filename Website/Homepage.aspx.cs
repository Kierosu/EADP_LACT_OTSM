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
using System.IO;

public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
         
        if (!IsPostBack)
        {
            //ButtonBlog.Enabled = false;
            lblMessage.Visible = false;
            hyperlink.Visible = false;
           
            fillData();
        }
    }
 

    protected override void OnPreInit(EventArgs e)
    {
        base.OnPreInit(e);
        if (Session["ssRole"] != null)
        {
            if (Session["ssRole"].ToString() == "staff")
            {
                this.MasterPageFile = "~/MasterPageStaff.master";
            }
            else if (Session["ssRole"].ToString() == "admin")
            {
                this.MasterPageFile = "~/MasterPageAdmin.master";
            }
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
        pds.PageSize = 5;
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
        //bind info to repeaters
        Repeater1.DataSource = pds;
        Repeater1.DataBind();
        Repeater2.DataSource = pds;
        Repeater2.DataBind();
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

    protected void ButtonDetails_Click(object sender, EventArgs e)
    {
        MultiViewTrip.ActiveViewIndex = 0;
        ButtonDetails.Enabled = false;
        ButtonStats.Enabled = true;
    }

    protected void ButtonBlog_Click(object sender, EventArgs e)
    {
        MultiViewTrip.ActiveViewIndex = 1;
        LoadImages();
    }

    protected void ButtonStats_Click(object sender, EventArgs e)
    {
        string aspectsList = "";
        MultiViewTrip.ActiveViewIndex = 2;
        //charts variables
        Series series = Chart1.Series["Series1"];
        Series pieseries = Chart2.Series["Series2"];
         
         
        

        //show percentage in pie chart
        pieseries.Label = "#VAL";
        pieseries.LegendText = "#VALX" + " (" + "#PERCENT{P1}" + ")";
        //database connection
        string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        SqlConnection myConn = new SqlConnection(DBConnect);

        string text = "SELECT AVG(CONVERT(DECIMAL(16,2),tdRating))  FROM TableStats";
        SqlCommand cmd = new SqlCommand(text, myConn);

        //Stringbuilder sqlcommand = new Stringbuilder();
        //sqlcommand.appendline("select tdrating, tdreview, tdaspect from tablestats;");
        //sqlcommand.appendline("select learning, sightseeing, shopping, culture, meals, hotel from tableaspects;");
        myConn.Open();
        decimal average = (decimal)cmd.ExecuteScalar();
        if (text == null)
        {
            
        }
        else
        {
            Label5.Text = "Rating : " + Math.Round(average, 2).ToString();
        }
        //data adapter; 2 for 2 tables
        SqlDataAdapter da = new SqlDataAdapter("Select tdRating, tdReview, tdAspect, tdSuggestion from TableStats;", myConn);
        //get info from TableStats and TableAspects
        DataSet ds = new DataSet();
        da.Fill(ds, "TableStats");
        da = new SqlDataAdapter("Select Learning, Sightseeing, Shopping, Culture, Meals, Hotel from TableAspects;", myConn);
        da.Fill(ds, "TableAspects");
        //count rows
        int count = ds.Tables["TableStats"].Rows.Count;
        int aspectcount = ds.Tables["TableAspects"].Rows.Count;
        Chart1.ChartAreas[0].AxisY.Maximum = 5;
        //print out all data
        for (int i = 0; i < count; i++)
        {
            //BAR CHART
            DataRow row = ds.Tables["TableStats"].Rows[i];
            series.Points.AddXY("Student " + (i + 1).ToString(), row["tdRating"].ToString());
            aspectsList += row["tdAspect"];
            string[] aspects = aspectsList.Split(',');
            ButtonDetails.Enabled = true;
            aspectsList = "";
        }
        //PIE CHART
        DataTable table = ds.Tables["TableAspects"];
        // Declare aspect object variable.
        object sumLearning;
        object sumSightSeeing;
        object sumShopping;
        object sumCulture;
        object sumMeals;
        object sumHotel;
        //compute sum of each column (for one trip)
        sumLearning = table.Compute("Sum(Learning)", string.Empty);
        sumSightSeeing = table.Compute("Sum(Sightseeing)", string.Empty);
        sumShopping = table.Compute("Sum(Shopping)", string.Empty);
        sumCulture = table.Compute("Sum(Culture)", string.Empty);
        sumMeals = table.Compute("Sum(Meals)", string.Empty);
        sumHotel = table.Compute("Sum(Hotel)", string.Empty);
        //add to pie chart respectively
        pieseries.Points.AddXY("Learning", sumLearning);
        pieseries.Points.AddXY("Sightseeing", sumSightSeeing);
        pieseries.Points.AddXY("Shopping", sumShopping);
        pieseries.Points.AddXY("Culture", sumCulture);
        pieseries.Points.AddXY("Meals", sumMeals);
        pieseries.Points.AddXY("Hotel", sumHotel);
         
        myConn.Close();
    }

     

    protected void ButtonMore_Click(object sender, EventArgs e)
    {

    }
 

}
