using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LACTWebsite;
using System.Configuration;

public partial class ViewInt : System.Web.UI.Page
{
    string studentName = "";
    string studentAdminNo = "";

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
    }

    public int getDaysBetween()
    {
        int daysInBetween = (interviewDates()[0].interviewEndDate - interviewDates()[0].interviewStartDate).Days + 1;
        return daysInBetween;
    }
    // Class to store all Interview Information
    // List to store Information
    public List<CreateInterview> interviewDates()
    {
        CreateInterview intObj = new CreateInterview();
        ViewInterviewDAO intDao = new ViewInterviewDAO();
        var interviewDatesInstance = new List<CreateInterview>();
        intObj = intDao.getInterviewInfo(DdlTripInterview.Text);
        if (intObj != null)
        {
            interviewDatesInstance.Add(new CreateInterview()
            {
                interviewName = intObj.interviewName,
                interviewStartDate = intObj.interviewStartDate,
                interviewEndDate = intObj.interviewEndDate,
                interviewLocation = intObj.interviewLocation,
                interviewReminder = intObj.interviewReminder
            });
        }
        return interviewDatesInstance;
    }

    protected void btBook_OnClick(object sender, EventArgs e)
    {
        Session["ssInterviewName"] = interviewDates()[0].interviewName;
        Session["ssInterviewStartDate"] = interviewDates()[0].interviewStartDate;
        Session["ssInterviewEndDate"] = interviewDates()[0].interviewEndDate;
        Session["ssLocation"] = interviewDates()[0].interviewLocation;
        Session["ssReminder"] = interviewDates()[0].interviewReminder;
        Response.Redirect("BookInterview.aspx");
    }



    protected void btDeleteInterview_Click(object sender, EventArgs e)
    {
        bool showModal = true;
        if (showModal)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal('show');", true);
        }
    }

    protected void btnYesDelete_Click(object sender, EventArgs e)
    {
        ViewInterviewDAO viewDAO = new ViewInterviewDAO();
        int insCnt = viewDAO.deleteInterviewInfo(DdlTripInterview.Text);
        if (insCnt == 1)
        {
            lbNotify.Text = "Interview has been deleted!";
        }
        DdlTripInterview.DataBind();
    }

    protected void btnNoDelete_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "myModal", "$('#myModal').modal('hide');", true);
    }

    protected void DdlTripInterview_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbNotify.Text = "";
    }

    protected void btEditInterview_Click(object sender, EventArgs e)
    {
        Session["ssInterviewName"] = interviewDates()[0].interviewName;
        Session["ssInterviewStartDate"] = interviewDates()[0].interviewStartDate;
        Session["ssInterviewEndDate"] = interviewDates()[0].interviewEndDate;
        Session["ssLocation"] = interviewDates()[0].interviewLocation;
        Session["ssReminder"] = interviewDates()[0].interviewReminder;
        Response.Redirect("EditInterview.aspx");
    }
}
