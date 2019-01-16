<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BlogView.aspx.cs" Inherits="BlogView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <br />  <br />  <br />  <br />  <br />  
    <asp:Label ID="Label4" runat="server" Text="Blog View" Font-Size="30px"></asp:Label>
    <br />    
    <div class="form-group">
        <asp:Label ID="Label1" runat="server" Text="Blog Title : "></asp:Label>
        
        <asp:Label ID="lblBlogTitle" runat="server"></asp:Label>
        
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label2" runat="server" Text="Upload Image : "></asp:Label>
        
        <asp:Image ID="Image1" runat="server" Height="316px" Width="700px" />
        
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label3" runat="server" Text="Description : "></asp:Label>
        <asp:Label ID="lblBlogDetails" runat="server"></asp:Label>
        
        <br />
        
    </div>
    <br />
    </asp:Content>

