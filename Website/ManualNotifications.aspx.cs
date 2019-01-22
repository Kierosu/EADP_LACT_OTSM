using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using LACTWebsite;

public partial class ManualNotifications : System.Web.UI.Page
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
        lblSender.Text = Session["ssFullName"].ToString();
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

    [WebMethod]
    public static List<string> FindUser(string name)
    {
        List<string> searchResult = new List<string>();

        string dbConnStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        SqlConnection userConn = new SqlConnection(dbConnStr);

        StringBuilder sqlQuery = new StringBuilder();
        sqlQuery.AppendLine("SELECT FullName FROM Users");
        sqlQuery.AppendLine("WHERE FullName LIKE '%' + @paraFullName + '%' AND Role = 'student'");

        SqlCommand sqlCmd = new SqlCommand(sqlQuery.ToString(), userConn);
        sqlCmd.Parameters.AddWithValue("paraFullName", name);

        userConn.Open();

        SqlDataReader reader = sqlCmd.ExecuteReader();
        while (reader.Read())
        {
            searchResult.Add(reader["FullName"].ToString());
        }
        reader.Close();
        userConn.Close();

        return searchResult;
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            UserADO getUser = new UserADO();
            User user = new User();
            user = getUser.GetUserInfo(tbReceiver.Text);

            NotificationsADO notiADO = new NotificationsADO();
            notiADO.SendMail(user.userEmail, taMessage.InnerText, Session["ssFullName"].ToString(), tbSubject.Text);
            /*
            localhost.SMS sendSMS = new localhost.SMS();
            sendSMS.sendMessage("EAD48", "743601", user.userPhoneNo, taMessage.InnerText);*/
            lblErr.Text = "Your message has been successfully sent!";
            lblErr.Visible = true;
            lblErr.ForeColor = System.Drawing.Color.Green;
        }
        catch
        {
            lblErr.Text = "Uh oh! There is an error sending your message!";
            lblErr.Visible = true;
        }

    }
    protected void btClear_Click(object sender, EventArgs e)
    {
        tbReceiver.Text = "";
        tbSubject.Text = "";
        taMessage.InnerText = "";
    }
}