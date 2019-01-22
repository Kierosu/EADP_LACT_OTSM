<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BlogEAD.aspx.cs" Inherits="BlogEAD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /> <br /> <br /> <br /> <br /> 
    <asp:Label ID="Label4" runat="server" Text="Blog Edit and Delete" Font-Size="30px"></asp:Label>
    <br />    
    <div class="form-group">
    <asp:Label ID="Label1" runat="server" Text="Blog Title : "></asp:Label>
    <asp:TextBox ID="tbBlogTitle" runat="server"></asp:TextBox>
    </div>
    <br />
    <div class="form-group">
    <asp:Label ID="Label2" runat="server" Text="Upload Image : "></asp:Label>
    <asp:FileUpload ID="FileUpload1" runat="server" />
    </div>
    <br />
    <div class="form-group">
    <asp:Label ID="Label3" runat="server" Text="Description : "></asp:Label>
    <br />
    <asp:TextBox ID="tbBlogDetails" runat="server" Height="108px" Width="205px"></asp:TextBox>
    <br />
    </div>
    <asp:Button ID="ButtonCfm" cssClass="btn btn-success" runat="server" Text="Edit" OnClick="Button1_Click" Height="44px" Width="144px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <asp:Button ID="ButtonDelete" cssClass="btn btn-danger" runat="server" Text="Delete" OnClick="ButtonDelete_Click" Height="44px" Width="144px" />
</asp:Content>

