using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LACTWebsite;

public partial class CreateInt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btCreate_Click(object sender, EventArgs e)
    {
        // formulate the variables required from web form controls
        // These variables are used to assign the parameters of InsertTD method
        String interviewName = Convert.ToString(DdlTrips.SelectedItem.Text.ToString());
        DateTime interviewStartDate = Convert.ToDateTime(tbStartDate.Text);
        DateTime interviewEndDate = Convert.ToDateTime(tbEndDate.Text);
        String interviewLocation = tbLocation.Text.ToString();
        String interviewReminder = tbReminder.Text.ToString();

        try
        {
            CreateInterviewDAO intDAO = new CreateInterviewDAO();
            int insCnt = intDAO.CreateInterview(interviewName, interviewStartDate, interviewEndDate, interviewLocation, interviewReminder);
            if (insCnt == 1)
            {
                lbNotify.Text = "Interview Dates Created!";
            }
            else
            {
                lbNotify.Text = "Unable to create Interview Dates, please check entries!";

            }

        }
        catch (FormatException)
        {
            lbNotify.Text = "Check Interview Dates Entry!";
        }
    }
}