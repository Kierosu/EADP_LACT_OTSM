﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TripInformation
/// </summary>
public class TripInformations
{
    public int Id { get; set; }
    public string TripName { get; set; }
    public string TripType { get; set; }
    public string TripCountry { get; set; }
    public string TripLocation { get; set; }
    public DateTime TripStartDate { get; set; }
    public string TripTeacherInCharge { get; set; }
    public string TripSlots { get; set; }
}