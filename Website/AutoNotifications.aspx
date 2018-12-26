<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AutoNotifications.aspx.cs" Inherits="AutoNotifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        @media (max-width: 980px) {
            #divContain{
                margin-top:13%;
            }
        }
        @media (max-width: 650px) {
            #divContain{
                margin-top:22%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container" style="margin-bottom:13.8%;" id="divContain">
        <div class="row">
            <h3 class="col-lg-10">Auto Notification</h3>
        </div>
        <div class="row">
            <p class="col-lg-10" style="font-size:15px">You can set an event in order to send notifications (for example: after seleceting students for interview, a notification will automatically be sent to them)</p>
        </div>
        <div class="row">
            <asp:Button ID="btnAddNoti" runat="server" Text="Add" CssClass="btn btn-outline-primary btn-rounded waves-effect col-lg-2"/>
        </div>
        <div class="row">
            <p class="col-lg-10" style="font-size:15px; display:none; color:red;" id="noneMsg" runat="server">You seems to have no auto notifications. Click the add button to add a new one!</p>
            <asp:GridView ID="gvAutoNoti" runat="server"></asp:GridView>
        </div>
     </div>
</asp:Content>

