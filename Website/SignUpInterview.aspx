<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="stylesheet/signUpInterview.css" rel="stylesheet" /> 
    <style type="text/css">
        .auto-style1 {
            height: 550px;
            width: 1200px;
        }
        .auto-style2 {
            margin-left: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
        <div class="auto-style1" style="margin:auto;">
            <h1 class="auto-style2"> Choose Interview Dates </h1>
            <form action="#" style="margin-left: 40px">
                &nbsp;&nbsp;&nbsp; Interview Date:
                <asp:Label ID="Label1" runat="server" ForeColor="#999999" Text="4th November 2019"></asp:Label>
                 &nbsp;&nbsp;&nbsp;
                <br />
                &nbsp;&nbsp;&nbsp;Passport Number: 
              <asp:TextBox ID="tbPassportNumber" CssClass="signUpInterviewTb" runat="server"></asp:TextBox>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Allergy (if any): <asp:TextBox ID="tbLocation" CssClass="signUpInterviewTb" runat="server"></asp:TextBox>
             <br />
            &nbsp;&nbsp;&nbsp;    
            Contact Number:
            <asp:TextBox ID="TextBox1" CssClass="signUpInterviewTb" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Medication (if any): <asp:TextBox ID="tbMedication" CssClass="signUpInterviewTb" runat="server"></asp:TextBox>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                GPA: <asp:TextBox ID="tbGPA" CssClass="signUpInterviewTb" runat="server"></asp:TextBox>
                Dietary Restrictions (If any): <asp:TextBox ID="tbDietary" CssClass="signUpInterviewTb" runat="server"></asp:TextBox>
                <br />
                &nbsp;&nbsp;&nbsp;
                First Time Applying: 
&nbsp;<asp:RadioButtonList ID="rbtListFirstTime" runat="server" Width="61px">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                &nbsp;&nbsp;&nbsp;
                Singaporean / PR: <asp:RadioButtonList ID="rbtSGorPR" runat="server">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
&nbsp;<asp:Button ID="Button1" CssClass="btPost" runat="server" Text="Post" />
            
                

            </form>
 
   
        </div>
        </div>
    </div>
</asp:Content>

