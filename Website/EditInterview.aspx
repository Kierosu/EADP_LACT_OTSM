<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/MasterPageStaff.master" AutoEventWireup="true" CodeFile="EditInterview.aspx.cs" Inherits="EditInterview" %>

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
    <h3>Edit Details for: <asp:Label ID="lbInterviewName" runat="server" Font-Bold="True"></asp:Label></h3>

  <div class="form-row">
  <div class="form-group col-md-6">
    <label for="dateFrom">Start Date: </label>   
      <asp:TextBox ID="tbStartDate" CssClass="form-control" type="date" runat="server"></asp:TextBox>
    <br /><label>Previous Start Date: <asp:Label ID="lbPrevStartDate" runat="server" Font-Bold="True"></asp:Label></label>
  </div>
  <div class="form-group col-md-6">
    <label for="dateTo">End Date: </label>
      <asp:TextBox ID="tbEndDate" CssClass="form-control" type="date" runat="server"></asp:TextBox>
      <br /><label>Previous End Date: <asp:Label ID="lbPrevEndDate" runat="server" Font-Bold="True"></asp:Label></label>
  </div>
   </div>
  <!-- Default input -->
  <div class="form-group">
    <label for="interviewLocation">Location: </label>
    <asp:TextBox ID="tbLocation" CssClass="form-control" runat="server"></asp:TextBox>
    <br /><label>Previous Location: <asp:Label ID="lbLocation" runat="server" Font-Bold="True"></asp:Label></label>
  </div>
  <div class="form-group">
    <label for="interviewReminder">Reminder: </label>
    <asp:TextBox ID="tbRemind" CssClass="form-control" Text="" runat="server"></asp:TextBox>
  </div>
  <div class="form-group">
    <asp:Button ID="btUpdate" CssClass="btn btn cyan darken-4  btn-md" Text="Save Changes" OnClick="btUpdate_Click" runat="server"/>
  </div>
    <asp:Label ID="lbNotify" runat="server" Text=""></asp:Label>
</form>
</div>
<!-- Extended default form grid -->
</asp:Content>

