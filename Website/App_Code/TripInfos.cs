using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TripInfos
/// </summary>
public class TripInfos
{
    public string TripName { get; set; }
    public string TripType { get; set; }
    public string TripCountry { get; set; }
    public string TripLocation { get; set; }
    public string TripSlots { get; set; }
    public DateTime TripStartDate { get; set; }
    public DateTime TripEndDate { get; set; }
    public string TripTeacherInCharge { get; set; }
    public decimal TripPlaneFee{ get; set; }
    public decimal TripInsuFee { get; set; }
    public decimal TripAccoFee { get; set; }
    public string TripDetails { get; set; }

}