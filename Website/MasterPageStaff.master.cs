﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPageStaff : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ssFullName"] != null)
        {
            accButton.Style.Add("display", "inline-block");
            loginBurron.Style.Add("display", "none");
            txtAcc.InnerText = Session["ssFullName"].ToString();
        }
        else
        {
            accButton.Style.Add("display", "none");
            loginBurron.Style.Add("display", "inline-block");
        }
        logoutButton.ServerClick += new EventHandler(logoutButton_Click);
    }
    protected void logoutButton_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Homepage.aspx");
    }
}