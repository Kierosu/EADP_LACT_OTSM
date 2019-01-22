using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LACTWebsite;

public partial class BookInterview : System.Web.UI.Page
{
    string studentName = "";
    string studentAdminNo = "";
    string interviewTripName = "";
    DateTime interviewStartDate;
    DateTime interviewEndDate;


    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            studentName = Session["ssFullName"].ToString();
            studentAdminNo = Session["ssUsername"].ToString();
        }
        catch
        {
            Response.Redirect("Login.aspx");
        }

        // Display all details according to info stored in User's account &
        // based on what trip they have selected previously
        lbInterviewTripName.Text = Session["ssInterviewName"].ToString();
        interviewStartDate = Convert.ToDateTime(Session["ssInterviewStartDate"]);
        interviewEndDate = Convert.ToDateTime(Session["ssInterviewEndDate"]);

        lbStudentName.Text = studentName;
        lbStudentAdminNo.Text = studentAdminNo;
        lbInterviewLocation.Text = Session["ssLocation"].ToString();
        lbInterviewReminder.Text = Session["ssReminder"].ToString();

        foreach (DateTime day in EachDay(interviewStartDate, interviewEndDate))
        {
            DdlTripDates.Items.Add(day.ToShortDateString());
        }
    }
        public static IEnumerable<DateTime> EachDay(DateTime from, DateTime thru)
        {
            for (var day = from.Date; day.Date <= thru.Date; day = day.AddDays(1))
                yield return day;
        }

    protected void btBook_Click(object sender, EventArgs e)
    {
        // formulate the variables required from web form controls
        // These variables are used to assign the parameters of InsertTD method
        string interviewName = lbInterviewTripName.Text;
        string interviewDate = DdlTripDates.Text;
        string userUsername = lbStudentAdminNo.Text;
        string userAllergy = tbAllergy.Text;
        string userDietRestrict = tbDietRestrict.Text;
        string userMedication = tbMedication.Text;
        string userFirstTimeApply = rbtListFirstTimeApply.SelectedItem.Text;
        string userNationality = rbtListNationality.SelectedItem.Text;

        try
        {
            BookingInterviewDAO bookDAO = new BookingInterviewDAO();
            int bookCnt = bookDAO.BookingInterview(interviewName, interviewDate, userUsername, userAllergy, userDietRestrict, userMedication, userFirstTimeApply, userNationality);
            if (bookCnt == 1)
            {
                lbNotify.Text = "Booking Process Done!";
            }
        }
        catch (FormatException)
        {
            lbNotify.Text = "Check Data Entries!";
        }
    }
}