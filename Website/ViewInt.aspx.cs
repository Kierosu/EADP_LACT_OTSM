using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LACTWebsite;

public partial class ViewInt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CreateInterview intObj = new CreateInterview();
        ViewInterviewDAO intDao = new ViewInterviewDAO();
        intObj = intDao.getInterviewInfo(DdlTripInterview.Text);
        if (intObj != null)
        {
            LblTripName.Text = intObj.interviewName;
            LblStartDate.Text = intObj.interviewStartDate.ToString();
            LblEndDate.Text = intObj.interviewEndDate.ToString();
            LblLocation.Text = intObj.interviewLocation.ToString();
            LblReminder.Text = intObj.interviewReminder.ToString();
        }
    }
}