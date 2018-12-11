<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManualNotifications.aspx.cs" Inherits="ManualNotifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="stylesheet/manualnoti.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 540px">
        <h3>Send Notification</h3>
        <asp:Label ID="Label1" runat="server" Text="Send To: "></asp:Label>
        <asp:TextBox ID="tbReceiver" runat="server" Width="326px"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Filter Trip"></asp:Label>
        <div class="tooltip">(?)
          <span class="tooltiptext">Tooltip text</span>
        </div>
        :
        <asp:DropDownList ID="ddlTripFilter" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="199px">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label4" runat="server" Text="From: "></asp:Label>
        <asp:Label ID="lblSender" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label5" runat="server" Text="Subject: "></asp:Label>
        <asp:TextBox ID="tbSubject" runat="server"></asp:TextBox>
        <br /><br />
        <textarea id="taMessage" placeholder="Enter your message here" style="font-family:'Roboto Slab', sans-serif;"></textarea>


        <br />
        <br />
        <br />
        <asp:Button ID="btnSend" runat="server" Text="Send" Width="120px" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnClear" runat="server" Text="Clear" Width="120px" />


    </div>
</asp:Content>

