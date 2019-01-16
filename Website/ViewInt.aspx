<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewInt.aspx.cs" Inherits="ViewInt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="DdlTripInterview" runat="server" AutoPostBack="True">
        <asp:ListItem>Hiroshima (Japan) Trip</asp:ListItem>
        <asp:ListItem>Taiwan Trip</asp:ListItem>
        <asp:ListItem>Germany Trip</asp:ListItem>
        <asp:ListItem>Japan Internship</asp:ListItem>
        <asp:ListItem>China Internship</asp:ListItem>
    </asp:DropDownList>
    <table class="table">
  <thead>
    <tr>
      <th scope="col">Interview Trip Name</th>
      <th scope="col">Date</th>
      <th scope="col">Location</th>
      <th scope="col">Reminder</th>
      <th scope="col">Click to Book</th>
    </tr>
  </thead>
  <tbody>
      <% foreach (var allDays in interviewDates()) { %>
        <% for (var i = 0; i < getDaysBetween(); i++) {
                float floatedI = float.Parse(i.ToString()); %>
    <tr>
      <th scope="row"><asp:label ID="Label1" Text="" runat="server"></asp:label><%= allDays.interviewName %></th>
      <td><%= allDays.interviewStartDate.AddDays(floatedI).ToShortDateString() %></td>
      <td><%= allDays.interviewLocation %></td>
      <td><%= allDays.interviewReminder %></td>
      <td>
          <asp:Button ID="btBook" runat="server" Text="Book" OnClick="btBook_OnClick"/></td>
    </tr>
        <% } %>
      <% } %>
  </tbody>
</table>
</asp:Content>

