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
        List<AutoNoti> listOfAuto = new List<AutoNoti>();
        NotificationsADO autoADO = new NotificationsADO();
        listOfAuto = autoADO.GetAutoDataList(username);
        if(listOfAuto == null)
        {
            noneMsg.Style.Add("display","inline-block");
            noneMsg.InnerText = "You seems to have no auto notifications. Click the add button to add a new one!";
        }
        else
        {
            noneMsg.Style.Add("display", "none");

            gvAutoNoti.DataSource = listOfAuto;
            gvAutoNoti.DataBind();
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

    protected void btnAddNoti_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddAutoNoti.aspx");
    }


    protected void gvAutoNoti_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            int i = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvAutoNoti.Rows[i];
            Session["ssAutoNotiID"] = row.Cells[0].Text;
            Response.Redirect("EditAutoNoti.aspx");
        }
        else if(e.CommandName == "Delete_Noti")
        {
            int i = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvAutoNoti.Rows[i];
            int id  = int.Parse(row.Cells[0].Text);
            NotificationsADO notiADO = new NotificationsADO();
            int result = notiADO.DeleteAutoNoti(Session["ssUsername"].ToString(), id);
            if (result != 1)
            {
                noneMsg.Style.Add("display", "inline-block");
                noneMsg.InnerText = "There seems to be an error deleting the notification";
            }
            else
            {
                Response.Redirect("AutoNotifications.aspx");
            }
        }
    }
}