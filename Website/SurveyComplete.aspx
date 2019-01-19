<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .wrapper-1{
  width:100%;
  height:100vh;
  display: flex;
flex-direction: column;
}
.wrapper-2{
  padding :30px;
  text-align:center;
}
h1{
    font-family: 'Kaushan Script', cursive;
  font-size:4em;
  letter-spacing:3px;
  color:#5892FF ;
  margin:0;
  margin-bottom:20px;
}
.wrapper-2 p{
  margin:0;
  font-size:1.3em;
  color:#aaa;
  font-family: 'Source Sans Pro', sans-serif;
  letter-spacing:1px;
}
.go-home{
  color:#fff;
  background:#5892FF;
  border:none;
  padding:10px 50px;
  margin:30px 0;
  border-radius:30px;
  text-transform:capitalize;
  box-shadow: 0 10px 16px 1px rgba(174, 199, 251, 1);
}
.footer-like{
  margin-top: auto; 
  background:#D7E6FE;
  padding:6px;
  text-align:center;
}
.footer-like p{
  margin:0;
  padding:4px;
  color:#5892FF;
  font-family: 'Source Sans Pro', sans-serif;
  letter-spacing:1px;
}
.footer-like p a{
  text-decoration:none;
  color:#5892FF;
  font-weight:600;
}

@media (min-width:360px){
  h1{
    font-size:4.5em;
  }
  .go-home{
    margin-bottom:20px;
  }
}

@media (min-width:600px){
  .content{
  max-width:1000px;
  margin:0 auto;
}
  .wrapper-1{
  height: initial;
  max-width:620px;
  margin:0 auto;
  margin-top:50px;
  box-shadow: 4px 8px 40px 8px rgba(88, 146, 255, 0.2);
}
  
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
  <div class="content">
  <div class="wrapper-1">
    <div class="wrapper-2">
      <h1>Thank you !</h1>
      <p>Thanks for doing the trip survey.  </p>
      <p>Click here to return to homepage.  </p>
        <asp:Button ID="ButtonHome" runat="server" Text="Go Home" CssClass="go-home" OnClick="ButtonHome_Click" />
    </div>
    <div class="footer-like">
      <p>Please rate our survey
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:CheckBox ID="CheckBox1" Checked="true" Text="I like the survey." runat="server"/><br />
                <asp:ToggleButtonExtender ID="ToggleButtonExtender1" runat="server"
                    TargetControlID="CheckBox1"
                    ImageWidth="19"
                    ImageHeight="19"
                    UncheckedImageUrl="images/Star.gif"
                    CheckedImageUrl="images/FilledStar.gif"
                    CheckedImageAlternateText="Check"
                    UncheckedImageAlternateText="UnCheck" />
                <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
                <br /><br />
                <asp:Label ID="Label1" runat="server" Text="[No response provided yet]" />
            </ContentTemplate>
        </asp:UpdatePanel>
      </p>
    </div>
</div>
</div>


<link href="https://fonts.googleapis.com/css?family=Kaushan+Script|Source+Sans+Pro" rel="stylesheet"/>
    </form>
</body>
</html>
