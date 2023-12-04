<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="Ex04Cart.CheckOut" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
   
          
  <h1>Check Out Page</h1>
            <h3>Contact Information
            </h3>

            <asp:ValidationSummary runat="server" BorderColor="Red" ForeColor="Red"></asp:ValidationSummary>

            <div class="form-group">
                <label class="control-label col-sm-3">Email Address:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtEmail1" runat="server" CssClass="form-control" TextMode="Email" value="dilverjeetk9@gmail.com"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvEmail1" runat="server" 
                        ErrorMessage="Email is required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtEmail1"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Email Re-entry:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtEmail2" runat="server" CssClass="form-control" TextMode="Email" value="dilverjeetk9@gmail.com"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvEmail2" runat="server" 
                        ErrorMessage="Email is required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtEmail2"></asp:RequiredFieldValidator> 
                    <asp:CompareValidator ID="rfvEmail3" runat="server" 
                        ErrorMessage="Your Email address is not matching" CssClass="text-danger" 
                        ControlToCompare="txtEmail1" ControlToValidate="txtEmail2"></asp:CompareValidator>

                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">First Name:</label>
                <div class="col-sm-5">
                    
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" value="Dilverjeet"></asp:TextBox>  
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                        ErrorMessage="First name is required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rfvFirstName2" runat="server" 
                        ErrorMessage="First name should have 4 to 30 letters without any special characters" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtFirstName"
                        ValidationExpression="^[a-zA-Z ]{4,30}$"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Last Name:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" value="Kaur"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                        ErrorMessage="Last name is required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rfvLastName2" runat="server" 
                        ErrorMessage="Last name should have 4 to 30 letters without any special characters" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtLastName"
                        ValidationExpression="^[a-zA-Z ]{4,30}$"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Phone Number:</label>
                <div class="col-sm-5">
                    
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone" value="2263372221"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" 
                        ErrorMessage="Phone number is required." CssClass="text-danger"
                        Display="Dynamic" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
<%--                    <asp:CompareValidator ID="rfvPhoneNumberType" runat="server" 
                        ErrorMessage="Phone Number must containt only numbers" CssClass="text-danger"
                        Display="Dynamic" ControlToValidate="txtPhone"></asp:CompareValidator>--%>
                    <asp:RegularExpressionValidator ID="rfvPhoneNumber2" runat="server" CssClass="text-danger"
                        ErrorMessage="Phone Number must be 10 digits" ValidationExpression="\d{10}"
                        Display="Dynamic" ControlToValidate="txtPhone"></asp:RegularExpressionValidator>
                </div>
            </div>        

            <h3>Billing Address</h3>
            <div class="form-group">
                <label class="control-label col-sm-3">Address:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" value="Angler way"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvStreetAddress" runat="server" 
                        ErrorMessage="Street Address is required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">City:</label>
                <div class="col-sm-5">
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" value="waterloo"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                        ErrorMessage="City is required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">State:</label>
                <div class="col-sm-5">
                    <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" 
                        AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
                        DataTextField="StateName" DataValueField="StateCode">
                        <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
                        SelectCommand="SELECT * FROM [States]">
                    </asp:SqlDataSource>

                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvState" runat="server" 
                        ErrorMessage="State is required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="ddlState"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3">Zip code:</label>
                <div class="col-sm-5">
                    
                    <asp:TextBox ID="txtZip" runat="server" CssClass="form-control" MaxLength="6" value="654321"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvZip" runat="server" 
                        ErrorMessage="Zip is required" CssClass="text-danger" 
                        Display="Dynamic" ControlToValidate="txtZip"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rfvZip2" runat="server"
                        ErrorMessage="Must be a 6 digit Indian Pincode." CssClass="text-danger" 
                        ValidationExpression="\d{6}"
                        Display="Dynamic" ControlToValidate="txtZip"></asp:RegularExpressionValidator>
                </div>
            </div>  

            <h3>Optional data</h3>
            <div class="form-group">
                <div class="col-sm-12">
                    <label>Please let me know about:</label>
                    <asp:CheckBoxList ID="cblAboutList" runat="server" RepeatColumns="2">
                        <asp:ListItem Value="New" style="padding:30px;" Selected="True">New products</asp:ListItem>
                        <asp:ListItem Value="Special" style="padding:30px;">Special offers</asp:ListItem>
                        <asp:ListItem Value="Revisions" style="padding:30px;">New editions</asp:ListItem>
                        <asp:ListItem Value="Local" style="padding:30px;">Local events</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-12">
                    <label>Please contact me via:</label>
                    <asp:RadioButtonList id="rblContactVia" runat="server" RepeatDirection="Horizontal">
                        <asp:listitem selected="true" style="padding:10px;">Twitter</asp:listitem>
                        <asp:listitem style="padding:10px;">Facebook</asp:listitem>
                        <asp:listitem value="text" style="padding:10px;">Text message</asp:listitem>
                        <asp:listitem style="padding:10px;">Email</asp:listitem>
                    </asp:RadioButtonList>
                </div>
            </div>
      <div class="row"><%-- row 1 --%>
                <div class="col-sm-12"><h1>Your shopping cart</h1></div>
                <div class="col-sm-6"><%-- cart display column --%>
                    <div class="form-group">
                        <div class="col-sm-12"><asp:ListBox ID="lstCart" runat="server" CssClass="form-control"></asp:ListBox></div>
                    </div>
                </div>
            </div><%-- end of row 1 --%>

            <div class="row"><%-- row 2 --%>
                <div class="col-sm-12">
                    <div class="form-group"><%-- message label --%>
                        <asp:Label ID="lblMessage" runat="server" EnableViewState="False"
                            CssClass="col-sm-12" Font-Bold="True" ForeColor="#0247B5"></asp:Label>
                    </div>
                </div>
            </div><%-- end of row 2 --%>
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" CssClass="btn"
                        OnClick="btnCheckOut_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" CssClass="btn"
                        CausesValidation="False" OnClick="btnCancel_Click" />
                    <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" CssClass="btn" 
                        CausesValidation="False" PostBackUrl="~/Order.aspx" />

<%--                    <asp:LinkButton ID="lbtnContinueShopping" runat="server" CssClass="btn"
                        PostBackUrl="~/Order.aspx" CausesValidation="False">Continue Shopping</asp:LinkButton>--%>
                </div>
            </div>
    
</asp:Content>