<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageStaff.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="CreateInt.aspx.cs" Inherits="CreateInt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .bodyControl {
            padding-left:1%;
            padding-right:1%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Extended default form grid -->
<div class="bodyControl">
<form>
    <h1>Create Interview Dates</h1>
  <!-- Grid row -->
    <!-- Default input -->
    <div class="form-group">
      <label for="interviewLabel">Interview For: </label>
        <asp:DropDownList ID="DdlTrips" CssClass="form-control" runat="server" DataSourceID="SqlDataTripNames">
            <asp:ListItem>Hiroshima (Japan) Trip</asp:ListItem>
            <asp:ListItem>Taiwan Trip</asp:ListItem>
            <asp:ListItem>Germany Trip</asp:ListItem>
            <asp:ListItem>Japan Internship</asp:ListItem>
            <asp:ListItem>China Internship</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataTripNames" runat="server"></asp:SqlDataSource>
    </div>
  <!-- Grid row -->

  <!-- Default input -->
  <div class="form-row">
  <div class="form-group col-md-6">
    <label for="dateFrom">Start Date: </label>
      <asp:TextBox ID="tbStartDate" CssClass="form-control" type="date" runat="server"></asp:TextBox>
  </div>
  <div class="form-group col-md-6">
    <label for="dateTo">End Date: </label>
      <asp:TextBox ID="tbEndDate" CssClass="form-control" type="date" runat="server"></asp:TextBox>
  </div>
   </div>
  <!-- Default input -->
  <div class="form-group">
    <label for="interviewLocation">Location: </label>
    <asp:TextBox ID="tbLocation" CssClass="form-control" runat="server"></asp:TextBox>
  </div>
  <div class="form-group">
    <label for="interviewReminder">Reminder: </label>
    <asp:TextBox ID="tbRemind" CssClass="form-control" runat="server"></asp:TextBox>
  </div>
  <div class="form-group">
    <asp:Button ID="btCreate" CssClass="btn btn cyan darken-4  btn-md" Text="Create" OnClick="btCreate_Click" runat="server"/>
  </div>
    <asp:Label ID="lbNotify" runat="server" Text=""></asp:Label>
</form>
</div>
<!-- Extended default form grid -->
</asp:Content>

