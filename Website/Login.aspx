<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="stylesheet/login.css" rel="stylesheet" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 541px">
        <div class="navbarTab" style="position:absolute; top: 114px; left: 429px; width: 650px; border:1px solid black; height: 43px;">
          <asp:Button ID="btnStudent" runat="server" Text="Student" CssClass="tablinks active" OnClick="btnStudent_Click" CausesValidation="False"/>
          <asp:Button ID="btnStaff" runat="server" Text="Staff" CssClass="tablinks" OnClick="btnStaff_Click" CausesValidation="False"/>
          <asp:Button ID="btnAdmin" runat="server" Text="Admin" CssClass="tablinks" OnClick="btnAdmin_Click" CausesValidation="False"/>
        </div>
        
        <div style="border:1px solid black; width:650px; height: 415px; position:absolute; top:159px; left:429px;">

            <asp:Label ID="Label3" runat="server" Text="OTMS Login" style="position:absolute; top: 20px; left: 53px; height: 32px; width: 239px;" Font-Size="30px"></asp:Label>
            
            <asp:Label ID="lblMessage" runat="server" Text="Use your admin number as username and your myNYP Portal password" style="position:absolute; top: 83px; left: 100px; width: 378px;" ForeColor="#1B66A4"></asp:Label>

            <asp:Label ID="Label1" runat="server" Text="Username: " style="position:absolute; top:157px; left:115px;"></asp:Label>

            <asp:Label ID="Label2" runat="server" Text="Password: " style="position:absolute; top:200px; left:115px;"></asp:Label>

            <asp:TextBox ID="tbPass" runat="server" style="position:absolute; top: 196px; left: 210px; width: 235px; height: 23px;" TextMode="Password"></asp:TextBox>

            <asp:TextBox ID="tbUsername" runat="server" style="position:absolute; top: 154px; left: 210px; width: 235px; height: 23px;"></asp:TextBox>

            <asp:Button ID="btnLogin" runat="server" CssClass="btnLogin" Text="Login" Font-Size="20px"/>

            <asp:CheckBox ID="chkbxRemember" runat="server" Text="Remember me" style="position:absolute; top: 234px; left: 210px;" />
                        
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username required" style="position:absolute; top: 158px; left: 459px;" ControlToValidate="tbUsername" ForeColor="Red">*</asp:RequiredFieldValidator>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password required" style="position:absolute; top: 202px; left: 460px;" ControlToValidate="tbPass" ForeColor="Red">*</asp:RequiredFieldValidator>

        </div>
    </div>
</asp:Content>

