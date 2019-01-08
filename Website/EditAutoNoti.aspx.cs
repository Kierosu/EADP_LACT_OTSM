using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LACTWebsite;

public partial class EditAutoNoti : System.Web.UI.Page
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
                    if (Session["ssAutoNotiID"] != null)
                    {
                        AutoNoti autoNoti = new AutoNoti();
                        NotificationsADO notiAdo = new NotificationsADO();
                        string test = Session["ssAutoNotiID"].ToString();
                        autoNoti = notiAdo.GetAutoDataByID(Session["ssUsername"].ToString(), int.Parse(Session["ssAutoNotiID"].ToString()));
                        tbSubject.Text = autoNoti.autoSubject;
                        ddlEvents.SelectedValue = autoNoti.autoEventValue;
                        taMessage.InnerText = autoNoti.autoMessage;
                    }
                    else
                    {
                        Response.Redirect("AutoNotifications.aspx");
                    }
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
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ddlEvents.SelectedValue == "select")
        {
            errMsg.Style.Add("display", "inline");
            lblErr.Text = "Please select an event to trigger the auto notification!";
        }
        else
        {
            NotificationsADO notiAdo = new NotificationsADO();
            int updateNoti = notiAdo.UpdateAutoNoti(Session["ssUsername"].ToString(), ddlEvents.SelectedItem.ToString(), ddlEvents.SelectedValue, taMessage.Value, tbSubject.Text, int.Parse(Session["ssAutoNotiID"].ToString()));
            if (updateNoti == 1)
            {
                Session.Remove("ssAutoNotiID");
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