using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
<<<<<<< HEAD
using System.Web.UI;
using System.Web.UI.WebControls;
using LACTWebsite;
=======
using LACTWebsite;
using System.Web.UI.HtmlControls;
>>>>>>> 34672d01ea3719b68970a407059b550d740c8e0d

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["ssUsername"] != null)
        {
            Response.Redirect("Homepage.aspx");
<<<<<<< HEAD
        }   
    }


    protected void btnLogin_Click(object sender, EventArgs e)
    {
        lblMsg.Visible = false;
        User loginUser = new User();
        UserADO userADO = new UserADO();

        loginUser = userADO.Login(tbUsername.Text, tbPass.Text);
        if(loginUser == null)
        {
            lblMsg.Visible = true;
            lblMsg.Text = "Wrong username or password!";
        }
        else
        {
            Session["ssUsername"] = loginUser.userUsername;
            Session["ssRole"] = loginUser.userRole;
            Session["ssFullName"] = loginUser.userFullName;
            Response.Redirect("Homepage.aspx");
        }
=======
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {   
        User loginUser = new User();
        UserADO userADO = new UserADO();

        string activeRole = "";
        
        if (studentTab.CssClass.Contains("active"))
        {
            activeRole = studentTab.Text;
        }
        else if (staffTab.CssClass.Contains("active"))
        {
            activeRole = staffTab.Text;
        }
        else if (adminTab.CssClass.Contains("active"))
        {
            activeRole = adminTab.Text;
        }

        loginUser = userADO.Login(tbUsername.Text, tbPass.Text, activeRole);
        if(loginUser == null)
        {
            lblErr.Visible = true;
            lblErr.Text = "Wrong username or password!";
        }
        else
        {
            Session["ssUsername"] = loginUser.userUsername;
            Session["ssRole"] = loginUser.userRole;
            Session["ssFullName"] = loginUser.userFullName;
            Response.Redirect("Homepage.aspx");
        }
    }


    protected void adminTab_Click(object sender, EventArgs e)
    {
        studentTab.CssClass = "nav-link";
        staffTab.CssClass = "nav-link";
        adminTab.CssClass = "nav-link active";
        lblMsg.Text = "Use your name (without space and as written in your IC) as username";
        lblErr.Visible = false;
    }

    protected void staffTab_Click(object sender, EventArgs e)
    {
        studentTab.CssClass = "nav-link";
        staffTab.CssClass = "nav-link active";
        adminTab.CssClass = "nav-link";
        lblMsg.Text = "Use your staff ID as username and your NYP's email password";
        lblErr.Visible = false;
    }

    protected void studentTab_Click(object sender, EventArgs e)
    {
        studentTab.CssClass = "nav-link active";
        staffTab.CssClass = "nav-link";
        adminTab.CssClass = "nav-link";
        lblMsg.Text = "Use your admin number as username and your myNYP Portal password";
        lblErr.Visible = false;
>>>>>>> 34672d01ea3719b68970a407059b550d740c8e0d
    }
}