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
    string selectedItemText;
    int SelectedIndex;
    protected void Page_Load(object sender, EventArgs e)
    { 
    }

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    { 
        if (ListBox1.Items.Count > 0) {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('You haven't arranged all the aspects yet!');</script>");
        } 
        else
        {
            String orderofaspects = "";
            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            //add new row to database (create new data)
            SqlCommand sqlCmd = new SqlCommand();
            int result = 0;
            //variables to get all the data needed to put in database
            String review = textBoxComment.Text.ToString();
            String rating = Rating1.CurrentRating.ToString();
            foreach (ListItem item in ListBox2.Items)
            {
                orderofaspects += item.ToString();
            }
            StringBuilder sqlCommand = new StringBuilder();
            sqlCommand.AppendLine("INSERT INTO TableStats (tdRating, tdReview, tdAspect)");
            sqlCommand.AppendLine("VALUES (@paratdRating, @paratdReview, @paratdAspect)");
            sqlCmd = new SqlCommand(sqlCommand.ToString(), myConn);
            sqlCmd.Parameters.AddWithValue("@paratdRating", rating);
            sqlCmd.Parameters.AddWithValue("@paratdReview", review);
            sqlCmd.Parameters.AddWithValue("@paratdAspect", orderofaspects);
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
