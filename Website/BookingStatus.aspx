<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageStaff.master" AutoEventWireup="true" CodeFile="BookingStatus.aspx.cs" Inherits="BookingStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-row">
        <div class="form-group col-md-2">
            <asp:DropDownList ID="DdlInterviewStatus" runat="server" DataSourceID="SqlTripInterview"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlTripInterview" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [interviewName] FROM [CreateInterview]"></asp:SqlDataSource>
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-md-2">
            <asp:Button ID="btGetStatus" OnClick="btGetStatus_Click" CssClass="btn btn cyan darken-4 col-md-1" runat="server" Text="Get" />
        </div>
    </div>
    <asp:GridView ID="GridViewBooking" runat="server"></asp:GridView>
</asp:Content>

