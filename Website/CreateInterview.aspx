<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="stylesheet/createInterview.css" rel="stylesheet" /> 
    <style type="text/css">
        .auto-style1 {
            height: 550px;
            width: 1200px;
        }
        .auto-style2 {
            margin-left: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  

        <div class="auto-style1" style="margin:auto;">
            <h1 class="auto-style2"> Create Interview Dates </h1>
            <form action="#">
                &nbsp;&nbsp;&nbsp;
                Interview For:  
                <asp:DropDownList ID="DropDownList1" CssClass="dropDownTrips" runat="server">
                    <asp:ListItem>Hiroshima (Japan) Trip</asp:ListItem>
                    <asp:ListItem>Taiwan Trip</asp:ListItem>
                    <asp:ListItem>Germany Trip</asp:ListItem>
                    <asp:ListItem>Japan Internship</asp:ListItem>
                    <asp:ListItem>China Internship</asp:ListItem>
                </asp:DropDownList>
                 &nbsp;&nbsp;&nbsp;
                From: <input type="date" id="tbInterviewStartDate">
                 &nbsp;&nbsp;&nbsp;
                To: <input type="date" id="tbInterviewEndDate"
            </form>
              &nbsp;&nbsp;&nbsp;
             Location: <asp:TextBox ID="tbLocation" CssClass="tbLocation" runat="server"></asp:TextBox>
            
            &nbsp;&nbsp;&nbsp;
            
            Reminder:
            <asp:TextBox ID="TextBox1" CssClass="tbReminder" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" CssClass="btPost" runat="server" Text="Post" />
   
        </div>
        </div>
    </div>
</asp:Content>

