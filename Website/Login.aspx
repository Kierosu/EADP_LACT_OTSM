<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="stylesheet/login.css" rel="stylesheet" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 441px">
        <div class="navbarTab" style="position:absolute; top: 114px; left: 531px; width: 490px; border:1px solid black; height: 43px;">
          <asp:Button ID="btnStudent" runat="server" Text="Student" CssClass="tablinks active" OnClick="btnStudent_Click"/>
          <asp:Button ID="btnStaff" runat="server" Text="Staff" CssClass="tablinks" OnClick="btnStaff_Click"/>
          <asp:Button ID="btnAdmin" runat="server" Text="Admin" CssClass="tablinks" OnClick="btnAdmin_Click"/>
        </div>
        
        <div style="border:1px solid black; width:490px; height: 312px; position:absolute; top:159px; left:531px;">

            <asp:Label ID="Label3" runat="server" Text="OTMS Login" style="position:absolute; top: 18px; left: 64px; height: 32px; width: 219px;" Font-Size="30px"></asp:Label>
            
            <asp:Label ID="lblMessage" runat="server" Text="Use your admin number as username" style="position:absolute; top: 55px; left: 67px;" ForeColor="#1B66A4"></asp:Label>

            <asp:Label ID="Label1" runat="server" Text="Username: " style="position:absolute; top:112px; left:72px;"></asp:Label>

            <asp:Label ID="Label2" runat="server" Text="Password: " style="position:absolute; top:153px; left:72px;"></asp:Label>

            <asp:TextBox ID="tbPass" runat="server" style="position:absolute; top: 149px; left: 165px; width: 205px; height: 23px;"></asp:TextBox>

            <asp:TextBox ID="tbUsername" runat="server" style="position:absolute; top: 109px; left: 165px; width: 205px; height: 23px;"></asp:TextBox>

            <asp:HyperLink href="" ID="HyperLink1" runat="server" style="position:absolute; top: 185px; left: 163px; height: 25px; width: 146px;" ForeColor="Blue">Forget Password?</asp:HyperLink>

            <asp:Button ID="btnLogin" runat="server" CssClass="btnLogin" Text="Login" Font-Size="20px"/>

        </div>
    </div>
</asp:Content>

