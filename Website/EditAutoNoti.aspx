<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditAutoNoti.aspx.cs" Inherits="EditAutoNoti" %>

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
        <div style="margin-bottom: 1%" class="container" id="divContain">
        <div class="row">
            <h3 class="col-lg-10">Add Auto Notification</h3>
        </div>
        <div class="form-group row">
            <asp:Label ID="Label4" runat="server" Text="From:" CssClass="col-lg-1 col-form-label"></asp:Label>
            <asp:Label ID="lblSender" runat="server" CssClass="col-lg-7 form-control"></asp:Label>
        </div>
        <div class="form-group row">
            <asp:Label ID="Label2" runat="server" Text="Events to trigger:"  CssClass="col-lg-1 col-form-label"></asp:Label>            
            <asp:DropDownList ID="ddlEvents" runat="server" CssClass="form-control col-lg-7">
                <asp:ListItem Value="select">--Select--</asp:ListItem>
                <asp:ListItem Value="create">After creation of trips</asp:ListItem>
                <asp:ListItem Value="interview">After choosing students for interview</asp:ListItem>
                <asp:ListItem Value="update">After updating details of trips (after selecting students)</asp:ListItem>
            </asp:DropDownList>
        </div>   
        <div class="form-group row">
            <asp:Label ID="Label5" runat="server" Text="Subject:" CssClass="col-lg-1 col-form-label"></asp:Label>
            <asp:TextBox ID="tbSubject" runat="server" CssClass="form-control col-lg-7"></asp:TextBox>
        </div>
        <div class="form-group row">
            <div class="col-lg-1"></div>
            <textarea id="taMessage" runat="server" placeholder="Enter your message here" style="font-family:'Roboto Slab', sans-serif; height:175px;" class="col-lg-7 form-control"></textarea>
        </div>
            
        <div class="form-group row">
            <div class="col-lg-1"></div>
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-outline-primary btn-rounded waves-effect col-lg-2" OnClick="btnSave_Click"/>
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-outline-danger btn-rounded waves-effect col-lg-2" OnClick="btnBack_Click"/>
        </div>
        <div class="form-group row" style="display:none;" id ="errMsg" runat="server">
            <asp:Label ID="lblErr" runat="server" Text="" CssClass="col-form-label" ForeColor="Red" style="margin-left:9%;"></asp:Label>
        </div>
    </div>
</asp:Content>

