<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.master" AutoEventWireup="true" CodeFile="Survey.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .Textbox {
            resize:none;
        }
        .auto-style1 {
            width: 414px;
        }
        .auto-style2 {
            width: 158px;
        }
        .Star {
            background-image: url(images/Star.gif);
            height: 17px;
            width: 17px;
        }

        .WaitingStar {
            background-image: url(images/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }

        .FilledStar {
            background-image: url(images/FilledStar.gif);
            height: 17px;
            width: 17px;
        }
        .auto-style3 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            position: relative;
            top: -32px;
            right: 269px;
            outline: none;
            cursor: pointer;
            color: black;
            padding: 0px 10px;
            border-radius: 2px;
            font-size: 22px;
            float: right;
            width: 89px;
        }
    </style>
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3 class="title"style="background-color: black; color: #FFFFFF;">NYP Trip Survey</h3>
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style2">Admin Number :
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Admin number is required" Text="*" Font-Underline="False" ForeColor="Red"
                        >*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
         
            </tr>
            <tr>
                <td class="auto-style2">Name : 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Name is required" ControlToValidate="TextBox2" Font-Underline="False" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td class="auto-style2" colspan="1">Trip ID :&nbsp; 
                    </td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBoxTripID" runat="server"></asp:TextBox>
                </td>
            
            </tr>
            <tr>
                <td class="auto-style2" colspan="1">Rate the Trip:
                </td>
                <td class="auto-style1">
                    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
                    <asp:Rating ID="Rating1" runat="server" AutoPostBack="true"
            StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
            FilledStarCssClass="FilledStar">
        </asp:Rating>
                    &nbsp;</td>
            
            </tr>
            <tr>
                <td class="auto-style2" colspan="1">Write a short review:</td>
                <td class="auto-style1">
                    <asp:TextBox runat="server" ID="textBoxComment" TextMode="MultiLine" Rows="10" Height="200px" Width="376px" CssClass="Textbox"/></td>
            
            </tr>
            <tr>
                <td class="auto-style2" colspan="1">Mobile Contact : 
                    </td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                   </td>
            
            </tr>
            
            <tr>
                <td class="auto-style2" colspan="1"></td>
                <td class="auto-style1">
                    <asp:Button ID="ButtonClear" runat="server" Text="Clear" OnClick="ButtonClear_Click" />
                    <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" CssClass="auto-style3" OnClick="ButtonSubmit_Click" />
                   </td>
            
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style1">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Please resolve data entry error" />
                </td>
            </tr>
        </table>
    
    </div>
    <p>
&nbsp;&nbsp;&nbsp;
    </p>
        <asp:Panel ID="panelChoice" runat="server" Visible="False">
            Thank you doing the survey:<br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
        </asp:Panel>

</asp:Content>

