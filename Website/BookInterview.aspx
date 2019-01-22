<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BookInterview.aspx.cs" Inherits="BookInterview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="stylesheet/createInterview.css" rel="stylesheet" /> 
    <style type="text/css">
        .bodyControl {
            padding-left:1%;
            padding-right:1%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="bodyControl">
<form>
    <h1>Book Interview Slot</h1>

    <div class="form-row">
        <div class="form-group col-md-6">
          <label for="interviewName">Booking Interview for: </label>
            <asp:Label ID="lbInterviewTripName" CssClass="form-control" runat="server" Font-Bold="True"></asp:Label>          
        </div>
        <div class="form-group col-md-6">
            <label for="interviewDateLabel">Occuring On: </label>
            <asp:DropDownList ID="DdlTripDates" CssClass="form-control" runat="server"></asp:DropDownList>
        </div>
    </div>

  <div class="form-row">
      <div class="form-group col-md-6">
        <label for="dateFrom">Student Name: </label>
          <asp:Label ID="lbStudentName" CssClass="form-control" runat="server"></asp:Label>
      </div>
      <div class="form-group col-md-6">
        <label for="dateTo">Admin No: </label>
          <asp:Label ID="lbStudentAdminNo" CssClass="form-control" runat="server"></asp:Label>
      </div>
   </div>

  <div class="form-row">
      <div class="form-group col-md-6">
        <label for="location">Location: </label>
          <asp:Label ID="lbInterviewLocation" CssClass="form-control" runat="server"></asp:Label>
      </div>
      <div class="form-group col-md-6">
        <label for="reminder">Reminder: </label>
          <asp:Label ID="lbInterviewReminder" CssClass="form-control" runat="server"></asp:Label>
      </div>
  </div>

    <!-- Students Input Details Section -->
    <h3>Input the Following Details</h3>
    <div class="form-row">       
        <div class="form-group col-md-6">
            <label for="allergy">Allergy(if any): </label>
            <asp:TextBox ID="tbAllergy" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
         <div class="form-group col-md-6">
            <label for="dietRestriction">Dietary Restrictions(if any): </label>
            <asp:TextBox ID="tbDietRestrict" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="firstTime">First Time Applying: </label>
            <asp:RadioButtonList ID="rbtListFirstTimeApply" runat="server">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div class="form-group col-md-6">
            <label for="medication">Medication(if any): </label>
            <asp:TextBox ID="tbMedication" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="sgPR">Are you either Singaporean/PR? </label>
            <asp:RadioButtonList ID="rbtListNationality" runat="server">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
        </div>       
    </div>
    <div class="form-group">
        <asp:Button ID="btBook" CssClass="btn btn cyan darken-4  btn-md" Text="Book" OnClick="btBook_Click" runat="server"/>
    </div>
    <asp:Label ID="lbNotify" runat="server"></asp:Label>
</div>
<!-- Extended default form grid -->
</asp:Content>

