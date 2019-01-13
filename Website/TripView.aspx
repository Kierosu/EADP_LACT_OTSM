<%@ Page Title="Trip View" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TripView.aspx.cs" Inherits="TripView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
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
    <br /><br /><br /><br /><br />
    <asp:Label ID="Label6" runat="server" Text="Trip View" Font-Size="30px"></asp:Label>
    <asp:GridView ID="GridViewTD" runat="server" AutoGenerateColumns="False" Height="129px" Width="1599px" OnSelectedIndexChanged="GridViewTD_SelectedIndexChanged">
        <Columns>
            <asp:BoundField HeaderText="Trip Name" DataField="TripName" />
            <asp:BoundField HeaderText="Type Of Trip" DataField="TripType" />
            <asp:BoundField HeaderText="Country" DataField="TripCountry" />
            <asp:BoundField HeaderText="Location" DataField="TripLocation" />
            <asp:BoundField HeaderText="Start Date" DataField="TripStartDate" />
            <asp:BoundField HeaderText="Teacher-In-Charge" DataField="TripTeacherInCharge" />
            <asp:BoundField HeaderText="Slots" DataField="TripSlots" />
            <asp:CommandField HeaderText="Click For More Info" ShowHeader="True" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    <br />    
</asp:Content>

