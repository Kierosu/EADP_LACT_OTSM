<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentCreation.aspx.cs" Inherits="LACTProject.Views.Payment.PaymentCreation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%int value = 0 %>
            Plane Tickets Fee: <input type="text" name="ticketsFee" value="$"/> <br />
            Accomodation Fee : <input type="text" name="accomFee" value="$"/><br />
            Insurance Fee    : <input type="text" name="insuranceFee" value="$"/><br />
            Total Amount     : <%=value %><br />
            Student : <% //get things from sql
                          string name = "Whatever";
                          //forloop


                            %>
            <input type="checkbox" name="vehicle" value="Bike"> <%=name %><br>
            <%          //close forloop
                %>
        </div>
    </form>
</body>
</html>
