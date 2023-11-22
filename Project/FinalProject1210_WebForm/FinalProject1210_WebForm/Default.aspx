<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FinalProject1210_WebForm._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" style="background-position: right; height: 201px; background-image: url('Images/vintage-metal-gears-background.jpg'); filter: opacity(50); background-repeat: no-repeat; background-color: #A0A0A0;">
        <h4 style="font-size: 14px; height: 20px; width: 152px; color: #E5E5E5; font-weight: bold; font-family: Algerian;">Welcome&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblUserName" runat="server" Text="Label" ForeColor="#E5E5E5"></asp:Label>
        </h4>
        <p style="font-size: 14px; height: 29px; width: 155px; color: #E5E5E5; margin-left: 0px; margin-right: 0px; padding-left: 0px; padding-right: 0px; font-weight: bold;">
            <asp:Button ID="btnLogOut" runat="server" Height="25px" Text="LogOut" Width="68px" Font-Bold="true" OnClick="btnLogOut_Click" CssClass="btn-primary" ForeColor="#E5E5E5" />
        </p>
        <h2 style="color: #E5E5E5; font-weight: bolder; font-family: Algerian">Emma Engines</h2>
    </div>

    <div style="left: 0px; top: 0px; height: 120px; display: inline-block; font-family: 'Courier New', Courier, monospace; font-weight: bold;">
        <h3 style="color: #E5E5E5; font-weight: bolder;">Find Customer</h3>
        <br />
        <p style="color: #E5E5E5">
            In here you can get customer's phone, email, address and their orders' information. Click for more <a href="Customer">Details &raquo;</a>.
        </p>
    </div>
    <br />
    <div style="left: 0px; top: 20px; height: 120px; display: inline-block; font-weight: bold; font-family: 'Courier New', Courier, monospace;">
        <h3 style="color: #E5E5E5; font-weight: bolder;">Get Orders</h3>
        <br />
        <p style="color: #E5E5E5">
            You can grab our customers' orders here and change or add new orders to the system. Click for more <a href="Orders">Details &raquo;</a>.
        </p>
    </div>
    <br />
    <div style="left: 0px; top: 40px; height: 120px; display: inline-block; font-weight: bold; font-family: 'Courier New', Courier, monospace;">
        <h3 style="color: #E5E5E5; font-weight: bolder;">What's in stock?</h3>
        <br />
        <p style="color: #E5E5E5">
            You can find our available items and modify them, see which order included that item. Click for more <a href="Inventory">Details &raquo;</a>.
        </p>
    </div>

</asp:Content>
