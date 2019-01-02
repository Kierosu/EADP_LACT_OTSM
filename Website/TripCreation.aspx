<%@ Page Title="Trip Creation" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TripCreation.aspx.cs" Inherits="TripCreation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            margin-bottom: 0px;
        }

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
        @media screen{
            #divContain{
                margin-bottom:5%;
            }
        }
        @media (min-width: 651px) {
            #divContain{
                margin-top:1%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label3" runat="server" Text="Trip Creation" Font-Size="30px"></asp:Label>
    <br />    
    <div class="form-group">
    <asp:Label ID="LabelTripName" runat="server" Text="Name Of Trip : "></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1"></asp:TextBox>
    </div>
    <br />
    <asp:Label ID="LabelTripType" runat="server" Text="Type Of Trip : "></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Value="0">--Select--</asp:ListItem>
        <asp:ListItem>Study Trip</asp:ListItem>
        <asp:ListItem>Internship</asp:ListItem>
        <asp:ListItem>Student Exchange Prog</asp:ListItem>
        <asp:ListItem>Immersion Trip</asp:ListItem>
    </asp:DropDownList>
    </div>
    <br />
    <div class="form-group">
    <asp:Label ID="LabelCountry" runat="server" Text="Country : "></asp:Label>
    <asp:DropDownList ID="DropDownList2" runat="server">
        <asp:ListItem Value="0">--Select--</asp:ListItem>
        <asp:ListItem Value="Indonesia">Indonesia</asp:ListItem>
        <asp:ListItem Value="Thailand">Thailand</asp:ListItem>
        <asp:ListItem Value="Philippines">Philippines</asp:ListItem>
        <asp:ListItem Value="Malaysia">Malaysia</asp:ListItem>
        <asp:ListItem Value="Singapore">Singapore</asp:ListItem>
        <asp:ListItem Value="Vietnam">Vietnam</asp:ListItem>
        <asp:ListItem Value="Cambodia">Cambodia</asp:ListItem>
        <asp:ListItem Value="Laos">Laos</asp:ListItem>
        <asp:ListItem Value="Brunei">Brunei</asp:ListItem>
        <asp:ListItem Value="America">America</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="LabelLoc" runat="server" Text="Location : "></asp:Label>
    <asp:TextBox ID="TextBox6" runat="server" CssClass="auto-style1"></asp:TextBox>
    </div>
    <br />
    <div class="form-group">
    <asp:Label ID="LabelDiploma" runat="server" Text="Diploma : "></asp:Label>
    <asp:DropDownList ID="DropDownList4" runat="server">
        <asp:ListItem Value="0">--Select--</asp:ListItem>
        <asp:ListItem Value="ITDF01">DIT</asp:ListItem>
        <asp:ListItem Value="ITDF03">DBI</asp:ListItem>
        <asp:ListItem Value="ITDF04">DEI</asp:ListItem>
        <asp:ListItem Value="ITDF07">DBT</asp:ListItem>
        <asp:ListItem Value="ITDF08">DSF</asp:ListItem>
        <asp:ListItem Value="ITDF10">DBA</asp:ListItem>
        <asp:ListItem Value="ITDF11">DFI</asp:ListItem>
    </asp:DropDownList>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="LabelYear" runat="server" Text="Year  : "></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style1" Width="35px"></asp:TextBox>

        <asp:Label ID="LabelMinGPA" runat="server" Text="Min GPA : "></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style1" Width="35px"></asp:TextBox>

        <asp:Label ID="LabelSlots" runat="server" Text="Slots : "></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server" CssClass="auto-style1" Width="35px"></asp:TextBox>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="LabelTeachInCharge" runat="server" Text="Teacher - In - Charge : "></asp:Label>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label1" runat="server" Text="Plane Ticket Fees : $"></asp:Label>
        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label2" runat="server" Text="Insurance Fees : $"></asp:Label>
        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label4" runat="server" Text="Accomodation Fees : $"></asp:Label>
        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label5" runat="server" Text="Total Fees : $"></asp:Label>
        <asp:Label ID="Label6" runat="server"></asp:Label>
    </div>
    <br />
    <asp:Label ID="LabelDetails" runat="server" Text="Details : "></asp:Label>

    <br />
    <asp:TextBox ID="TextBox5" runat="server" CssClass="auto-style1" Height="110px" Width="253px"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" Text="Confirm" />

</asp:Content>

