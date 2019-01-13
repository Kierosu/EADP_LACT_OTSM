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
        .toprightcorner{
            top: 0px;
            right: 0px;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
      
    <table style="width:100%; right: 0px;">
             
        <tr>
            <td>
            <asp:GridView ID="GridViewTrips" runat="server" CellPadding="3" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="TripName" HeaderText="TripName" SortExpression="TripName" />
                <asp:BoundField DataField="TripType" HeaderText="TripType" SortExpression="TripType" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\LACT.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Id], [TripName], [TripType] FROM [TripInformation]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\LACT.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [TripInformation] WHERE ([Id] = @Id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridViewTrips" Name="Id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            </asp:SqlDataSource>

            </td>
            <td class="auto-style2">
                <asp:Button ID="ButtonDetails" runat="server" class="button" Text="Details" Width="120px" OnClick="ButtonDetails_Click" />
                <asp:Button ID="Button1" runat="server" class="button" Text="Blogs" Width="120px" OnClick="ButtonBlog_Click" />
                <asp:Button ID="ButtonStats" runat="server" class="button" Text="Statistics" Width="120px" OnClick="ButtonStats_Click" />
            </td>
            
            <td rowspan="3">
                <asp:MultiView ID="MultiViewTrip" runat="server" ActiveViewIndex="0">
                    <asp:View ID="ViewDetails" runat="server"><p>Trip information here.</p>
                        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource2">
                            <Fields>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                <asp:BoundField DataField="TripName" HeaderText="TripName" SortExpression="TripName" />
                                <asp:BoundField DataField="TripType" HeaderText="TripType" SortExpression="TripType" />
                                <asp:BoundField DataField="TripCountry" HeaderText="TripCountry" SortExpression="TripCountry" />
                                <asp:BoundField DataField="TripLocation" HeaderText="TripLocation" SortExpression="TripLocation" />
                                <asp:BoundField DataField="DiplmaDIT" HeaderText="DiplmaDIT" SortExpression="DiplmaDIT" />
                                <asp:BoundField DataField="DiplmaDBI" HeaderText="DiplmaDBI" SortExpression="DiplmaDBI" />
                                <asp:BoundField DataField="DiplmaDCS" HeaderText="DiplmaDCS" SortExpression="DiplmaDCS" />
                                <asp:BoundField DataField="DiplmaDSF" HeaderText="DiplmaDSF" SortExpression="DiplmaDSF" />
                                <asp:BoundField DataField="DiplmaDFI" HeaderText="DiplmaDFI" SortExpression="DiplmaDFI" />
                                <asp:BoundField DataField="DiplmaDBA" HeaderText="DiplmaDBA" SortExpression="DiplmaDBA" />
                                <asp:BoundField DataField="YearOne" HeaderText="YearOne" SortExpression="YearOne" />
                                <asp:BoundField DataField="YearTwo" HeaderText="YearTwo" SortExpression="YearTwo" />
                                <asp:BoundField DataField="YearThree" HeaderText="YearThree" SortExpression="YearThree" />
                                <asp:BoundField DataField="TripMinGPA" HeaderText="TripMinGPA" SortExpression="TripMinGPA" />
                                <asp:BoundField DataField="TripSlots" HeaderText="TripSlots" SortExpression="TripSlots" />
                                <asp:BoundField DataField="TripStartDate" HeaderText="TripStartDate" SortExpression="TripStartDate" />
                                <asp:BoundField DataField="TripEndDate" HeaderText="TripEndDate" SortExpression="TripEndDate" />
                                <asp:BoundField DataField="TripTeacherInCharge" HeaderText="TripTeacherInCharge" SortExpression="TripTeacherInCharge" />
                                <asp:BoundField DataField="TripPlaneFee" HeaderText="TripPlaneFee" SortExpression="TripPlaneFee" />
                                <asp:BoundField DataField="TripInsuFee" HeaderText="TripInsuFee" SortExpression="TripInsuFee" />
                                <asp:BoundField DataField="TripAccoFee" HeaderText="TripAccoFee" SortExpression="TripAccoFee" />
                                <asp:BoundField DataField="TripDetails" HeaderText="TripDetails" SortExpression="TripDetails" />
                            </Fields>
                        </asp:DetailsView>

                    </asp:View>
                    <asp:View ID="ViewBlog" runat="server">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="Horizontal" CssClass="blog" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting">
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
                                <asp:CommandField ShowDeleteButton="True" ButtonType="Button" DeleteText="X" />
                               
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
            Extra information here. <asp:Label ID="Label5" runat="server" CssClass="toprightcorner"></asp:Label><asp:Button ID="ButtonCancelMore" runat="server" Text="x" CssClass="buttoncancelmore" BorderColor="White" BorderStyle="None" ForeColor="#990000" />
            <br />
            <asp:Repeater ID="Repeater2" runat="server"> 
                <ItemTemplate>
                    <div class="commentbox">
                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("tdSuggestion") %>'></asp:Label>
                    <br />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
             
        </asp:Panel>
        <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="ButtonMore" BackgroundCssClass="modalBackground" PopupControlID="PanelMore" CancelControlID="ButtonCancelMore"></asp:ModalPopupExtender>
                        </asp:Panel>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>

        </table>
</asp:Content>
