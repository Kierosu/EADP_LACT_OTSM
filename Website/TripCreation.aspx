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
    <script type="text/javascript">
        function diplomaClientValidation(source, args) {
           var chkListModules = document.getElementById('<%= chkDiploma.ClientID %>');
           var chkListinputs = chkListModules.getElementsByTagName("input");
           for (var i = 0; i < chkListinputs.length; i++) {
               if (chkListinputs[i].checked) {
                   args.IsValid = true;
                   return;
               }
           }
           args.IsValid = false;
        };

        function yearClientValidation(source, args) {
           var chkListModules = document.getElementById('<%= chkYear.ClientID %>');
           var chkListinputs = chkListModules.getElementsByTagName("input");
           for (var i = 0; i < chkListinputs.length; i++) {
               if (chkListinputs[i].checked) {
                   args.IsValid = true;
                   return;
               }
           }
           args.IsValid = false;
        };

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />  <br />  <br />  <br />  <br />  
    <asp:Label ID="Label3" runat="server" Text="Trip Creation" Font-Size="30px"></asp:Label>
    <br />    
    <div class="form-group">
    <asp:Label ID="LabelTripName" runat="server" Text="Name Of Trip : "></asp:Label>
    <asp:TextBox ID="tbTripname" runat="server" CssClass="auto-style1"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbTripname" ForeColor="Red">* Please fill in Name of Trip</asp:RequiredFieldValidator>
    </div>
    <br />
    <div class="form-group">
    <asp:Label ID="LabelTripType" runat="server" Text="Type Of Trip : "></asp:Label>
    <asp:DropDownList ID="ddlTripType" runat="server">
        <asp:ListItem Value="0">--Select--</asp:ListItem>
        <asp:ListItem Value="Study">Study Trip</asp:ListItem>
        <asp:ListItem Value="Internship">Internship</asp:ListItem>
        <asp:ListItem Value="Exchange">Student Exchange Prog</asp:ListItem>
        <asp:ListItem Value="Immersion">Immersion Trip</asp:ListItem>
    </asp:DropDownList>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddlTripType" ForeColor="Red" ValueToCompare="0" Operator="NotEqual">* Please Choose a Type of Trip</asp:CompareValidator>
    </div>
    <br />
    <div class="form-group">
    <asp:Label ID="LabelCountry" runat="server" Text="Country : "></asp:Label>
    <asp:DropDownList ID="ddlCountry" runat="server">
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
        <asp:ListItem Value="South Korea">South Korea</asp:ListItem>
        <asp:ListItem Value="Japan">Japan</asp:ListItem>
    </asp:DropDownList>
        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="ddlCountry" ForeColor="Red" ValueToCompare="0" Operator="NotEqual">* Please Choose a Country </asp:CompareValidator>
    <asp:Label ID="LabelLoc" runat="server" Text="Location : "></asp:Label>
    <asp:TextBox ID="tbLocation" runat="server" CssClass="auto-style1"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbLocation" ForeColor="Red">* Please fill in Trip Location</asp:RequiredFieldValidator>
    </div>
    <br />
    <div class="form-group">
    <asp:Label ID="LabelDiploma" runat="server" Text="Diploma : "></asp:Label>
        <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" ClientValidationFunction="diplomaClientValidation">* Please choose at least 1 diploma</asp:CustomValidator>
        <asp:CheckBoxList ID="chkDiploma" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="DIT">DIT</asp:ListItem>
            <asp:ListItem Value="DBI">DBI</asp:ListItem>
            <asp:ListItem Value="DCS">DCS</asp:ListItem>
            <asp:ListItem Value="DSF">DSF</asp:ListItem>
            <asp:ListItem Value="DFI">DFI</asp:ListItem>
            <asp:ListItem Value="DBA">DBA</asp:ListItem>
        </asp:CheckBoxList>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="LabelYear" runat="server" Text="Year  : "></asp:Label>
        <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="CustomValidator" ForeColor="Red"  ClientValidationFunction="yearClientValidation">* Please choose at least 1 year of Students</asp:CustomValidator>
        <asp:CheckBoxList ID="chkYear" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
        </asp:CheckBoxList>

        <asp:Label ID="LabelMinGPA" runat="server" Text="Min GPA : "></asp:Label>
        <asp:TextBox ID="tbGPAmin" runat="server" CssClass="auto-style1" Width="35px"></asp:TextBox>

        <asp:Label ID="lblGPAmin" runat="server" ForeColor="Red"></asp:Label>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbGPAmin" ForeColor="Red">* Please fill in Minimum GPA required </asp:RequiredFieldValidator>

        <asp:Label ID="LabelSlots" runat="server" Text="Slots : "></asp:Label>
        <asp:TextBox ID="tbSlots" runat="server" CssClass="auto-style1" Width="35px"></asp:TextBox>
        <asp:Label ID="lblSlots" runat="server" ForeColor="Red"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbSlots" ForeColor="Red">* Please fill in Number of Slots </asp:RequiredFieldValidator>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label7" runat="server" Text="Start Date : "></asp:Label>
        <asp:DropDownList ID="ddlStartday" runat="server">
            <asp:ListItem Value="0">DD</asp:ListItem>
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
            <asp:ListItem Value="6">6</asp:ListItem>
            <asp:ListItem Value="7">7</asp:ListItem>
            <asp:ListItem Value="8">8</asp:ListItem>
            <asp:ListItem Value="9">9</asp:ListItem>
            <asp:ListItem Value="10">10</asp:ListItem>
            <asp:ListItem Value="11">11</asp:ListItem>
            <asp:ListItem Value="12">12</asp:ListItem>
            <asp:ListItem Value="13">13</asp:ListItem>
            <asp:ListItem Value="14">14</asp:ListItem>
            <asp:ListItem Value="15">15</asp:ListItem>
            <asp:ListItem Value="16">16</asp:ListItem>
            <asp:ListItem Value="17">17</asp:ListItem>
            <asp:ListItem Value="18">18</asp:ListItem>
            <asp:ListItem Value="19">19</asp:ListItem>
            <asp:ListItem Value="20">20</asp:ListItem>
            <asp:ListItem Value="21">21</asp:ListItem>
            <asp:ListItem Value="22">22</asp:ListItem>
            <asp:ListItem Value="23">23</asp:ListItem>
            <asp:ListItem Value="24">24</asp:ListItem>
            <asp:ListItem Value="25">25</asp:ListItem>
            <asp:ListItem Value="26">26</asp:ListItem>
            <asp:ListItem Value="27">27</asp:ListItem>
            <asp:ListItem Value="28">28</asp:ListItem>
            <asp:ListItem Value="29">29</asp:ListItem>
            <asp:ListItem Value="30">30</asp:ListItem>
            <asp:ListItem Value="31">31</asp:ListItem>
        </asp:DropDownList>
        &nbsp;
        <asp:DropDownList ID="ddlStartmth" runat="server">
            <asp:ListItem Value="0">MM</asp:ListItem>
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
            <asp:ListItem Value="6">6</asp:ListItem>
            <asp:ListItem Value="7">7</asp:ListItem>
            <asp:ListItem Value="8">8</asp:ListItem>
            <asp:ListItem Value="9">9</asp:ListItem>
            <asp:ListItem Value="10">10</asp:ListItem>
            <asp:ListItem Value="11">11</asp:ListItem>
            <asp:ListItem Value="12">12</asp:ListItem>
        </asp:DropDownList>
        &nbsp;
        <asp:DropDownList ID="ddlStartyear" runat="server">
            <asp:ListItem Value="0">YYYY</asp:ListItem>
            <asp:ListItem Value="2019">2019</asp:ListItem>
            <asp:ListItem Value="2020">2020</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lblDateErr" runat="server" ForeColor="Red"></asp:Label>
        <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="ddlStartday" ForeColor="Red" ValueToCompare="0" Operator="NotEqual">* Please Choose a Day </asp:CompareValidator>
        <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="ddlStartmth" ForeColor="Red" ValueToCompare="0" Operator="NotEqual">* Please Choose a Month </asp:CompareValidator>
        <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="ddlStartyear" ForeColor="Red" ValueToCompare="0" Operator="NotEqual">* Please Choose a Year</asp:CompareValidator>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label8" runat="server" Text="End Date : "></asp:Label>
        <asp:DropDownList ID="ddlEndday" runat="server">
            <asp:ListItem Value="0">DD</asp:ListItem>
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
            <asp:ListItem Value="6">6</asp:ListItem>
            <asp:ListItem Value="7">7</asp:ListItem>
            <asp:ListItem Value="8">8</asp:ListItem>
            <asp:ListItem Value="9">9</asp:ListItem>
            <asp:ListItem Value="10">10</asp:ListItem>
            <asp:ListItem Value="11">11</asp:ListItem>
            <asp:ListItem Value="12">12</asp:ListItem>
            <asp:ListItem Value="13">13</asp:ListItem>
            <asp:ListItem Value="14">14</asp:ListItem>
            <asp:ListItem Value="15">15</asp:ListItem>
            <asp:ListItem Value="16">16</asp:ListItem>
            <asp:ListItem Value="17">17</asp:ListItem>
            <asp:ListItem Value="18">18</asp:ListItem>
            <asp:ListItem Value="19">19</asp:ListItem>
            <asp:ListItem Value="20">20</asp:ListItem>
            <asp:ListItem Value="21">21</asp:ListItem>
            <asp:ListItem Value="22">22</asp:ListItem>
            <asp:ListItem Value="23">23</asp:ListItem>
            <asp:ListItem Value="24">24</asp:ListItem>
            <asp:ListItem Value="25">25</asp:ListItem>
            <asp:ListItem Value="26">26</asp:ListItem>
            <asp:ListItem Value="27">27</asp:ListItem>
            <asp:ListItem Value="28">28</asp:ListItem>
            <asp:ListItem Value="29">29</asp:ListItem>
            <asp:ListItem Value="30">30</asp:ListItem>
            <asp:ListItem Value="31">31</asp:ListItem>
        </asp:DropDownList>
        &nbsp;
        <asp:DropDownList ID="ddlEndmth" runat="server">
            <asp:ListItem Value="0">MM</asp:ListItem>
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
            <asp:ListItem Value="6">6</asp:ListItem>
            <asp:ListItem Value="7">7</asp:ListItem>
            <asp:ListItem Value="8">8</asp:ListItem>
            <asp:ListItem Value="9">9</asp:ListItem>
            <asp:ListItem Value="10">10</asp:ListItem>
            <asp:ListItem Value="11">11</asp:ListItem>
            <asp:ListItem Value="12">12</asp:ListItem>
        </asp:DropDownList>
        &nbsp;
        <asp:DropDownList ID="ddlEndyear" runat="server">
            <asp:ListItem Value="0">YYYY</asp:ListItem>
            <asp:ListItem Value="2019">2019</asp:ListItem>
            <asp:ListItem Value="2020">2020</asp:ListItem>
        </asp:DropDownList>

        <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="ddlEndday" ForeColor="Red" ValueToCompare="0" Operator="NotEqual">* Please Choose a Day </asp:CompareValidator>
        <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="ddlEndmth" ForeColor="Red" ValueToCompare="0" Operator="NotEqual">* Please Choose a Month </asp:CompareValidator>
        <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="ddlEndyear" ForeColor="Red" ValueToCompare="0" Operator="NotEqual">* Please Choose a Year</asp:CompareValidator>

    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="LabelTeachInCharge" runat="server" Text="Teacher - In - Charge : "></asp:Label>
        <asp:Label ID="lblTeacher" runat="server"></asp:Label>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label1" runat="server" Text="Plane Ticket Fees : $"></asp:Label>
        <asp:TextBox ID="tbPlanefee" runat="server"></asp:TextBox>
        <asp:Label ID="lblPlaneErr" runat="server" ForeColor="Red"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tbPlanefee" ForeColor="Red">* Please fill in Plane Fee </asp:RequiredFieldValidator>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label2" runat="server" Text="Insurance Fees : $"></asp:Label>
        <asp:TextBox ID="tbInsufee" runat="server"></asp:TextBox>
        <asp:Label ID="lblInsuErr" runat="server" ForeColor="Red"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tbInsufee" ForeColor="Red">* Please fill in Insurance Fee </asp:RequiredFieldValidator>
    </div>
    <br />
    <div class="form-group">
        <asp:Label ID="Label4" runat="server" Text="Accomodation Fees : $"></asp:Label>
        <asp:TextBox ID="tbAccofee" runat="server"></asp:TextBox>
        <asp:Label ID="lblAccoErr" runat="server" ForeColor="Red"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="tbAccofee" ForeColor="Red">* Please fill in Accomodation Fee </asp:RequiredFieldValidator>
    </div>
    <br />
    <asp:Label ID="LabelDetails" runat="server" Text="Details : "></asp:Label>

    <br />
    <asp:TextBox ID="tbDetails" runat="server" CssClass="auto-style1" Height="110px" Width="253px"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" Text="Confirm" OnClick="Button1_Click" />

</asp:Content>

