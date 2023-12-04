<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderCompleteOld.aspx.cs" Inherits="Ex04Cart.OrderComplete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<!DOCTYPE html>
<body>
    <img src="Images/Products/OrderSuccess.png" alt="Ordersuccess" class="center">
    <h1 class="text-center">Thank you for your order</h1>
    <h2 class="text-center">We've received your purchase request. You'll receive email notification for all further updates regarding your order.</h2>
    

            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnContinue" runat="server" Text="Shop Again" CssClass="btn-success"
                        CausesValidation="False" PostBackUrl="~/Order.aspx" OnClick="btnContinue_Click" />
                </div>
            </div>
</body>
</html>