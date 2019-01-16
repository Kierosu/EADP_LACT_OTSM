<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BlogView.aspx.cs" Inherits="BlogView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <br />  <br />  <br />  <br />  <br />  <br />  <br />
    <asp:Label ID="Label4" runat="server" Text="Blog View" Font-Size="30px"></asp:Label>
        <br />
        <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Height="54px" Text="Add Blog" Width="133px" Visible="False" OnClick="Button1_Click" />
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

    <asp:GridView ID="GridViewTD" runat="server" AutoGenerateColumns="False" Height="129px" Width="1599px">
        <Columns>
            <asp:BoundField DataField="BlogTitle" HeaderText="Blog Name" />
            <asp:TemplateField HeaderText="Blog Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#"ShowImage.ashx?getID="+Eval("characterID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="BlogDetails" HeaderText="Description" />
        </Columns>
    </asp:GridView>
    
    </asp:Content>

