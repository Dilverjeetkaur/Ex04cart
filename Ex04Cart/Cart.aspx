<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Ex04Cart.Cart" %>--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Ex04Cart.Cart" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    
            <div class="row"><%-- row 1 --%>
                <%--<a href="Cart.aspx">Cart.aspx</a>--%> 
                <div class="col-sm-12"><h1>Your shopping cart - Modified</h1></div>
                <div class="col-sm-6"><%-- cart display column --%>
                    <div class="form-group">
                        <div class="col-sm-12"><asp:ListBox ID="lstCart" runat="server" CssClass="form-control"></asp:ListBox></div>
                    </div>
                </div>
                <div class="col-sm-6"><%-- cart edit buttons column --%>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <asp:Button ID="btnRemove" runat="server"
                                Text="Remove Item" CssClass="btn" OnClick="btnRemove_Click" /></div>
                        <div class="col-sm-12">
                            <asp:Button ID="btnEmpty" runat="server"
                                Text="Empty Cart" CssClass="btn" OnClick="btnEmpty_Click" /></div>
                    </div>
                </div>
            </div><%-- end of row 1 --%>

            <div class="row"><%-- row 2 --%>
                <div class="col-sm-12">
                    <div class="form-group"><%-- message label --%>
                        <asp:Label ID="lblMessage" runat="server" EnableViewState="False"
                            CssClass="col-sm-12" Font-Bold="True"  ForeColor="#0247B5"></asp:Label>
                    </div>
                    <div class="form-group"><%-- buttons --%>
                        <div class="col-sm-12">
                            <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" CssClass="btn" PostBackUrl="~/Order.aspx" />
                            <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" CssClass="btn" OnClick="btnCheckOut_Click" />
                        </div>
                    </div>
                </div>
            </div><%-- end of row 2 --%>

</asp:Content>