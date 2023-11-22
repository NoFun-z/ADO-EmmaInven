<%@ Page Title="Orders" Language="C#" EnableEventValidation="false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="FinalProject1210_WebForm.Orders" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div style="height: 912px; font-family: Bahnschrift;">

        <table style="width: 100%; height: 65px;">
            <tr>
                <td class="modal-sm" style="width: 244px; height: 32px">
                    <asp:Label ID="Label3" runat="server" Text="MANAGE ORDERS"></asp:Label>
                </td>
                <td class="modal-sm" style="width: 133px; height: 32px">&nbsp;</td>
                <td class="modal-sm" style="width: 241px;" rowspan="4">
                    <br />
                    <br />
                    <br />
                    <asp:DetailsView ID="DvEmployee" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="ObjectDataSource6" Height="45px" Width="224px" BackColor="#333333" BorderColor="White" style="margin-right: 0px" CellPadding="1" OnPageIndexChanging="DvEmployee_PageIndexChanging">
                        <Fields>
                            <asp:BoundField DataField="empFirst" HeaderText="First Name: " SortExpression="empFirst" />
                            <asp:BoundField DataField="empLast" HeaderText="Last Name: " SortExpression="empLast" />
                            <asp:TemplateField HeaderText="Role: " SortExpression="posID">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("posID") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("posID") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="ObjectDataSource7" DataTextField="posName" DataValueField="id" Height="26px" SelectedValue='<%# Bind("posID") %>' Width="110px" CssClass="dropdown-toggle btn-default focus" ForeColor="White">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" />
                        </Fields>
                    </asp:DetailsView>
                </td>
                <td style="height: 32px; width: 14px;">&nbsp;</td>
                <td style="height: 32px">&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 244px; height: 32px">&nbsp;</td>
                <td class="modal-sm" style="width: 133px; height: 32px"></td>
                <td style="height: 32px; width: 14px;">&nbsp;</td>
                <td rowspan="3">
                    <table id="custForm" runat="server" style="width: 100%; height: 94px;">
                        <tr>
                            <td style="width: 105px; height: 40px;"></td>
                            <td class="modal-sm" style="width: 214px; height: 40px;">
                                <asp:Button ID="btnToSelectedCust" runat="server" Height="28px" OnClick="btnToSelectedCust_Click" Text="Customer Details" Width="128px" CssClass="btn-warning active focus" />
                            </td>
                            <td style="height: 40px"></td>
                        </tr>
                        <tr>
                            <td style="height: 35px; width: 105px">
                                <asp:Label ID="Label4" runat="server" Text="Customer: "></asp:Label>
                            </td>
                            <td style="height: 35px; width: 214px;">
                                <asp:TextBox ID="txtCustomer" runat="server"></asp:TextBox>
                            </td>
                            <td style="height: 35px"></td>
                        </tr>
                        <tr>
                            <td style="width: 105px; height: 35px;">
                                <asp:Label ID="Label5" runat="server" Text="ID: "></asp:Label>
                            </td>
                            <td class="modal-sm" style="height: 35px; width: 214px">
                                <asp:TextBox ID="txtCustID" runat="server"></asp:TextBox>
                            </td>
                            <td style="height: 35px"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 244px; height: 32px">
                    <asp:Label ID="Label2" runat="server" Text="SELECT AN ORDER: "></asp:Label>
                </td>
                <td class="modal-sm" style="width: 133px; height: 32px">
                    <asp:Label ID="lblEmp" runat="server" Text="Modify Employee: "></asp:Label>
                </td>
                <td style="height: 32px; width: 14px;">
                    <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalProject1210.EmmasDataSetTableAdapters.employeeTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="empFirst" Type="String" />
                            <asp:Parameter Name="empLast" Type="String" />
                            <asp:Parameter Name="posID" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="Param1" SessionField="GridEmp" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="empFirst" Type="String" />
                            <asp:Parameter Name="empLast" Type="String" />
                            <asp:Parameter Name="posID" Type="Int32" />
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 244px; height: 32px">
                    <asp:Label ID="Label6" runat="server" Text="to show employees, customer and modify selected order"></asp:Label>
                </td>
                <td class="modal-sm" style="width: 133px; height: 32px">&nbsp;</td>
                <td style="height: 32px; width: 14px;">
                    <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalProject1210.EmmasDataSetTableAdapters.positionTableAdapter"></asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="GvOrder" runat="server" Width="823px" AutoGenerateColumns="False" DataKeyNames="id" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowPaging="True" DataSourceID="ObjectDataSource2" Height="167px" OnSelectedIndexChanged="GvOrder_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Order ID" />
                <asp:BoundField DataField="ordNumber" HeaderText="#Order" SortExpression="ordNumber" />
                <asp:BoundField DataField="ordDate" HeaderText="Order Date" SortExpression="ordDate" />
                <asp:CheckBoxField DataField="ordPaid" HeaderText="Paid" SortExpression="ordPaid" />
                <asp:TemplateField HeaderText="Payment Type" SortExpression="paymentID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("paymentID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource3" DataTextField="payType" DataValueField="id" Height="25px" SelectedValue='<%# Bind("paymentID") %>' Width="110px" CssClass="dropdown-toggle btn-info focus">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Customer" SortExpression="custID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("custID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ObjectDataSource4" DataTextField="FullName" DataValueField="id" Height="25px" SelectedValue='<%# Bind("custID") %>' Width="110px" CssClass="dropdown-toggle btn-info focus">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Employee" SortExpression="empID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("empID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="ObjectDataSource5" DataTextField="empFull" DataValueField="id" Height="25px" SelectedValue='<%# Bind("empID") %>' Width="110px" CssClass="dropdown-toggle btn-info focus">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn-info focus" />
                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Select" Text="Select" CssClass="btn-primary active focus" />
                        &nbsp;
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="#514C4C" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>

        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalProject1210.EmmasDataSetTableAdapters.receiptTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ordNumber" Type="String" />
                <asp:Parameter Name="ordDate" Type="DateTime" />
                <asp:Parameter Name="ordPaid" Type="Boolean" />
                <asp:Parameter Name="paymentID" Type="Int32" />
                <asp:Parameter Name="custID" Type="Int32" />
                <asp:Parameter Name="empID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ordNumber" Type="String" />
                <asp:Parameter Name="ordDate" Type="DateTime" />
                <asp:Parameter Name="ordPaid" Type="Boolean" />
                <asp:Parameter Name="paymentID" Type="Int32" />
                <asp:Parameter Name="custID" Type="Int32" />
                <asp:Parameter Name="empID" Type="Int32" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <table style="width: 48%; height: 34px;">
            <tr>
                <td style="width: 217px">
                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalProject1210.EmmasDataSetTableAdapters.paymentTableAdapter"></asp:ObjectDataSource>
                </td>
                <td style="width: 20px">
                    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalProject1210.EmmasDataSetTableAdapters.customerNoFilterTableAdapter"></asp:ObjectDataSource>
                </td>
                <td>
                    <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalProject1210.EmmasDataSetTableAdapters.employeeNoFilterTableAdapter"></asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        <br />
        <table style="width: 69%;">
            <tr>
                <td class="modal-sm" style="width: 333px">
                    <asp:Label ID="lblOrderInsert" runat="server" Text="Insert/Delete Order"></asp:Label>
                </td>
                <td style="width: 196px">&nbsp;</td>
                <td>
                    <asp:Label ID="lblOrderPrice" runat="server" Text="Inven Price"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 333px; height: 21px;"></td>
                <td style="width: 196px; height: 21px;"></td>
                <td style="height: 21px">
                    </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 333px; height: 172px;">

                    <asp:DetailsView ID="DvReceiptInsert" runat="server" Height="50px" Width="309px" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="ObjectDataSource8" OnItemDeleted="DvReceiptInsert_ItemDeleted" OnPageIndexChanging="DvReceiptInsert_PageIndexChanging" BackColor="#333333" CssClass="table-condensed">
                        <Fields>
                            <asp:BoundField DataField="ordNumber" HeaderText="#Order" SortExpression="ordNumber" />
                            <asp:BoundField DataField="ordDate" HeaderText="Date" SortExpression="ordDate" />
                            <asp:CheckBoxField DataField="ordPaid" HeaderText="Paid" SortExpression="ordPaid" />
                            <asp:TemplateField HeaderText="Payment" SortExpression="paymentID">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("paymentID") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("paymentID") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="ObjectDataSource3" DataTextField="payType" DataValueField="id" Height="21px" SelectedValue='<%# Bind("paymentID") %>' Width="100px" CssClass="dropdown-toggle btn-info focus">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Customer" SortExpression="custID">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("custID") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("custID") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="ObjectDataSource4" DataTextField="FullName" DataValueField="id" Height="27px" SelectedValue='<%# Bind("custID") %>' Width="100px" CssClass="dropdown-toggle btn-info">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Employee" SortExpression="empID">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("empID") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("empID") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="ObjectDataSource5" DataTextField="empFull" DataValueField="id" Height="18px" SelectedValue='<%# Bind("empID") %>' Width="100px" CssClass="dropdown-toggle btn-info focus" ForeColor="White">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <InsertItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn-info active focus" />
                                    &nbsp;
                                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="confirm('Are you sure you want to delete this order?')" CssClass="btn-danger active focus" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                </td>
                <td style="width: 196px; height: 172px;"></td>
                <td style="height: 172px">
                    <asp:GridView ID="GvInvenOrder" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource9" OnSelectedIndexChanged="GvInvenOrder_SelectedIndexChanged" Width="476px" BackColor="#333333">
                        <Columns>
                            <asp:BoundField DataField="prodName" HeaderText="Product" SortExpression="prodName" />
                            <asp:BoundField DataField="invQuantity" HeaderText="InvenQuantity" SortExpression="invQuantity" />
                            <asp:BoundField DataField="invSize" HeaderText="InvenSize" SortExpression="invSize" />
                            <asp:CheckBoxField DataField="ordPaid" HeaderText="Pay Status" SortExpression="ordPaid" />
                            <asp:BoundField DataField="InvenPrice" HeaderText="InvenPrice" SortExpression="InvenPrice" ReadOnly="True" />
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" ReadOnly="True" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 333px">
                    <asp:ObjectDataSource ID="ObjectDataSource8" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalProject1210.EmmasDataSetTableAdapters.receiptInsertTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ordNumber" Type="String" />
                            <asp:Parameter Name="ordDate" Type="DateTime" />
                            <asp:Parameter Name="ordPaid" Type="Boolean" />
                            <asp:Parameter Name="paymentID" Type="Int32" />
                            <asp:Parameter Name="custID" Type="Int32" />
                            <asp:Parameter Name="empID" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GvOrder" Name="Param1" PropertyName="SelectedRow.Cells[0].Text" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ordNumber" Type="String" />
                            <asp:Parameter Name="ordDate" Type="DateTime" />
                            <asp:Parameter Name="ordPaid" Type="Boolean" />
                            <asp:Parameter Name="paymentID" Type="Int32" />
                            <asp:Parameter Name="custID" Type="Int32" />
                            <asp:Parameter Name="empID" Type="Int32" />
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>

                </td>
                <td style="width: 196px">&nbsp;</td>
                <td>
                    <asp:ObjectDataSource ID="ObjectDataSource9" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalProject1210.EmmasDataSetTableAdapters.InvenOrderTableAdapter">
                        <SelectParameters>
                            <asp:SessionParameter Name="Param3" SessionField="GridOrder" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 333px">
                    <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
                </td>
                <td style="width: 196px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

    </div>
</asp:Content>
