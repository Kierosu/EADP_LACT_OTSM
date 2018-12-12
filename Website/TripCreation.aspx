<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TripCreation.aspx.cs" Inherits="TripCreation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            margin-bottom: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="LabelTripName" runat="server" Text="Name Of Trip : "></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1"></asp:TextBox>
    <br />
    <asp:Label ID="LabelTripType" runat="server" Text="Type Of Trip : "></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server">
    </asp:DropDownList>
    <br />
    <asp:Label ID="LabelLoc" runat="server" Text="Location : "></asp:Label>
    <asp:DropDownList ID="DropDownList2" runat="server">
    </asp:DropDownList>
    <br />
    <asp:Label ID="LabelSchool" runat="server" Text="School : "></asp:Label>
    &nbsp;<asp:DropDownList ID="DropDownList3" runat="server">
    </asp:DropDownList>
&nbsp;&nbsp;
    <asp:Label ID="LabelDiploma" runat="server" Text="Diploma : "></asp:Label>
    <asp:DropDownList ID="DropDownList4" runat="server">
    </asp:DropDownList>
    <br />
    <asp:Label ID="LabelYear" runat="server" Text="Year  : "></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style1" Width="29px"></asp:TextBox>
    <asp:Label ID="LabelMinGPA" runat="server" Text="Min GPA : "></asp:Label>
    <asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style1" Width="29px"></asp:TextBox>
    <br />
    <asp:Label ID="LabelSlots" runat="server" Text="Slots : "></asp:Label>
    <asp:TextBox ID="TextBox4" runat="server" CssClass="auto-style1" Width="29px"></asp:TextBox>
    <br />
    <asp:Label ID="LabelTeachInCharge" runat="server" Text="Teacher - In - Charge : "></asp:Label>
    <br />
    <asp:Label ID="LabelDetails" runat="server" Text="Details : "></asp:Label>

    <br />
    <asp:TextBox ID="TextBox5" runat="server" CssClass="auto-style1" Height="110px" Width="253px"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Confirm" />

</asp:Content>

