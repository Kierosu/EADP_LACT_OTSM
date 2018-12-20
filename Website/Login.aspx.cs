using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LACTWebsite;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
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
    }
}