﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Homepage.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = string.Format("You indicated that you <b>{0}</b> the survey.",
            (CheckBox1.Checked ? "like" : "hate"));
    }
}