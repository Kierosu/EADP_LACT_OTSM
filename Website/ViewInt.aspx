<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewInt.aspx.cs" Inherits="ViewInt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="DdlTripInterview" runat="server" AutoPostBack="True">
        <asp:ListItem>Hiroshima (Japan) Trip</asp:ListItem>
    </asp:DropDownList>
    <table class="table">
  <thead>
    <tr>
      <th scope="col">Interview Trip Name</th>
      <th scope="col">Start Date</th>
      <th scope="col">End Date</th>
      <th scope="col">Location</th>
      <th scope="col">Reminder</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row"><asp:label ID="LblTripName" runat="server"></asp:label></th>
      <td><asp:label ID="LblStartDate" runat="server"></asp:label></td>
      <td><asp:label ID="LblEndDate" runat="server"></asp:label></td>
      <td><asp:label ID="LblLocation" runat="server"></asp:label></td>
      <td><asp:label ID="LblReminder" runat="server"></asp:label></td>
    </tr>
  </tbody>
</table>
</asp:Content>

