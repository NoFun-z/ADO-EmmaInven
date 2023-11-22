<%@ Page Title="Customer" EnableEventValidation="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="FinalProject1210_WebForm.Customer" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br/ >
    <div style="height: 1215px; font-family: Bahnschrift;">
        <br />
        <asp:Label ID="Label11" runat="server" Text="MANAGE CUSTOMER PROFILES"></asp:Label>
        <br />

        <table style="width: 101%; height: 487px; margin-top: 0px;">
            <tr>
                <td style="width: 881px">

                    <table style="width: 99%;">
                        <tr>
                            <td style="height: 40px; width: 150px">
                                <asp:Label ID="Label9" runat="server" Text="Search by First Name: "></asp:Label>
                            </td>
                            <td style="height: 40px; width: 231px">
                                <asp:TextBox ID="txtFirstFilter" runat="server" Width="95px" ForeColor="Black"></asp:TextBox>
                            </td>
                            <td style="height: 40px; width: 127px">
                                <asp:Label ID="Label8" runat="server" Text="Search by City: "></asp:Label>
                            </td>
                            <td style="height: 40px; width: 124px;">
                                <asp:DropDownList ID="ddlCityFilter" runat="server" DataSourceID="ObjectDataSource1"
                                    AppendDataBoundItems="True" DataTextField="custCity" DataValueField="custCity" Height="17px" style="margin-left: 0" Width="119px" CssClass="dropdown-toggle btn-info focus">
                                    <asp:ListItem Selected="True" Value="All"> All </asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="height: 40px">
                                </td>
                        </tr>
                        <tr>
                            <td style="height: 40px; width: 150px">
                                <asp:Label ID="Label10" runat="server" Text="Search by Last Name: "></asp:Label>
                            </td>
                            <td style="width: 231px; height: 40px">
                                <asp:TextBox ID="txtLastFilter" runat="server" style="margin-left: 0" Width="95px" ForeColor="Black"></asp:TextBox>
                            </td>
                            <td style="height: 40px; width: 127px">
                                </td>
                            <td style="height: 40px; width: 124px;">
                                </td>
                            <td style="height: 40px">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px; height: 40px;">
                                <asp:Label ID="lblcustID" runat="server" Text="Selected Customer: "></asp:Label>
                            </td>
                            <td style="width: 231px; height: 40px;">
                                <asp:TextBox ID="txtcustID" runat="server" Width="40px" ForeColor="Black"></asp:TextBox>
                            </td>
                            <td style="width: 127px; height: 40px;">
                                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" CssClass="btn-warning active focus" />
                            </td>
                            <td style="width: 124px; height: 40px;">
                                <asp:Button ID="btnClearSearch" runat="server" OnClick="btnClearSearch_Click" Text="Clear Filter" CssClass="btn-success active focus" />
                            </td>
                            <td style="height: 40px"></td>
                        </tr>
                        <tr>
                            <td style="width: 150px">&nbsp;</td>
                            <td style="width: 231px">&nbsp;</td>
                            <td style="width: 127px">
                                &nbsp;</td>
                            <td style="width: 124px">
                                &nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        </table>

        <asp:GridView ID="GvCust" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White"
            BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" Width="835px" style="margin-bottom: 0px; text-align: center" Height="357px" CellSpacing="1" CssClass="table-bordered" GridLines="None">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle ForeColor="Black" BackColor="#DEDFDE" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Customer ID" />
                <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                <asp:BoundField DataField="custPhone" HeaderText="Phone" />
                <asp:BoundField DataField="FullAddress" HeaderText="Address" />
                <asp:BoundField DataField="custEmail" HeaderText="Email" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnCustSelect" Text="Select" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="btnCustSelect_Click" CssClass="btn-primary disabled" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="#514C4C" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalProject1210.EmmasDataSetTableAdapters.cusCityTableAdapter">
        </asp:ObjectDataSource>

                &nbsp;</td>
                <td style="width: 535px; text-align: center;">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    &nbsp;<table id="UpdateForm" runat="server" style="width: 99%;">
                        <tr>
                            <td style="width: 203px; text-align: center;">
                    <asp:Label ID="Label7" runat="server" Text="Modify Customer"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 203px; text-align: right;">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 203px; text-align: right; height: 30px;">
                                <asp:Label ID="Label1" runat="server" Text="First Name: "></asp:Label>
                            </td>
                            <td style="height: 30px">
                                <asp:TextBox ID="txtFirst" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 30px; width: 203px; text-align: right;">
                                <asp:Label ID="Label2" runat="server" Text="LastName: "></asp:Label>
                            </td>
                            <td style="height: 30px">
                                <asp:TextBox ID="txtLast" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; width: 203px; height: 30px;">
                                <asp:Label ID="Label3" runat="server" Text="Phone: "></asp:Label>
                            </td>
                            <td style="height: 30px">
                                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 203px; height: 30px; text-align: right;">
                                <asp:Label ID="Label4" runat="server" Text="Address: "></asp:Label>
                            </td>
                            <td style="height: 30px">
                                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 203px; text-align: right; height: 30px;">
                                <asp:Label ID="Label5" runat="server" Text="City: "></asp:Label>
                            </td>
                            <td style="height: 30px">
                                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 203px; text-align: right; height: 30px;">
                                <asp:Label ID="Label13" runat="server" Text="Postal Code: "></asp:Label>
                            </td>
                            <td style="height: 30px">
                                <asp:TextBox ID="txtPostal" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 203px; text-align: right; height: 30px;">
                                <asp:Label ID="Label6" runat="server" Text="Email"></asp:Label>
                            </td>
                            <td style="height: 30px">
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 203px">
                                <asp:Button ID="btnEditCust" runat="server" Text="Edit Record" OnClick="btnEditCust_Click" CssClass="btn-info active focus" />
&nbsp;<asp:Button ID="btnUpdateCust" runat="server" Text="Update" OnClick="btnUpdateCust_Click" CssClass="btn-info active focus" />
                                <asp:Button ID="CancelUpdate" runat="server" OnClick="CancelUpdate_Click" Text="Cancel" CssClass="btn-success focus" />
                            </td>
                            <td style="text-align: center">
                                <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" CssClass="btn-info active focus" />
&nbsp;
                                <asp:Button ID="btnDelete" runat="server" Text="Remove" OnClick="btnDelete_Click" CssClass="btn-danger active focus" />
                                <asp:Button ID="btnRemove" runat="server" Text="Delete" OnClick="btnRemove_Click" CssClass="btn-danger active" />
                                <asp:Button ID="CancelDelete" runat="server" OnClick="CancelDelete_Click" Text="Cancel" CssClass="btn-success focus" style="height: 24px" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 203px">
                                &nbsp;</td>
                            <td style="text-align: center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 203px">
                                &nbsp;</td>
                            <td style="text-align: center">
                    <asp:Label ID="custResult" runat="server" Text="Ready to be modified"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
        </table>

        <br />
        <br />
        <table style="width: 76%; height: 93px;">
            <tr>
                <td style="width: 742px; height: 50px;">
        <asp:Label ID="Label12" runat="server" Text="Order by Customer: "></asp:Label>
                </td>
                <td class="modal-sm" style="width: 449px; height: 50px; text-align: center;">
                    <asp:GridView ID="gvEmp" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ObjectDataSource2" Height="16px" Width="298px">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="empFull" HeaderText="empFull" ReadOnly="True" SortExpression="empFull" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td style="width: 484px; height: 50px;">
                    &nbsp;</td>
                <td style="width: 138px; height: 50px;">
                    <asp:Button ID="btnDirectOrder" runat="server" OnClick="btnDirectOrder_Click" style="margin-bottom: 0" Text="See All Orders" CssClass="btn-warning active focus" />
                </td>
                <td style="width: 214px; height: 50px;">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="GvCustOrder" runat="server" AutoGenerateColumns="False" DataKeyNames="id" Height="203px" Width="1000px" style="text-align: center" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table-bordered">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="custFull" HeaderText="Name" ReadOnly="True" SortExpression="Customer Name" />
                <asp:BoundField DataField="orlQuantity" HeaderText="Quantity" SortExpression="Order Quantity" />
                <asp:CheckBoxField DataField="orlOrderReq" HeaderText="Request" SortExpression="Order Request" />
                <asp:BoundField DataField="ordNumber" HeaderText="ORD Number" SortExpression="Order Number" />
                <asp:BoundField DataField="ordDate" HeaderText="Date" SortExpression="Order Date" />
                <asp:CheckBoxField DataField="ordPaid" HeaderText="Paid" SortExpression="Paid" />
                <asp:BoundField DataField="prodName" HeaderText="Product" SortExpression="Product Name" />
                <asp:BoundField DataField="onordArriveDate" HeaderText="ArriveDate" SortExpression="Arrive Date" />
                <asp:BoundField DataField="onordInvoiceNum" HeaderText="#Invoice" SortExpression="#Invoice" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnOrderSelect" Text="Select" runat="server" CommandArgument='<%# Eval("empID") %>' OnClick="btnOrderSelect_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>

        <br />
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalProject1210.EmmasDataSetTableAdapters.employeeFullTableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="Param1" SessionField="empID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

    </div>
</asp:Content>
