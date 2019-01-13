using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LACTWebsite
{
    public class CreateInterview
    {
        public string interviewName { get; set; }
        public DateTime interviewStartDate { get; set; }
        public DateTime interviewEndDate { get; set; }
        public string interviewLocation { get; set; }
        public string interviewReminder { get; set; }
    }
}