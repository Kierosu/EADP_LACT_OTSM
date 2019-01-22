<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManualNotifications.aspx.cs" Inherits="ManualNotifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        @media (max-width: 980px) {
            #divContain {
                margin-top: 13%;
            }
        }

        @media (max-width: 650px) {
            #divContain {
                margin-top: 22%;
            }
        }

        @media(min-width:0px) {
            #taMessage {
                height: 175px;
            }
        }
    </style>

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%= tbReceiver.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "ManualNotifications.aspx/FindUser",
                        data: "{'name':'" + $("#<%= tbReceiver.ClientID %>").val() + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        failure: function () {
                            response("No such user");
                        },
                        error: function (result) {
                            response("Error getting request");
                        }
                    });
                },
                minLength: 0
            });
        });

        function btnClear_click() {
            $("#<%= tbReceiver.ClientID %>").val('');
            $("#<%= tbSubject.ClientID %>").val('');
            $("#<%= taMessage.ClientID %>").val('');
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin-bottom: 1%" class="container" id="divContain">
        <div class="row">
            <h3 class="col-lg-10">Send Notification</h3>
        </div>
        <div class="form-group row">
            <asp:Label ID="lblErr" runat="server" Text="" CssClass="col-lg-10 col-form-label" Visible="False" ForeColor="Red"></asp:Label>
        </div>
        <div class="form-group row">
            <asp:Label ID="Label1" runat="server" Text="Send To:" CssClass="col-lg-1 col-form-label"></asp:Label>
            <asp:TextBox ID="tbReceiver" runat="server" Width="326px" CssClass="form-control col-lg-7"></asp:TextBox>
        </div>
        <div class="form-group row">
            <asp:Label ID="Label2" runat="server" Text="Filter Students:" CssClass="col-lg-1 col-form-label"></asp:Label>
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
            <textarea id="taMessage" placeholder="Enter your message here" style="font-family: 'Roboto Slab', sans-serif; height: 250px" class="col-lg-7 form-control" runat="server"></textarea>
        </div>
        <div class="form-group row">
            <div class="col-lg-1"></div>
            <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn btn-outline-primary btn-rounded waves-effect col-lg-2" UseSubmitBehavior="False" OnClick="btnSend_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-outline-danger btn-rounded waves-effect col-lg-2" UseSubmitBehavior="False" OnClientClick="btnClear_click(); return false" />
        </div>
    </div>
    <asp:HiddenField ID="hfCustomerId" runat="server" />

</asp:Content>

