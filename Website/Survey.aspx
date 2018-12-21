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
        .listbox{    
            border-top-style: none;
	        border-right-style: none;
	        border-left-style: none;
	        border-bottom-style: none; 
            overflow:hidden;
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
                <td class="auto-style2" colspan="1">Favourite aspect of the trip: <asp:Button ID="btnInfo" runat="server" OnClientClick="return false;" Text="[?]" BorderStyle="None" ForeColor="#000066"/>
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
                    Using the 6 helping words in the following box, order the aspects as in 1st position being the best aspect and 6th being the worst.
                </p>
                <br />
                <p>
                    Please choose wisely as your answers will be reflected in the trip details.
                </p>
            </div>
        </div></td>
                <td class="auto-style1">
                    <a>Please rate the aspect as in 1 being your most favourite and 5 being the least favourite.</a><asp:Panel ID="Panel1" runat="server">
                         
                        <asp:ListBox CssClass="listbox" ID="ListBox1" runat="server" Rows="6" ToolTip="List of aspects " Font-Italic="True">
                        <asp:ListItem Value="1">Learning</asp:ListItem>
                        <asp:ListItem Value="2">Sightseeing</asp:ListItem>
                        <asp:ListItem Value="3">Shopping</asp:ListItem>
                        <asp:ListItem Value="4">Culture</asp:ListItem>
                        <asp:ListItem Value="5">Meals</asp:ListItem>
                        <asp:ListItem Value="6">Hotel</asp:ListItem>
                    </asp:ListBox> 

                    <asp:Button ID="ButtonRemove" runat="server" OnClick="ButtonRemove_Click"  Text="&lt;" CausesValidation="False" ToolTip="Click to remove an aspect from your list" />
                    <asp:Button ID="ButtonEnter" runat="server" OnClick="ButtonEnter_Click"  Text="&gt;" CausesValidation="False" ToolTip="Click to add an aspect to your list" /> 

                    <asp:ListBox CssClass="listbox" ID="ListBox2" runat="server" BackColor="White" Rows="6" ToolTip="Your order of aspects"></asp:ListBox>
                    </asp:Panel>
                     
                   </td>
            
            </tr>
            
            <tr>
                <td class="auto-style2" colspan="1">Suggestions to improve trip?</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
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
 

</asp:Content>
