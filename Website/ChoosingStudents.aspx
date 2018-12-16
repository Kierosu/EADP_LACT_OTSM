<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div class="auto-style14" style="margin:auto;">
           <h1>Choosing Students</h1>
           <br />
    <table style="width:100%;" id="students">
        <tr>
            <td class="auto-style1">No.</td>
            <td class="auto-style2">Name</td>
            <td class="auto-style3">Admin Number</td>
            <td class="auto-style4">GPA</td>
            <td class="auto-style5">First Time Applying</td>
            <td class="auto-style6">Singaporean / PR</td>
            <td class="auto-style15">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">Chloe Tay</td>
            <td class="auto-style3">174220T</td>
            <td class="auto-style4">3.50</td>
            <td class="auto-style5">Yes</td>
            <td class="auto-style6">Singaporean</td>
            <td class="auto-style15">
                <asp:CheckBox ID="CheckBox1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">John Tan</td>
            <td class="auto-style3">172323Q</td>
            <td class="auto-style4">3.90</td>
            <td class="auto-style5">Yes</td>
            <td class="auto-style6">PR</td>
            <td class="auto-style15">
                <asp:CheckBox ID="CheckBox2" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style7"></td>
            <td class="auto-style8">Lim Choon Shim</td>
            <td class="auto-style9">179623D</td>
            <td class="auto-style10">3.92</td>
            <td class="auto-style11">No</td>
            <td class="auto-style12">Singaporean</td>
            <td class="auto-style16">
                <asp:CheckBox ID="CheckBox3" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">Darrell Yeo</td>
            <td class="auto-style3">179586E</td>
            <td class="auto-style4">3.36</td>
            <td class="auto-style5">No</td>
            <td class="auto-style6">Singaporean</td>
            <td class="auto-style15">
                <asp:CheckBox ID="CheckBox4" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">Celine Chue</td>
            <td class="auto-style3">170392Y</td>
            <td class="auto-style4">3.15</td>
            <td class="auto-style5">Yes</td>
            <td class="auto-style6">N.A.</td>
            <td class="auto-style15">
                <asp:CheckBox ID="CheckBox5" runat="server" />
            </td>
        </tr>
        </table>
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
           &nbsp;
    <asp:Button ID="Button1" runat="server" Text="Confirm" />
       </div>
</asp:Content>

