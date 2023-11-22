<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SearchMovie.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            font-size: xx-large;
        }
        .auto-style3 {
            height: 845px;
        }
        .auto-style4 {
            width: 100%;
            height: 140px;
        }
        .auto-style5 {
            width: 526px;
        }
        .auto-style6 {
            width: 198px;
        }
        .auto-style7 {
            width: 526px;
            height: 44px;
        }
        .auto-style8 {
            width: 198px;
            height: 44px;
        }
        .auto-style9 {
            height: 44px;
        }
    </style>
</head>
<body style="height: 841px">
    <form id="form1" runat="server">
    <div class="auto-style3" style="background-position: left; text-align: center; background-image: url('Images/dbny3w6-a2ab6ff7-04c9-4df6-91bf-511071d09c56.png'); background-repeat: no-repeat;">
    
        <span class="auto-style2" style="text-align: center; color: #646464; font-weight: bold; font-family: Bahnschrift;">
        <br />
        <br />
        <br />
        Login</span><br />
        <br />
        <br />
        <table class="auto-style4">
            <tr>
                <td class="auto-style5" style="text-align: right; font-family: Bahnschrift; font-weight: bolder; color: #646464;">&nbsp; Username:&nbsp; </td>
                <td class="auto-style6" style="text-align: center">
                    <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                </td>
                <td style="text-align: left; font-family: 'Magic R'; font-style: italic; color: #AE2402; font-weight: bolder;">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="Username is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7" style="text-align: right; font-family: Bahnschrift; font-weight: bolder; color: #646464;">Password:</td>
                <td class="auto-style8" style="text-align: center">
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style9" style="text-align: left; font-family: 'Magic R'; font-style: italic; color: #AE2402; font-weight: bolder;">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
    
                </td>
            </tr>
            <tr>
                <td class="auto-style5" style="text-align: right; font-family: Bahnschrift; font-weight: bolder; color: #646464;">
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </td>
                <td class="auto-style6" style="text-align: center">
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" BackColor="#A4FFA4" Height="26px" />
        &nbsp;&nbsp;
        <asp:Button ID="btnRegister" runat="server" CausesValidation="False" Text="Register" OnClick="btnRegister_Click" BackColor="#B0B0FF" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
