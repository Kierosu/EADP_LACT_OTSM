<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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

    <div class="container" id="divContain">
        <div class="row">

            <div class ="col-lg-3">
            </div>

            <div class = "col-lg-6">

              <ul class="nav nav-tabs" id="myTab" role="tablist" style="font-size:15px">
                  <li class="nav-item">
                    <asp:Button CssClass="nav-link active" id="studentTab" data-toggle="tab" role="tab" aria-controls="student" aria-selected="true" runat="server" Text="Student" CausesValidation="false" OnClick="studentTab_Click" UseSubmitBehavior="False"></asp:Button>
                  </li>
                  <li class="nav-item">
                    <asp:Button CssClass="nav-link" id="staffTab" data-toggle="tab" role="tab" aria-controls="staff" aria-selected="false" runat="server" Text="Staff" CausesValidation="false" OnClick="staffTab_Click" UseSubmitBehavior="False"></asp:Button>
                  </li>
                  <li class="nav-item">
                    <asp:Button CssClass="nav-link" id="adminTab" data-toggle="tab" role="tab" aria-controls="admin" aria-selected="false" runat="server" Text="Admin" CausesValidation="false" OnClick="adminTab_Click" UseSubmitBehavior="False"></asp:Button>
                  </li>
            </ul>
            </div>
            <div class ="col-lg-3">
            </div>
        </div>
        <div class="row" style="margin-top:1.35%">
            
            <div class ="col-lg-3">
            </div>

            <div class ="col-lg-6" style=" height: 100%;">
                <div class="row" style="margin-top:2.5%">
                    <asp:Label ID="Label3" runat="server" Text="OTMS Login" Font-Size="30px" CssClass="col-lg-12"></asp:Label>    
                </div>
                 <div class = "row">
                     <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="tabStudent" role="tabpanel" aria-labelledby="studentTab">
                            <asp:Label ID="lblMsg" runat="server" Text="Use your admin number as username and your myNYP Portal password" CssClass="col-lg-12" ForeColor="#1B66A4"></asp:Label>
                        </div>
                      </div>
                 </div>
                <div class="row">
                    <asp:Label ID="lblErr" runat="server" CssClass ="col-lg-5" ForeColor="Red"></asp:Label>
                </div>

                <div class="row" style="margin-top:1.5%; margin-bottom:1.5%;">
                    <asp:ValidationSummary ID="validateSummary" runat="server" ForeColor="Red" />
                </div>

                <div class = "row">
                    <asp:Label ID="Label1" runat="server" Text="Username: " CssClass="control-label col-lg-2" style="margin-top:1.5%"></asp:Label>
                    <asp:TextBox ID="tbUsername" runat="server" CssClass="col-lg-8 form-control mb-4"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="validateUsername" runat="server" ErrorMessage="Username required" ControlToValidate="tbUsername" ForeColor="Red" Font-Size="30px">*</asp:RequiredFieldValidator>
                </div>

                <div class = "row" >       
                    <asp:Label ID="Label2" runat="server" Text="Password: " CssClass="control-label col-lg-2" style="margin-top:1.5%"></asp:Label>
                    <asp:TextBox ID="tbPass" runat="server" TextMode="Password" CssClass="col-lg-8 form-control mb-4" style=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="validatePass" runat="server" ErrorMessage="Password required" ControlToValidate="tbPass" ForeColor="Red" Font-Size="30px">*</asp:RequiredFieldValidator>    
                </div>

                <div class="row" style="margin-bottom:3%; margin-top:-2.5%;">
                    <div class="col-lg-2">
                    </div>
                    <asp:CheckBox ID="chkbxRemember" runat="server" Text="Remember me" CssClass="col-lg-3"/>  
                    
                </div>
                <div class="row">
                    <div class="col-lg-3">
                    </div>
                    <asp:Button ID="btnLogin" runat="server" CssClass="btn aqua-gradient btn-rounded col-lg-6" Text="Login" Font-Size="15px" OnClick="btnLogin_Click" style="margin-bottom:17%;margin-top:2%;"/>
                    <div class="col-lg-3">
                    </div>
                </div>                                
            </div>
            <div class ="col-lg-3">
            </div>
        </div>
    </div>
    <!--
    <script>
        $(window).bind('beforeunload', function () {
            $("#<%= lblErr.ClientID %>").css("display", "none");
        })
        $(document).ready(function() {
            $("#<%= btnLogin.ClientID %>").click(function (e) {
                e.preventDefault();
            })
        })
    </script>
        -->
</asp:Content>

