<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="LACTProject.Views.Payment.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%int value = 0; %>
            Plane Tickets Fee : $ <%=value%><br />
            Accomodation Fee  : $ <%=value%><br />
            Insurance Fee     : $ <%=value%><br />
            Total Amount      : $ <%=value%><br />
            Financial Aid <input type="file" name="finAid" /><br />
            Payment Method <select name="payMethod">
                <option value="1">1</option>
                           </select>
            First Name: <input type="text" name="fName" /> Last Name: <input type="text" name="lName" /><br />
            Credit Card No.: <input type="text" name="creditCardNo" /> Expriation Date : <input type="text" name="expDate" />
            SVC : <input type="text" name="SVC" />
            <input type="submit" name="btnSubmitPay" value="Confirm">
        </div>
    </form>
</body>
</html>
