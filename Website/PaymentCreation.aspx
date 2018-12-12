<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PaymentCreation.aspx.cs" Inherits="PaymentCreation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Plane Ticket Fees : $"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Insurance Fees : $"></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Accomodation Fees : $"></asp:Label>
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Total Fees : $"></asp:Label>
    <asp:Label ID="Label6" runat="server"></asp:Label>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Students : "></asp:Label>
    <asp:CheckBoxList ID="CheckBoxList1" runat="server">
    </asp:CheckBoxList>
    <asp:Button ID="Button1" runat="server" Text="Confirm" />
</asp:Content>

