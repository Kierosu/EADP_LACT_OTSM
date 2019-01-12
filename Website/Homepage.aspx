<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        @import url(https://fonts.googleapis.com/css?family=Anonymous+Pro);
        .auto-style2 {
            width: 123px;
        }
        .auto-style3 {
            height: 24px;
            width: 123px;
        }
        .button {
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
        .comment {
            vertical-align:top;
            display:inline-block;
            background-color:Black;
    	    color:Green;
    	    border-style:double;
        }
        .inlineBlock {
            display:inline-block;
        }
        .blog {
             margin-left:auto;
             margin-right:auto;
             top: 0;
        }
        .buttonmore {   
            position:relative;
            bottom:0;
            right:0;
        }
        .buttoncancelmore {
            position:relative;
            top: 0px;
            right: 0px;
        }
        .modalBackground {
            background-color:black;
            filter:alpha(opacity=90) !important;
            opacity:0.6 !important;
            z-index:20;
        }
        .modalpopup {
            padding:20px 0px 24px 10px;
            position:relative;
            width:450px;
            height:66px;
            background-color:white;
            border:1px solid black;
        }
        .image {
            right: 0px;
            bottom: 0px;
        }
        .TextboxComment {
            resize:none;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <table style="width:100%;">
        <tr>
            <td class="auto-style2"><asp:Button ID="ButtonDetails" runat="server" class="button" Text="Details" Width="120px" OnClick="ButtonDetails_Click" /></td>
            <td rowspan="3">
                <asp:MultiView ID="MultiViewTrip" runat="server" ActiveViewIndex="0">
                    <asp:View ID="ViewDetails" runat="server"><p>Trip information here.</p><span class="fas fa-igloo"></span></asp:View>
                    <asp:View ID="ViewBlog" runat="server">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="Horizontal" CssClass="blog">
                            <%-- BLOGS --%>
                            <Columns>
                                <%--<asp:BoundField DataField="Id" HeaderText ="Id" />
                                <asp:BoundField DataField="Name" HeaderText ="Name" />
                                <asp:BoundField DataField="Size" HeaderText ="Size (bytes)" />
                                <asp:BoundField DataField="Comment" HeaderText ="Blog Comment" />--%>
                                 
                                <asp:TemplateField  ShowHeader="True" HeaderText="Blog" ItemStyle-Width="300px">
                                    <ItemTemplate>
                                   <%# "Uploaded " + Eval("TimeOfUpload") + "<br /> Title: " + Eval("Title") + "<br />" + Eval("Comment")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ControlStyle-CssClass="comment">
                                    <ItemTemplate>
                                        <%--<%# "Time sent: " + DateTime.now.tostring() + "<br />" + Eval("Id") + " : " + Eval("Name") + Eval("Comment")%>--%>
                                         <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
                                                                            ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("Imagedata")) %>' CssClass="image" />
                                    </ItemTemplate>

                                </asp:TemplateField>
                               
                            </Columns>
                            <RowStyle Width="150px"/>
                        </asp:GridView>
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="inlineBlock"/>
                        <br />
                        <asp:TextBox ID="TextBoxBlogTitle" runat="server" AutoCompleteType="Disabled" placeholder="Add blog title here" Width="376px" MaxLength="42"></asp:TextBox>
                        <br />
                        <asp:TextBox ID="TextBoxBlogComment" runat="server" AutoCompleteType="Disabled" TextMode="MultiLine" Rows="10" Height="200px" Width="376px" CssClass="TextboxComment"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                        <br />
                        <br />
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:HyperLink ID="hyperlink" runat="server">View Uploaded Image</asp:HyperLink>
                        <br />
                        <br />
                         
                    </asp:View>
                    <asp:View ID="ViewStats" runat="server">
                        <%-- CHARTS --%>
                        <asp:Panel ID="Panel1" runat="server">
                              <div>
                            <asp:Chart ID="Chart1" runat="server" Width="316px" CssClass="inlineBlock" Palette="Pastel">
                                <series>
                                    <asp:Series Name="Series1">
                                    </asp:Series>
                                </series>
                                <chartareas>
                                    <asp:ChartArea Name="ChartArea1">
                                    </asp:ChartArea>
                                </chartareas>
                            </asp:Chart>
                            <asp:Chart ID="Chart2" runat="server" Palette="SemiTransparent" Width="400px">
                                <Series>
                                    <asp:Series ChartType="Pie" Name="Series2">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea2">
                                    </asp:ChartArea>
                                </ChartAreas>
                                <Legends>
                                    <asp:Legend Name="Legend1">
                                    </asp:Legend>
                                </Legends>
                            </asp:Chart>
                                  <%-- COMMENTS --%>
                                  <h4 style="text-decoration:underline;">Comments:</h4>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="commentbox">
                        <b>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("tdRating") %>'>'></asp:Label> stars {</b>&nbsp;<asp:Label ID="Label2" runat="server" Text='<%#Eval("tdReview") %>'>'></asp:Label> }<br />
                        Order : <asp:Label ID="Label3" runat="server" Text='<%#Eval("tdAspect") %>'></asp:Label><br />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div style="overflow: hidden;">
                <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnPage"
                            Style="padding: 8px; margin: 2px; background: #007acc; border: solid 1px blue; font: 8px;"
                            CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                            runat="server" ForeColor="White" Font-Bold="True" CausesValidation="false"><%# Container.DataItem %>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>           
        <%--extra information part --%> 
        <asp:Button ID="ButtonMore" runat="server" Text="Read More" CssClass="buttonmore" OnClick="ButtonMore_Click" />
        <asp:Panel ID="PanelMore" runat="server" CssClass="modalpopup">
            Extra information here.
            <br />
            <asp:Repeater ID="Repeater2" runat="server"> 
                <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%#Eval("tdSuggestion") %>'></asp:Label>
                <br />
                </ItemTemplate>
            </asp:Repeater>
            <asp:Button ID="ButtonCancelMore" runat="server" Text="x" CssClass="buttoncancelmore" BorderColor="White" BorderStyle="None" ForeColor="#990000" />
        </asp:Panel>
        <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="ButtonMore" BackgroundCssClass="modalBackground" PopupControlID="PanelMore" CancelControlID="ButtonCancelMore"></asp:ModalPopupExtender>
                        </asp:Panel>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
            <asp:Button ID="ButtonBlog" runat="server" class="button" Text="Blogs" Width="120px" OnClick="ButtonBlog_Click" />
            </td>
        </tr>
        <tr>
		    <td class="auto-style2">
            <asp:Button ID="ButtonStats" runat="server" class="button" Text="Statistics" Width="120px" OnClick="ButtonStats_Click" />
            </td> 
        </tr>
        </table>
</asp:Content>
