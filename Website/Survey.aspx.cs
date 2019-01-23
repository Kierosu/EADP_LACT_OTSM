using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    // selecteditemtext and selectedindex for listbox item transfer
    string selectedItemText;
    int SelectedIndex;
    //6 variables for 6 aspects
    int aspLearning;
    int aspSightseeing;
    int aspMeals;
    int aspHotel;
    int aspCulture;
    int aspShopping;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ssUsername"] != null)
        {
            LabelAdminNumber.Text = Session["ssUsername"].ToString();
            LabelName.Text = Session["ssFullName"].ToString();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

 
         
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        //if (ListBox1.Items.Count > 0)
        //{
        //    //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please order all of the aspects');", true);
        //}
        //else
        //{
        //string to be stored in TableStats, array used for TableAspects
        String orderofaspects = "";
        string[] aspects = new string[6];
        string data = postOrder.Text;
        string[] words = data.Split(',');
        foreach (string word in words)
        {
            ListBox1.Items.Add(word);
        }
        //*IMPORTANT* connect to database
        string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        SqlConnection myConn = new SqlConnection(DBConnect);
        //add new row to database (create new data)
        SqlCommand sqlCmd = new SqlCommand();
        int result = 0;
        //variables to get all the data needed to put in database
        String review = textBoxComment.Text.ToString();
        String rating = Rating1.CurrentRating.ToString();
        //User's order of aspects are stored in string 'orderofaspects' via index in one whole string from 1-5 
        //and the 6th index is separate because no comma at the end
        //for (int i = 0; i < 5; i++)
        //{
        //    orderofaspects += ListBox2.Items[i].ToString() + ",";
        //aspects[i] = ListBox2.Items[i].ToString();
        //}
        //orderofaspects += ListBox2.Items[5].ToString();
        //each item is stored in 'aspects' array (including 6th element)
        //for (int a = 0; a < 6; a++)
        //{
        //    aspects[a] = ListBox2.items[a].tostring();
        //}
        // find index + 1 of each item in string for each column in TableAspects
        foreach (ListItem item in ListBox1.Items)
        {
            if (item.ToString() == "Learning")
            {
                aspLearning = ListBox1.Items.IndexOf(item) + 1;
            }
            else if (item.ToString() == "Sightseeing")
            {
                aspSightseeing = ListBox1.Items.IndexOf(item) + 1;
            }
            else if (item.ToString() == "Shopping")
            {
                aspShopping = ListBox1.Items.IndexOf(item) + 1;
            }
            else if (item.ToString() == "Culture")
            {
                aspCulture = ListBox1.Items.IndexOf(item) + 1;
            }
            else if (item.ToString() == "Meals")
            {
                aspMeals = ListBox1.Items.IndexOf(item) + 1;
            }
            else if (item.ToString() == "Hotel")
            {
                aspHotel = ListBox1.Items.IndexOf(item) + 1;
            }
        }
        StringBuilder sqlCommand = new StringBuilder();
        //Query to insert survey info into TableStats
        //2 queries for 2 tables
        sqlCommand.AppendLine("INSERT INTO TableStats (tdRating, tdReview, tdAspect, tdSuggestion, reviewName, reviewAdminId, reviewTripId)");
        sqlCommand.AppendLine("VALUES (@paratdRating, @paratdReview, @paratdAspect, @paratdSuggestion, @parareviewName, @parareviewAdminId, @parareviewTripId);");
        sqlCommand.AppendLine("UPDATE TableAspects SET Learning = Learning + @paraLearning, Sightseeing = Sightseeing + @paraSightseeing, Shopping = Shopping + @paraShopping, Culture = Culture + @paraCulture, Meals = Meals + @paraMeals, Hotel = Hotel + @paraHotel WHERE aspectTripId = @paraTripId");
        sqlCommand.AppendLine("IF @@ROWCOUNT=0 INSERT INTO TableAspects (Learning, Sightseeing, Shopping, Culture, Meals, Hotel)");
        sqlCommand.AppendLine("VALUES (@paraLearning, @paraSightseeing, @paraShopping, @paraCulture, @paraMeals, @paraHotel);");
        sqlCmd = new SqlCommand(sqlCommand.ToString(), myConn);
        //add values in parameters (prevent sql injection) for TableStats
        sqlCmd.Parameters.AddWithValue("@paratdRating", rating);
        sqlCmd.Parameters.AddWithValue("@paratdReview", review);
        sqlCmd.Parameters.AddWithValue("@paratdAspect", data);
        sqlCmd.Parameters.AddWithValue("@paratdSuggestion", TextBoxSuggestions.Text);
        sqlCmd.Parameters.AddWithValue("@parareviewName", Session["ssFullName"].ToString());
        sqlCmd.Parameters.AddWithValue("@parareviewAdminId", Session["ssUsername"].ToString());
        sqlCmd.Parameters.AddWithValue("@parareviewTripId", DropDownListTripId.SelectedValue.ToString());
        //for TableAspects
        sqlCmd.Parameters.AddWithValue("@paraTripId", DropDownListTripId.SelectedValue.ToString());
        sqlCmd.Parameters.AddWithValue("@paraLearning", aspLearning);
        sqlCmd.Parameters.AddWithValue("@paraSightseeing", aspSightseeing);
        sqlCmd.Parameters.AddWithValue("@paraShopping", aspShopping);
        sqlCmd.Parameters.AddWithValue("@paraCulture", aspCulture);
        sqlCmd.Parameters.AddWithValue("@paraMeals", aspMeals);
        sqlCmd.Parameters.AddWithValue("@paraHotel", aspHotel);
        //execute queries
        myConn.Open();
        result = sqlCmd.ExecuteNonQuery();

        myConn.Close();

        Response.Redirect("SurveyComplete.aspx");
        //}

    }

}
