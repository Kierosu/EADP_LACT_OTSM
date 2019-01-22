<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewInt.aspx.cs" Inherits="ViewInt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .bodyControl {
            padding-left:1%;
            padding-right:1%;
        }
    </style>
    <script>
        $("#")
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bodyControl">
        <div class="form-row">
            <asp:DropDownList OnSelectedIndexChanged="DdlTripInterview_SelectedIndexChanged" ID="DdlTripInterview" CssClass="form-control col-md-4" runat="server" AutoPostBack="True" DataSourceID="SqlTripNames" DataTextField="interviewName" DataValueField="interviewName">
            </asp:DropDownList>
        <% if (Session["ssRole"].Equals("staff")) { %>
            <asp:Button ID="btEditInterview" CssClass="btn btn cyan darken-4 col-md-1 ml-auto" OnClick="btEditInterview_Click" runat="server" Text="Edit" />           
        </div>
        
        <asp:ScriptManager ID="ScriptManager" runat="server" />
        <asp:UpdatePanel ID="updatePanelDelete" UpdateMode="Conditional" runat="server">  
            <ContentTemplate>
                <div class="form-row">   
                    <asp:Button ID="btDeleteInterview" OnClick="btDeleteInterview_Click" CssClass="btn btn cyan darken-4 col-md-1 ml-auto" runat="server" Text="Delete" />
                </div>
            </ContentTemplate>   
        </asp:UpdatePanel>       
        
            <asp:Label ID="lbNotify" runat="server" Text=""></asp:Label>
        <% } %>
        <asp:SqlDataSource ID="SqlTripNames" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [interviewName] FROM [CreateInterview]"></asp:SqlDataSource>
        <table class="table">
          <thead>
            <tr>
              <th scope="col">Interview Trip Name</th>
              <th scope="col">Date</th>
              <th scope="col">Location</th>
              <th scope="col">Reminder</th>
              <% if (Session["ssRole"].Equals("student"))
                   { %>
              <th scope="col">Click to Book</th>
                <% } %>
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
                  <% if (Session["ssRole"].Equals("student"))
                  { %>
                  <asp:Button ID="btBook" runat="server" CssClass="btn btn cyan darken-4" Text="Book" OnClick="btBook_OnClick"/></td>
                  <% } %>
            </tr>
                <% } %>
              <% } %>
          </tbody>
        </table>
    </div>

    <div id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header cyan darken-4">
                        <h4 class="modal-title" id="myModalLabel" style="color:white;">Confirmation</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>                       
                    </div>
                    <div class="modal-body">
                        <h4>Are you sure you want to delete?</h4>                      
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnYesDelete" CssClass="btn btn cyan darken-4" runat="server" Text="Yes"  OnClick="btnYesDelete_Click"/>
                        <asp:UpdatePanel ID="updatePanelYesNo" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                
                                <asp:Button ID="btnNoDelete" CssClass="btn btn cyan darken-4" runat="server" Text="No" OnClick="btnNoDelete_Click"/>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

