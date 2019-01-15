<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TripsImgoing.aspx.cs" Inherits="TripsImgoing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br /><br /><br /><br />
    <asp:Label ID="Label6" runat="server" Text="Trips I am going for" Font-Size="30px"></asp:Label>
    <asp:GridView ID="GridViewTD" runat="server" AutoGenerateColumns="False" Height="129px" Width="1599px" OnRowCommand="GridViewTD_RowCommand">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Trip Id" />
            <asp:BoundField HeaderText="Trip Name" DataField="TripName" />
            <asp:BoundField HeaderText="Type Of Trip" DataField="TripType" />
            <asp:BoundField HeaderText="Country" DataField="TripCountry" />
            <asp:BoundField HeaderText="Location" DataField="TripLocation" />
            <asp:BoundField HeaderText="Start Date" DataField="TripStartDate" />
            <asp:BoundField HeaderText="Teacher-In-Charge" DataField="TripTeacherInCharge" />
            <asp:CommandField HeaderText="Click to see Blog" ShowHeader="True" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    <br />    
</asp:Content>

