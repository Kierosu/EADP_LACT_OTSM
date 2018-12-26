<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="loginFirst.aspx.cs" Inherits="loginFirst" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="divContain" style="margin-bottom:19.6%;" class="container">
    <div class="row">
    <asp:Label ID="lblError" runat="server" Text="Hey! Login first in order to access this page." Font-Bold="True" Font-Size="35px"></asp:Label>
    </div>
        <div class="row">
            <asp:Button ID="btnLoginPage" runat="server" Text="Go to login page" Width="220px" CssClass="btn aqua-gradient btn-rounded" OnClick="btnLoginPage_Click"/>
        </div>
    </div>
    
</asp:Content>

