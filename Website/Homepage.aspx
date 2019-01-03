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
         
}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
    <table style="width:100%;">
        
        <tr>
             
            <td class="auto-style2"><asp:Button ID="ButtonDetails" runat="server" class="button" Text="Details" Width="120px" OnClick="ButtonDetails_Click" /></td>
            <td  rowspan="3">
                <asp:MultiView ID="MultiViewTrip" runat="server" ActiveViewIndex="0">
                    <asp:View ID="ViewDetails" runat="server"><p>hii</p><span class="fas fa-igloo"></span></asp:View>
                    <asp:View ID="ViewBlog" runat="server"></asp:View>
                    <asp:View ID="ViewStats" runat="server">
                        
                        
                        <asp:Panel ID="Panel1" runat="server">
                              <div >
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
                                
                                  <asp:Label ID="LabelComments" runat="server" CssClass="comment" Visible="False"></asp:Label>
                                  <asp:Label ID="LabelAspects" runat="server" CssClass="comment" Visible="False"></asp:Label>
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
                                 
                        </asp:Panel>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Button ID="ButtonBlog" runat="server" class="button" Text="Blogs" Width="120px" OnClick="ButtonBlog_Click" /></td>
        </tr>
        <tr>
		              	<td class="auto-style2"><asp:Button ID="ButtonStats" runat="server" class="button" Text="Statistics" Width="120px" OnClick="ButtonStats_Click" />

		              	</td>
             
        </tr>
         
        </table>
</asp:Content>
