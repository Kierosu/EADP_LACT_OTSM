using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
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
    }

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    { 
        if (ListBox1.Items.Count > 0) {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please order ALL of the aspects.')", true);
        } 
        else
        {
            //string to be stored in TableStats, array used for TableAspects
            String orderofaspects = "";
            string[] aspects = new string[6];
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
            for (int i =0; i < 5; i++) {  
              orderofaspects += ListBox2.Items[i].ToString() + "," ;
              aspects[i] = ListBox2.Items[i].ToString();
                                        }
                orderofaspects += ListBox2.Items[5].ToString();
            //each item is stored in 'aspects' array (including 6th element)
            for (int a = 0; a < 6; a++)
                {
                    aspects[a] = ListBox2.Items[a].ToString();
                }
            // find index + 1 of each item in string for each column in TableAspects
            for (int j = 0; j < 6; j++)
            {
                if (aspects[j] == "Learning")
                {
                    aspLearning = j + 1;
                }
                else if (aspects[j] == "Sightseeing")
                {
                    aspSightseeing = j + 1;
                }
                else if (aspects[j] == "Shopping")
                {
                    aspShopping = j + 1;
                }
                else if (aspects[j] == "Culture")
                {
                    aspCulture = j + 1;
                }
                else if (aspects[j] == "Meals")
                {
                    aspMeals = j + 1;
                }
                else if (aspects[j] == "Hotel")
                {
                    aspHotel = j + 1;
                }
            }
            StringBuilder sqlCommand = new StringBuilder();
            //Query to insert survey info into TableStats
            //2 queries for 2 tables
            sqlCommand.AppendLine("INSERT INTO TableStats (tdRating, tdReview, tdAspect)");
            sqlCommand.AppendLine("VALUES (@paratdRating, @paratdReview, @paratdAspect);");
            sqlCommand.AppendLine("INSERT INTO TableAspects (Learning, Sightseeing, Shopping, Culture, Meals, Hotel)");
            sqlCommand.AppendLine("VALUES (@paraLearning, @paraSightseeing, @paraShopping, @paraCulture, @paraMeals, @paraHotel);");
            sqlCmd = new SqlCommand(sqlCommand.ToString(), myConn);
            //add values in parameters (prevent sql injection)
            sqlCmd.Parameters.AddWithValue("@paratdRating", rating);
            sqlCmd.Parameters.AddWithValue("@paratdReview", review);
            sqlCmd.Parameters.AddWithValue("@paratdAspect", orderofaspects);
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
        }
         
    }

    protected void ButtonClear_Click(object sender, EventArgs e)
    {
         
    }


    protected void ButtonEnter_Click(object sender, EventArgs e)
    {
        selectedItemText = ListBox1.SelectedItem.ToString();
        SelectedIndex = ListBox1.SelectedIndex;
        ListBox2.Items.Add(selectedItemText);
        ListBox1.Items.RemoveAt(ListBox1.Items.IndexOf(ListBox1.SelectedItem));
       
      
    }

    protected void ButtonRemove_Click(object sender, EventArgs e)
    {
        selectedItemText = ListBox2.SelectedItem.ToString();
        SelectedIndex = ListBox2.SelectedIndex;
        
        ListBox2.Items.RemoveAt(ListBox2.Items.IndexOf(ListBox2.SelectedItem));
        ListBox1.Items.Add(selectedItemText);

    }

}
