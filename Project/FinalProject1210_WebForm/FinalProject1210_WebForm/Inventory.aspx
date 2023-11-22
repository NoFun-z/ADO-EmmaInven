<%@ Page Title="Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="FinalProject1210_WebForm.Inventory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div style="height: 1010px; width: 1313px; margin-bottom: 0px;">

        <table style="width:100%;">
            <tr>
                <td class="modal-sm" style="font-family: Bahnschrift;">
                    <asp:Label ID="Label1" runat="server" Text="MANAGE INVENTORY"></asp:Label>
                </td>
                <td style="font-family: Bahnschrift">Maintaining Inventory and view product order request </td>
                <td style="font-family: Bahnschrift"></td>
            </tr>
            <tr>
                <td class="modal-lg" style="width: 236px; height: 20px;"></td>
                <td style="height: 20px"></td>
                <td style="height: 20px"></td>
            </tr>
            </table>
        <br />
        <table style="width: 100%; height: 949px; font-family: Bahnschrift;">
            <tr>
                <td class="modal-sm" style="width: 36px; height: 501px;">
                    <asp:Button ID="btnShowInven" runat="server" OnClick="btnShowInven_Click" Text="View Full" CssClass="btn-warning active focus" />
                    <br />
                    <br />
                    <asp:Button ID="btnFilterInven" runat="server" OnClick="btnFilterInven_Click" Text="Search w/ Product" CssClass="btn-warning active focus" />
                    <asp:DropDownList ID="ddlProduct" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="prodName" DataValueField="id" Height="16px" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged" Width="140px" ForeColor="Black">
                    </asp:DropDownList>
                </td>
                <td style="width: 24px; height: 501px;"></td>
                <td class="modal-sm" style="width: 31px; height: 501px; text-align: center;">
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalProject1210.EmmasDataSetTableAdapters.productTableAdapter"></asp:ObjectDataSource>
                    <asp:GridView ID="gvInvenFull" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ObjectDataSource2" OnSelectedIndexChanged="gvInvenFull_SelectedIndexChanged" Width="598px" BackColor="#333333">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="invQuantity" HeaderText="Quantity" SortExpression="invQuantity" />
                            <asp:BoundField DataField="invSize" HeaderText="Size" SortExpression="invSize" />
                            <asp:BoundField DataField="invMeasure" HeaderText="Measure" SortExpression="invMeasure" />
                            <asp:BoundField DataField="invPrice" HeaderText="Price" SortExpression="invPrice" />
                            <asp:TemplateField HeaderText="product" SortExpression="productID">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("productID") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ObjectDataSource1" DataTextField="prodName" DataValueField="id" Height="16px" SelectedValue='<%# Bind("productID") %>' Width="115px" ForeColor="White" CssClass="dropdown-toggle btn-info focus">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" CssClass="btn-primary disabled" ForeColor="White" Text="Select" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:GridView ID="gvInvenSignle" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ObjectDataSource3" OnSelectedIndexChanged="gvInvenSignle_SelectedIndexChanged" Width="694px" style="margin-right: 0px" BackColor="#333333" OnRowDeleted="gvInvenSignle_RowDeleted">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="invQuantity" HeaderText="Quantity" SortExpression="invQuantity" />
                            <asp:BoundField DataField="invSize" HeaderText="Size" SortExpression="invSize" />
                            <asp:BoundField DataField="invMeasure" HeaderText="Measure" SortExpression="invMeasure" />
                            <asp:BoundField DataField="invPrice" HeaderText="Price" SortExpression="invPrice" />
                            <asp:TemplateField HeaderText="product" SortExpression="productID">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("productID") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="dropdown-toggle btn-info focus" DataSourceID="ObjectDataSource1" DataTextField="prodName" DataValueField="id" ForeColor="White" Height="25px" SelectedValue='<%# Bind("productID") %>' Width="100px">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn-info active focus" Text="Edit" />
                                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Select" CssClass="btn-primary disabled" Text="Select" />
                                    &nbsp;<asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn-danger active focus" Text="Delete" OnClientClick="confirm('Are you sure about deleting this record?')" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalProject1210.EmmasDataSetTableAdapters.inventoryTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="invQuantity" Type="Int32" />
                            <asp:Parameter Name="invSize" Type="Decimal" />
                            <asp:Parameter Name="invMeasure" Type="String" />
                            <asp:Parameter Name="invPrice" Type="Decimal" />
                            <asp:Parameter Name="productID" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="invQuantity" Type="Int32" />
                            <asp:Parameter Name="invSize" Type="Decimal" />
                            <asp:Parameter Name="invMeasure" Type="String" />
                            <asp:Parameter Name="invPrice" Type="Decimal" />
                            <asp:Parameter Name="productID" Type="Int32" />
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    <asp:GridView ID="gvInvenOrder" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource5" Width="698px" BackColor="#333333" style="margin-right: 0px" OnSelectedIndexChanged="gvInvenOrder_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="prodName" HeaderText="Product" SortExpression="prodName" />
                            <asp:BoundField DataField="prodDescription" HeaderText="Description" SortExpression="prodDescription" />
                            <asp:BoundField DataField="prodBrand" HeaderText="Brand" SortExpression="prodBrand" />
                            <asp:CheckBoxField DataField="orlOrderReq" HeaderText="Request" SortExpression="orlOrderReq" />
                            <asp:BoundField DataField="onordArriveDate" HeaderText="ArriveDate" SortExpression="onordArriveDate" />
                            <asp:BoundField DataField="invQuantity" HeaderText="Quantity" SortExpression="invQuantity" />
                            <asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="True" SortExpression="Price" />
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalProject1210.EmmasDataSetTableAdapters.inventorySingleTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="invQuantity" Type="Int32" />
                            <asp:Parameter Name="invSize" Type="Decimal" />
                            <asp:Parameter Name="invMeasure" Type="String" />
                            <asp:Parameter Name="invPrice" Type="Decimal" />
                            <asp:Parameter Name="productID" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProduct" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="invQuantity" Type="Int32" />
                            <asp:Parameter Name="invSize" Type="Decimal" />
                            <asp:Parameter Name="invMeasure" Type="String" />
                            <asp:Parameter Name="invPrice" Type="Decimal" />
                            <asp:Parameter Name="productID" Type="Int32" />
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalProject1210.EmmasDataSetTableAdapters.ProductOrderTableAdapter">
                        <SelectParameters>
                            <asp:SessionParameter Name="Param1" SessionField="invenID" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
                <td style="width: 9px; height: 501px;">
                    <asp:DetailsView ID="dvUpdateInven" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="ObjectDataSource4" Height="79px" Width="191px" BackColor="#333333" OnItemDeleted="dvUpdateInven_ItemDeleted">
                        <Fields>
                            <asp:BoundField DataField="invQuantity" HeaderText="Quantity" SortExpression="invQuantity" />
                            <asp:BoundField DataField="invSize" HeaderText="Size" SortExpression="invSize" />
                            <asp:BoundField DataField="invMeasure" HeaderText="Measure" SortExpression="invMeasure" />
                            <asp:TemplateField HeaderText="product" SortExpression="productID">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("productID") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("productID") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="dropdown-toggle btn-default focus" DataSourceID="ObjectDataSource1" DataTextField="prodName" DataValueField="id" ForeColor="White" Height="25px" SelectedValue='<%# Bind("productID") %>' Width="100px">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="invPrice" HeaderText="Price" SortExpression="invPrice" />
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn-info active focus" Text="Edit" />
                                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="New" CssClass="btn-info active focus" Text="New" />
                                    &nbsp;<asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn-danger active focus" Text="Delete" OnClientClick="confirm('Do you really want to delete this record?')" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalProject1210.EmmasDataSetTableAdapters.inventory1TableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="invQuantity" Type="Int32" />
                            <asp:Parameter Name="invSize" Type="Decimal" />
                            <asp:Parameter Name="invMeasure" Type="String" />
                            <asp:Parameter Name="invPrice" Type="Decimal" />
                            <asp:Parameter Name="productID" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvInvenFull" Name="Param1" PropertyName="SelectedRow.Cells[0].Text" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="invQuantity" Type="Int32" />
                            <asp:Parameter Name="invSize" Type="Decimal" />
                            <asp:Parameter Name="invMeasure" Type="String" />
                            <asp:Parameter Name="invPrice" Type="Decimal" />
                            <asp:Parameter Name="productID" Type="Int32" />
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    <asp:Label ID="lblInvenResult" runat="server" Text="Ready..."></asp:Label>
                    <br />
                    <table style="width: 2444%;">
                        <tr>
                            <td>
                                <asp:Label ID="lblNoCust" runat="server" Text="#Customers bought this product"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtNoCust" runat="server" ForeColor="Black"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblNoOrders" runat="server" Text="#Orders this product has"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtNoOrders" runat="server" ForeColor="Black"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="height: 501px"></td>
            </tr>
            <tr>
                <td rowspan="2" style="width: 36px">
                    &nbsp;</td>
                <td class="modal-sm" style="width: 24px">&nbsp;</td>
                <td class="modal-sm" rowspan="2" style="width: 31px">
                    <br />
                    <br />
                    <br />
                </td>
                <td class="modal-sm" style="width: 9px">&nbsp;</td>
                <td style="width: 82px">&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 24px">&nbsp;</td>
                <td class="modal-sm" style="width: 9px">&nbsp;</td>
                <td style="width: 82px">&nbsp;</td>
            </tr>
        </table>

    </div>
    <br />
</asp:Content>
