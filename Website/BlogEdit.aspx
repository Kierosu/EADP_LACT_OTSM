<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BlogEdit.aspx.cs" Inherits="BlogEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <br />  <br />  <br />  <br />  <br />  <br />  <br />
    <asp:Label ID="Label4" runat="server" Text="Blog Edit" Font-Size="30px"></asp:Label>  
    <br />
    <div class="form-group">
        <asp:Label ID="Label3" runat="server" Text="Description : "></asp:Label>
        <asp:Label ID="lblBlogDetails" runat="server"></asp:Label>
        <br />     
    </div>
    <br />
    <asp:GridView ID="GridViewTD" runat="server" AutoGenerateColumns="False" Height="129px" Width="1599px" Visible="False" OnRowCommand="GridViewTD_RowCommand">
        <Columns>

            <asp:BoundField DataField="Id" HeaderText="Id" />
            <asp:BoundField DataField="BlogTitle" HeaderText="Blog Name" />
            <asp:TemplateField ControlStyle-CssClass="comment">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="500px" Width="1000px" ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("BlogImage")) %>' CssClass="image" />
                </ItemTemplate>

<ControlStyle CssClass="comment"></ControlStyle>
            </asp:TemplateField>

            <asp:CommandField ShowSelectButton="True" HeaderText="Edit" />
        </Columns>
    </asp:GridView>
</asp:Content>

