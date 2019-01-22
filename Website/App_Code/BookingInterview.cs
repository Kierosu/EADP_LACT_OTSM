using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookedInterview
/// </summary>
public class BookingInterview
{
    public BookingInterview()
    {       
    }
    public string interviewName { get; set; }    
    public string interviewDate { get; set; }
    public string userUsername { get; set; }
    public string userFullName { get; set; }
    public string userDiploma { get; set; }
    public decimal userGPA { get; set; }
    public string userAllergy { get; set; }
    public string userMedication { get; set; }
    public string userDietRestrict { get; set; }
    public string userNationality { get; set; }
    public string userFirstTimeApply { get; set; }
}