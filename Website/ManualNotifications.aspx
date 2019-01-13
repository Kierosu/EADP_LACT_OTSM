<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManualNotifications.aspx.cs" Inherits="ManualNotifications" %>

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
        @media(min-width:0px){
            #taMessage{
                height:175px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-bottom:1%" class="container" id="divContain">
        <div class="row">
            <h3 class="col-lg-10">Send Notification</h3>
        </div>
        <div class="form-group row">
            <asp:Label ID="Label1" runat="server" Text="Send To:" CssClass="col-lg-1 col-form-label"></asp:Label>
            <asp:TextBox ID="tbReceiver" runat="server" Width="326px" CssClass="form-control col-lg-7"></asp:TextBox>
        </div>
        <div class="form-group row">
            <asp:Label ID="Label2" runat="server" Text="Filter Students:"  CssClass="col-lg-1 col-form-label"></asp:Label>            
            <asp:DropDownList ID="ddlTripFilter" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control col-lg-7">
            </asp:DropDownList>
        </div>
        <div class="form-group row">
            <asp:Label ID="Label4" runat="server" Text="From:" CssClass="col-lg-1 col-form-label"></asp:Label>
            <asp:Label ID="lblSender" runat="server" CssClass="col-lg-7 form-control"></asp:Label>
        </div>
        <div class="form-group row">
            <asp:Label ID="Label5" runat="server" Text="Subject:" CssClass="col-lg-1 col-form-label"></asp:Label>
            <asp:TextBox ID="tbSubject" runat="server" CssClass="form-control col-lg-7"></asp:TextBox>
        </div>
        <div class="form-group row">
            <div class="col-lg-1"></div>
            <textarea id="taMessage" placeholder="Enter your message here" style="font-family:'Roboto Slab', sans-serif;" class="col-lg-7 form-control"></textarea>
        </div>
        <div class="form-group row">
            <div class="col-lg-1"></div>
            <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn btn-outline-primary btn-rounded waves-effect col-lg-2"/>
            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-outline-danger btn-rounded waves-effect col-lg-2"/>
        </div>
    </div>
</asp:Content>

