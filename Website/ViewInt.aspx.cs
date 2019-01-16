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
        /*
        CreateInterview intObj = new CreateInterview();
        ViewInterviewDAO intDao = new ViewInterviewDAO();
        intObj = intDao.getInterviewInfo(DdlTripInterview.Text);
        DateTime startDate = intObj.interviewStartDate;
        DateTime endDate = intObj.interviewEndDate;

        // Create an instance of the collection class
        DateTimeEnumerator dateTimeRange = new DateTimeEnumerator(startDate, endDate);
        */
     
        /*
        for(int i < )
        {

        }
        */

        /*
        foreach (DateTime day in dateTimeRange)
        {
            // Testing output results in Debugger
            foreach (var allDays in interviewDatesInstance)
            {
                System.Diagnostics.Debug.WriteLine(allDays.interviewTripName);
                System.Diagnostics.Debug.WriteLine(allDays.interviewStartDate.ToShortDateString());
                System.Diagnostics.Debug.WriteLine(allDays.interviewEndDate.ToShortDateString());
                System.Diagnostics.Debug.WriteLine(allDays.interviewLocation);
                System.Diagnostics.Debug.WriteLine(allDays.interviewReminder);
            }
        }
        */
    }

    /*
    public void loadIntInfo()
    {
        CreateInterview intObj = new CreateInterview();
        ViewInterviewDAO intDao = new ViewInterviewDAO();
        intObj = intDao.getInterviewInfo(DdlTripInterview.Text);

        DateTime startDate = intObj.interviewStartDate;
        DateTime endDate = intObj.interviewEndDate;

        // Create an instance of the collection class
        DateTimeEnumerator dateTimeRange = new DateTimeEnumerator(startDate, endDate);

        // Iterate all days with foreach
        foreach (DateTime day in dateTimeRange)
        {
            System.Diagnostics.Debug.WriteLine("test" + dateTimeRange);
        }
    }

    */
    // Enumerator for Dates in between Start and End
    public class DateTimeEnumerator : System.Collections.IEnumerable
    {
        private DateTime startDate;
        private DateTime endDate;

        public DateTimeEnumerator(DateTime startDate, DateTime endDate)
        {
            // Create a defensive copy here...
            this.startDate = startDate;
            this.endDate = endDate;
        }
        public System.Collections.IEnumerator GetEnumerator()
        {
            for (DateTime date = startDate; date < endDate; date = date.AddDays(1))
            {
                yield return date;
            }
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
        // Check why DAO runs null
        CreateInterview intObj = new CreateInterview();
        ViewInterviewDAO intDao = new ViewInterviewDAO();
        var interviewDatesInstance = new List<CreateInterview>();
        intObj = intDao.getInterviewInfo(DdlTripInterview.Text);
        if (intObj != null)
        {        
            interviewDatesInstance.Add(new CreateInterview() {
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

    }
}
