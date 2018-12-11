using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnStudent_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "Use your admin number as username and your myNYP Portal password";
        btnStudent.CssClass = "tablinks active";
        btnStaff.CssClass = "tablinks";
        btnAdmin.CssClass = "tablinks";
    }

    protected void btnStaff_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "Use your staff ID as username and your NYP's email password";
        btnStudent.CssClass = "tablinks";
        btnStaff.CssClass = "tablinks active";
        btnAdmin.CssClass = "tablinks";
    }

    protected void btnAdmin_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "Use your name (without space and as written in your IC) as username";
        btnStudent.CssClass = "tablinks";
        btnStaff.CssClass = "tablinks";
        btnAdmin.CssClass = "tablinks active";
    }
}