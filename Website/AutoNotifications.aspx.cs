using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LACTWebsite;

public partial class AutoNotifications : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ssRole"] != null)
        {
            if (Session["ssRole"].Equals("student"))
            {
                Response.Redirect("Error401.aspx");
            }
        }
        else
        {
            Response.Redirect("loginFirst.aspx");
        }

        string username = Session["ssUsername"].ToString();
        AutoNoti autoNotiUser = new AutoNoti();
        NotificationsADO autoADO = new NotificationsADO();
        autoNotiUser = autoADO.GetAutoData(username);
        if(autoNotiUser == null)
        {
            noneMsg.Style.Add("display","inline-block");
        }
    }
    protected override void OnPreInit(EventArgs e)
    {
        base.OnPreInit(e);
        if (Session["ssRole"] != null)
        {
            if (Session["ssRole"].ToString() == "staff")
            {
                this.MasterPageFile = "~/MasterPageStaff.master";
            }
            else if (Session["ssRole"].ToString() == "admin")
            {
                this.MasterPageFile = "~/MasterPageAdmin.master";
            }
        }
    }
}