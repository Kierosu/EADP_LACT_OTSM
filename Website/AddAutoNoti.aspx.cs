using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LACTWebsite;

public partial class AddAutoNoti : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["ssRole"] != null)
            {
                if (Session["ssRole"].Equals("student"))
                {
                    Response.Redirect("Error401.aspx");
                }
                else
                {
                    lblSender.Text = Session["ssFullName"].ToString();
                }
            }
            else
            {
                Response.Redirect("loginFirst.aspx");
            }
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

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if(ddlEvents.SelectedValue == "select")
        {
            errMsg.Style.Add("display", "inline");
            lblErr.Text = "Please select an event to trigger the auto notification!";
        }
        else
        {
            NotificationsADO notiAdo = new NotificationsADO();
            int addNoti = notiAdo.AddAutoNoti(Session["ssUsername"].ToString(), ddlEvents.SelectedItem.ToString(), ddlEvents.SelectedValue, taMessage.Value, tbSubject.Text);
            if (addNoti == 1)
            {
                Response.Redirect("AutoNotifications.aspx");
            }
            else
            {
                errMsg.Style.Add("display", "inline");
                lblErr.Text = "Uh oh! There is an error adding the auto notification!";
            }
        }
        
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("AutoNotifications.aspx");
    }
}