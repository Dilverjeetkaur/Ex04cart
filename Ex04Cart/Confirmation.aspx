<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="Ex04Cart.Confirmation" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">

            <div class="form-group">
                <asp:TextBox ID="txtData" runat="server" TextMode="MultiLine" CssClass="form-control" 
                    Columns="50" Rows="25"></asp:TextBox>  
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
                <asp:Button ID="btnContinue" runat="server" CssClass="btn"
                    PostBackUrl="~/Order.aspx" Text="Continue Shopping" />
                <asp:Button ID="BtnConfirmOrder" runat="server" Text="Confirm your Order" CssClass="btn"
                    CausesValidation="False" PostBackUrl="~/OrderComplete.aspx" />
            </div>
                Cache Timestamp: <asp:Label ID="lblCacheTimestamp" runat="server"></asp:Label><br />
</asp:Content>