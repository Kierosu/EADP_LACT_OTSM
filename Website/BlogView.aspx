<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BlogView.aspx.cs" Inherits="BlogView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <br />  <br />  <br />  <br />  <br />  <br />  <br />
    <asp:Label ID="Label4" runat="server" Text="Blog View" Font-Size="30px"></asp:Label>
        <br />
        <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Height="54px" Text="Add Blog" Width="133px" Visible="False" OnClick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" CssClass="btn btn-success" runat="server" Height="54px" Text="Edit Blog" Width="133px" Visible="False" OnClick="Button2_Click" />
    <br />   
    <asp:GridView ID="GridViewTD" runat="server" AutoGenerateColumns="False" Height="129px" Width="1599px" >
        <Columns>
            <asp:BoundField DataField="BlogTitle" HeaderText="Blog Name" />
            <asp:TemplateField ControlStyle-CssClass="comment">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="500px" Width="1000px" ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("BlogImage")) %>' />
                </ItemTemplate>

<ControlStyle CssClass="comment"></ControlStyle>
            </asp:TemplateField>

            <asp:BoundField DataField="BlogDetails" HeaderText="Description" />
        </Columns>
    </asp:GridView>
    
    </asp:Content>

