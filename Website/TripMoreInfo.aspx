<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TripMoreInfo.aspx.cs" Inherits="TripMoreInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br /><br /><br /><br />
    <asp:Label ID="lblTitle" runat="server" Text="" Font-Size="30px"></asp:Label>
    <br />
    <div class="form-group">
        <asp:Label ID="LabelTripType" runat="server" Text="Type Of Trip : "></asp:Label>
        <asp:Label ID="lblTripType" runat="server"></asp:Label>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="LabelCountry" runat="server" Text="Country : "></asp:Label>
        <asp:Label ID="lblCountry" runat="server"></asp:Label>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="LabelLoc" runat="server" Text="Location : "></asp:Label>
        <asp:Label ID="lblLocation" runat="server"></asp:Label>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="LabelSlots" runat="server" Text="Slots : "></asp:Label>
        <asp:Label ID="lblSlots" runat="server"></asp:Label>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label7" runat="server" Text="Start Date : "></asp:Label>
        <asp:Label ID="lblStartDate" runat="server"></asp:Label>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label8" runat="server" Text="End Date : "></asp:Label>
        <asp:Label ID="lblEndDate" runat="server"></asp:Label>

    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="LabelTeachInCharge" runat="server" Text="Teacher - In - Charge : "></asp:Label>
        <asp:Label ID="lblTeacherInCharge" runat="server"></asp:Label>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label1" runat="server" Text="Plane Ticket Fees : $"></asp:Label>
        <asp:Label ID="lblPlaneFee" runat="server"></asp:Label>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label2" runat="server" Text="Insurance Fees : $"></asp:Label>
        <asp:Label ID="lblInsuFee" runat="server"></asp:Label>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label4" runat="server" Text="Accomodation Fees : $"></asp:Label>
        <asp:Label ID="lblAccoFee" runat="server"></asp:Label>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="LabelDetails" runat="server" Text="Details : "></asp:Label>
        <asp:Label ID="lblDetails" runat="server"></asp:Label>
    </div>
    <br />
    <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" Text="Go For Trip" OnClick="Button1_Click" />
</asp:Content>

