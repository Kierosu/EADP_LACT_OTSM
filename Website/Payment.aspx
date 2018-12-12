<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Plane Ticket Fees : $"></asp:Label>
    <asp:Label ID="Label7" runat="server"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Insurance Fees : $"></asp:Label>
    <asp:Label ID="Label8" runat="server"></asp:Label>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Accomodation Fees : $"></asp:Label>
    <asp:Label ID="Label9" runat="server"></asp:Label>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Total Fees : $"></asp:Label>
    <asp:Label ID="Label6" runat="server"></asp:Label>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Payment Method : "></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server">
    </asp:DropDownList>
    <br />
    <asp:Label ID="Label10" runat="server" Text="First Name : "></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server" Width="143px"></asp:TextBox>
    <asp:Label ID="Label11" runat="server" Text="Last Name : "></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server" Width="150px"></asp:TextBox>
    <br />
    <asp:Label ID="Label12" runat="server" Text="Credit Card No : "></asp:Label>
    <asp:TextBox ID="TextBox3" runat="server" Width="151px"></asp:TextBox>
&nbsp;<asp:Label ID="Label13" runat="server" Text="Expiration Date : "></asp:Label>
    <asp:TextBox ID="TextBox4" runat="server" Width="89px"></asp:TextBox>
    <br />
    <asp:Label ID="Label14" runat="server" Text="SVC : "></asp:Label>
    <asp:TextBox ID="TextBox5" runat="server" Width="52px"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Confirm" />
</asp:Content>

