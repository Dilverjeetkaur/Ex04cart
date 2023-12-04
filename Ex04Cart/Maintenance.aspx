<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Maintenance.aspx.cs" Inherits="Ex04Cart.Maintenance" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    
            <div class="col-xs-12 table-responsive">
                <h1>Category Maintenance</h1>
                <asp:GridView ID="grdCategories" runat="server"
                    AutoGenerateColumns="False" DataKeyNames="ProductID"
                    DataSourceID="SqlDataSource1"
                    CssClass="table table-bordered table-condensed table-hover"
                    OnPreRender="grdCategories_PreRender" 
                    OnRowDeleted="grdCategories_RowDeleted" 
                    OnRowUpdated="grdCategories_RowUpdated" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="ProductID" HeaderText="ProductID" 
                            ReadOnly="True" SortExpression="ProductID">
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Name" 
                            SortExpression="Name">
                        </asp:BoundField>
                        <asp:BoundField DataField="ShortDescription" HeaderText="ShortDescription" 
                            SortExpression="ShortDescription">
                        </asp:BoundField>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <HeaderStyle CssClass="bg-halloween" />
                    <AlternatingRowStyle CssClass="altRow" />
                    <EditRowStyle CssClass="warning" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
                    OldValuesParameterFormatString="original_{0}"
                    SelectCommand="SELECT [ProductID], [Name], [ShortDescription] FROM [Products]"
                    DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = @original_ProductID" 
                    InsertCommand="INSERT INTO Products(ProductID, Name, ShortDescription, OnHand) VALUES (@ProductID, @Name, @ShortDescription, @OnHand)" 
                    UpdateCommand="UPDATE [Products] SET [Name] = @Name, [ShortDescription] = @ShortDescription WHERE [ProductID] = @original_ProductID">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ProductID" Type="String"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProductID" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ShortDescription" Type="String"></asp:Parameter>
                        <asp:Parameter Name="OnHand" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ShortDescription" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_ProductID" Type="String"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>    
            </div>

            <div class="col-xs-12">
                <p>To create a new category, enter the category information 
                    and click Add New Category</p>
                <p><asp:Label ID="lblError" runat="server" EnableViewState="false" 
                        CssClass="text-danger"></asp:Label></p>

                <div class="form-group">
                    <label for="txtID" class="col-sm-2">ID</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtID" runat="server" MaxLength="10" value="9"
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-offset-3 col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvID" runat="server" 
                            ControlToValidate="txtID" CssClass="text-danger" 
                            ErrorMessage="ID is a required field">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtShortName" class="col-sm-2">Short Name</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtShortName" runat="server" MaxLength="15"  value="9"
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-offset-2 col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvShortName" runat="server" 
                        ControlToValidate="txtShortName" CssClass="text-danger" 
                        ErrorMessage="Short Name is a required field">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>              
                <div class="form-group">
                    <label for="txtLongName" class="col-sm-2">Long Name</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtLongName" runat="server" MaxLength="50" value="9"
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvLongName" runat="server" 
                        ControlToValidate="txtLongName" CssClass="text-danger" 
                        ErrorMessage="Long Name is a required field">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label for="txtOnHand" class="col-sm-2">On hand</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtOnHand" runat="server" MaxLength="50" value="50"
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtOnHand" CssClass="text-danger" 
                        ErrorMessage="OnHand is a required field">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <asp:Button ID="btnAdd" runat="server" Text="Add New Category" 
                    CssClass="btn" OnClick="btnAdd_Click" />
            </div>  
</asp:Content>
