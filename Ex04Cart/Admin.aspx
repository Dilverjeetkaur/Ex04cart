<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Ex04Cart.Category" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    
             <div class="form-group">
                <label id="lblCategory" for="ddlCategory" 
                    class="col-xs-4 col-sm-offset-1 col-sm-3 control-label">
                    Choose a category:</label>
                <div class="col-xs-8 col-sm-5">
                    <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True"
                        DataSourceID="SqlDataSource1" DataTextField="LongName" 
                        DataValueField="CategoryID" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" 
                        ConnectionString='<%$ ConnectionStrings:HalloweenConnectionString %>' 
                        SelectCommand="SELECT * FROM [Categories]">
                    </asp:SqlDataSource>
                </div>
            </div>

            <div class="form-group">
                <div class="col-xs-12 col-sm-offset-1 col-sm-9">
                    <asp:DataList ID="dlProducts" runat="server" 
                        DataKeyField="ProductID" DataSourceID="SqlDataSource2" 
                        CssClass="table table-bordered table-striped table-condensed">
                        <HeaderTemplate>
                            <span class="col-xs-3">ID</span>
                            <span class="col-xs-3">Product</span>
                            <span class="col-xs-3 text-right">Unit Price</span>
                            <span class="col-xs-3 text-right">On Hand</span>
                        </HeaderTemplate>
                        <ItemTemplate>  
                            <asp:Label ID="lblID" runat="server" 
                                Text='<%# Eval("ProductID") %>' CssClass="col-xs-3" />
                            <asp:Label ID="lblName" runat="server" 
                                Text='<%# Eval("Name") %>' CssClass="col-xs-3" />
                            <asp:Label ID="lblUnitPrice" runat="server" 
                                Text='<%# Eval("UnitPrice", "{0:C}") %>' CssClass="col-xs-3 text-right" />
                            <asp:Label ID="lblOnHand" runat="server" 
                                Text='<%# Eval("OnHand") %>' CssClass="col-xs-3 text-right" />   
                        </ItemTemplate>
                        <HeaderStyle CssClass="bg-halloween" />
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
                        SelectCommand="SELECT [ProductID], [Name], [UnitPrice], [OnHand] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlCategory" Name="CategoryID" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>    
                </div>  
            </div>

</asp:Content>
