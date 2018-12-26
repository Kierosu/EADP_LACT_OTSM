<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Error401.aspx.cs" Inherits="Error401" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        @media (max-width: 980px) {
            #divContain{
                margin-top:13%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="divContain" style="margin-bottom:5.4%;" class="container">
        <div class="row">
          <asp:Label ID="Label1" runat="server" Text="Unauthorized Access." Font-Bold="True" Font-Size="35px" ForeColor="Red" CssClass="col-lg-8"></asp:Label>
        </div>
        <div class="row">
       <asp:Label ID="lblError" runat="server" Text="Oops! Looks like you do not have the permission to access this page." Font-Bold="True" Font-Size="35px" CssClass="col-lg-12"></asp:Label>
        </div>
        <img src="images/unauthorized.jpg" alt="Unauthorized picture" class="mx-auto d-block"/>
    </div>
</asp:Content>

