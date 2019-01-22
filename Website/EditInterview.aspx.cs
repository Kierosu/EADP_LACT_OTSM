using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LACTWebsite;

public partial class EditInterview : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        tbLocation.Text = Session["ssLocation"].ToString();
        tbRemind.Text = Session["ssReminder"].ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime startDate = Convert.ToDateTime(Session["ssInterviewStartDate"]);
        DateTime endDate = Convert.ToDateTime(Session["ssInterviewEndDate"]);
       
        lbInterviewName.Text = Session["ssInterviewName"].ToString();
        lbPrevStartDate.Text = startDate.ToShortDateString();
        lbPrevEndDate.Text = endDate.ToShortDateString();         
    }

    protected void btUpdate_Click(object sender, EventArgs e)
    {
        string interviewName = Session["ssInterviewName"].ToString();
        DateTime interviewStartDate = Convert.ToDateTime(tbStartDate.Text);
        DateTime interviewEndDate = Convert.ToDateTime(tbEndDate.Text);
        string interviewLocation = tbLocation.Text;
        string interviewReminder = tbRemind.Text;
        
        try
        {
            CreateInterview intObj = new CreateInterview();
            ViewInterviewDAO updateDAO = new ViewInterviewDAO();
            int insCnt = updateDAO.updateInterview(interviewName, interviewStartDate, interviewEndDate, interviewLocation, interviewReminder);
            if (insCnt == 1)
            {
                lbNotify.Text = "Interview Dates Updated!";
            }
            Response.Redirect("ViewInt.aspx");
        }
        catch (FormatException)
        {
            lbNotify.Text = "Check Interview Dates Entry!";
        }

        Session["ssUpdatedInterviewName"] = interviewName;
    }
}