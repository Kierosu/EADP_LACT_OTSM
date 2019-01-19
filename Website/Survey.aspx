<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Survey.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Survey</title>
    <style type="text/css" media="Screen">/*\*/@import url("css/layout-1-master.css");/**/</style>
    <link rel="stylesheet" type="text/css" href="http://skfox.com/jqExamples/jq14_jqui172_find_bug/jq132/css/ui-lightness/jquery-ui-1.7.2.custom.css"/>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("ul.droptrue").sortable({
                connectWith: 'ul',
                opacity: 0.6,
                update: updatePostOrder
            });

            $("#sortable1, #sortable2").disableSelection();
            $("#sortable1, #sortable2").css('minHeight', $("#sortable1").height() + "px");
            updatePostOrder();
        });

        function updatePostOrder() {
            var arr = [];
            $("#sortable2 li").each(function () {
                arr.push($(this).attr('id'));
            });
            $('#postOrder').val(arr.join(','));
        }
    </script>
    <style type="text/css">
    .TextboxComment {
            resize:none;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .txtbox
        {
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
        }
        .auto-style1 {
            width: 414px;
        }
        .auto-style2 {
            width: 11px;
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
        .listbox {    
            border-top-style: none;
	        border-right-style: none;
	        border-left-style: none;
	        border-bottom-style: none; 
            overflow:hidden;
         }
        .clearbtn {
             background-color: #4CAF50;   
             border: none;  
             color: white; 
             font-size: 14px;  
             margin: 4px 2px;  
             cursor: pointer; 
         }
        .listBlock {
            float: left;
        }
        #sortable1, #sortable2 { 
            list-style-type: none; 
            margin: 0; 
            padding: 0; 
            margin-right: 100px; 
            background: #eee; 
            padding: 5px; 
            width: 300px; 
            border: 1px solid black;

        }
        #sortable1 li, #sortable2 li {
            cursor: move;
            margin: 5px;
            padding: 5px;
            font-size: 1.2em;
            width: 250px;
            background: none;
            background-color: white;
        }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <h3 class="title"style="background-color: black; color: #FFFFFF;">NYP Trip Survey</h3>
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style2">Admin Number :
                </td>
                <td>
                    &nbsp;<asp:Label ID="LabelAdminNumber" runat="server"></asp:Label>
                </td>
         
            </tr>
            <tr>
                <td class="auto-style2">Name :  
                </td>
                <td class="auto-style5">
                    &nbsp;<asp:Label ID="LabelName" runat="server"></asp:Label></td>

            </tr>
            <tr>
                <td class="auto-style2" colspan="1">Trip ID :&nbsp; 
                    </td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBoxTripID" runat="server" cssclass="txtbox"></asp:TextBox>
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
                    <asp:TextBox runat="server" ID="textBoxComment" TextMode="MultiLine" Rows="10" Height="200px" Width="376px" CssClass="TextboxComment"/></td>
            
            </tr>
            <tr>
                <td class="auto-style2" colspan="1">Favourite aspects of the trip: <asp:Button ID="btnInfo" runat="server" OnClientClick="return false;" Text="[?]" BorderStyle="None" ForeColor="#000066"/>
                    <!-- "Wire frame" div used to transition from the button to the info panel -->
        <div id="flyout" style="display: none; overflow: hidden; z-index: 2; background-color: #FFFFFF; border: solid 1px #D0D0D0;"></div>
        

        <!-- Info panel to be displayed as a flyout when the button is clicked -->
        <div id="info" style="display: none; width: 250px; z-index: 2; opacity: 0; filter: progid:DXImageTransform.Microsoft.Alpha(opacity=0); font-size: 12px; border: solid 1px #CCCCCC; background-color: #FFFFFF; padding: 5px;">
            <div id="btnCloseParent" style="float: right; opacity: 0; filter: progid:DXImageTransform.Microsoft.Alpha(opacity=0);">
                <asp:LinkButton id="btnClose" runat="server" OnClientClick="return false;" Text="X" ToolTip="Close"
                    Style="background-color: #666666; color: #FFFFFF; text-align: center; font-weight: bold; text-decoration: none; border: outset thin #FFFFFF; padding: 5px;" />
            </div>
            <div>
                <p>
                    Using the 6 helping words in the following box, please order the aspects as in the 1st being your LEAST FAVOURITE aspect and 6th being your MOST FAVOURITE aspect.
                </p>
                <br />
                <p>
                    Please choose wisely as your answers will be reflected in the trip details.
                </p>
            </div>
        </div></td>
                <td class="auto-style1">
                    <div class="listBlock"> 
    <ul id="sortable1" class="droptrue ui-sortable"  style="-moz-user-select: none; min-height: 126px;">
        <li class="ui-state-default" id="Learning" style="opacity: 1;" >Learning</li>
        <li class="ui-state-default" id="Sightseeing" style="opacity: 1;" >Sightseeing</li>
        <li class="ui-state-default" id="Shopping" style="opacity: 1;" >Shopping</li>	
        <li class="ui-state-default" id="Culture" style="opacity: 1;" >Culture</li>	
        <li class="ui-state-default" id="Meals" style="opacity: 1;" >Meals</li>	
        <li class="ui-state-default" id="Hotel" style="opacity: 1;">Hotel</li>	
						</ul>
        </div>
                   <asp:TextBox ID="postOrder" runat="server"></asp:TextBox>
             
        <div class="listBlock">
        <ul id="sortable2" class="droptrue ui-sortable"  style="-moz-user-select: none; min-height: 126px;">
						  
						 </ul>
            <asp:ListBox ID="ListBox1" runat="server" Visible="False"></asp:ListBox>
        </div>
                   
                     
                   </td>
            
            </tr>
            
            <tr>
                <td class="auto-style2" colspan="1">Suggestions to improve trip?</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBoxSuggestions" runat="server" TextMode="MultiLine" Rows="10" Height="200px" Width="376px" CssClass="TextboxComment"></asp:TextBox>
                   </td>
            
            </tr>
            <tr>
                <td class="auto-style2" colspan="1"></td>
                <td class="auto-style1">
                    <asp:Button ID="ButtonClear" runat="server" Text="Clear All" CssClass="clearbtn" OnClick="ButtonClear_Click" />
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
         
        <script type="text/javascript">
            // Move an element directly on top of another element (and optionally
            // make it the same size)
            function Cover(bottom, top, ignoreSize) {
                var location = Sys.UI.DomElement.getLocation(bottom);
                top.style.position = 'absolute';
                top.style.top = location.y + 'px';
                top.style.left = location.x + 'px';
                if (!ignoreSize) {
                    top.style.height = bottom.offsetHeight + 'px';
                    top.style.width = bottom.offsetWidth + 'px';
                }
            }
        </script>
        

        <asp:animationextender id="OpenAnimation" runat="server" TargetControlID="btnInfo">
            <Animations>
                <OnClick>
                    <Sequence>
                        <%-- Disable the button so it can't be clicked again --%>
                        <EnableAction Enabled="false" />
                        

                        <%-- Position the wire frame on top of the button and show it --%>
                        <ScriptAction Script="Cover($get('ctl00_SampleContent_btnInfo'), $get('flyout'));" />
                        <StyleAction AnimationTarget="flyout" Attribute="display" Value="block"/>
                        

                        <%-- Move the wire frame from the button's bounds to the info panel's bounds --%>
                        <Parallel AnimationTarget="flyout" Duration=".3" Fps="25">
                            <Move Horizontal="150" Vertical="-50" />
                            <Resize Width="260" Height="280" />
                            <Color PropertyKey="backgroundColor" StartValue="#AAAAAA" EndValue="#FFFFFF" />
                        </Parallel>
                        

                        <%-- Move the info panel on top of the wire frame, fade it in, and hide the frame --%>
                        <ScriptAction Script="Cover($get('flyout'), $get('info'), true);" />
                        <StyleAction AnimationTarget="info" Attribute="display" Value="block"/>
                        <FadeIn AnimationTarget="info" Duration=".2"/>
                        <StyleAction AnimationTarget="flyout" Attribute="display" Value="none"/>
                        

                        <%-- Flash the text/border red and fade in the "close" button --%>
                        <Parallel AnimationTarget="info" Duration=".5">
                            <Color PropertyKey="color" StartValue="#666666" EndValue="#FF0000" />
                            <Color PropertyKey="borderColor" StartValue="#666666" EndValue="#FF0000" />
                        </Parallel>
                        <Parallel AnimationTarget="info" Duration=".5">
                            <Color PropertyKey="color" StartValue="#FF0000" EndValue="#666666" />
                            <Color PropertyKey="borderColor" StartValue="#FF0000" EndValue="#666666" />
                            <FadeIn AnimationTarget="btnCloseParent" MaximumOpacity=".9" />
                        </Parallel>
                    </Sequence>
                </OnClick>
            </Animations>
        </asp:animationextender>
        <asp:animationextender id="CloseAnimation" runat="server" TargetControlID="btnClose">
            <Animations>
                <OnClick>
                    <Sequence AnimationTarget="info">
                        <%--  Shrink the info panel out of view --%>
                        <StyleAction Attribute="overflow" Value="hidden"/>
                        <Parallel Duration=".3" Fps="15">
                            <Scale ScaleFactor="0.05" Center="true" ScaleFont="true" FontUnit="px" />
                            <FadeOut />
                        </Parallel>
                        

                        <%--  Reset the sample so it can be played again --%>
                        <StyleAction Attribute="display" Value="none"/>
                        <StyleAction Attribute="width" Value="250px"/>
                        <StyleAction Attribute="height" Value=""/>
                        <StyleAction Attribute="fontSize" Value="12px"/>
                        <OpacityAction AnimationTarget="btnCloseParent" Opacity="0" />
                        

                        <%--  Enable the button so it can be played again --%>
                        <EnableAction AnimationTarget="btnInfo" Enabled="true" />
                    </Sequence>
                </OnClick>
                <OnMouseOver>
                    <Color Duration=".2" PropertyKey="color" StartValue="#FFFFFF" EndValue="#FF0000" />
                </OnMouseOver>
                <OnMouseOut>
                    <Color Duration=".2" PropertyKey="color" StartValue="#FF0000" EndValue="#FFFFFF" />
                </OnMouseOut>
             </Animations>
        </asp:animationextender>
 
    </form>
</body>
</html>
