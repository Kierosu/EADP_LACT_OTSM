<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BlogPost.aspx.cs" Inherits="BlogPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Blog Title : "></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Upload Image : "></asp:Label>
    <asp:ImageButton ID="ImageButton1" runat="server" Width="26px" />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Description : "></asp:Label>
    <br />
    <asp:TextBox ID="TextBox2" runat="server" Height="108px" Width="205px"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Confirm" />
</asp:Content>

