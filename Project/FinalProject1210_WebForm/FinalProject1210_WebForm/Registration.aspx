<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="SearchMovie.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            font-size: xx-large;
        }
        .auto-style3 {
            height: 843px;
        }
        .auto-style5 {
            width: 100%;
            height: 205px;
        }
        .auto-style14 {
            width: 544px;
            height: 55px;
        }
        .auto-style15 {
            width: 192px;
            height: 55px;
        }
        .auto-style16 {
            height: 55px;
        }
        .auto-style17 {
            width: 544px;
            height: 54px;
        }
        .auto-style18 {
            width: 192px;
            height: 54px;
        }
        .auto-style19 {
            height: 54px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-position: center; text-align: center; background-image: url('Images/dbny3w6-a2ab6ff7-04c9-4df6-91bf-511071d09c56.png'); background-repeat: no-repeat;" class="auto-style3">
    
        <strong><span class="auto-style2" style="color: #646464; font-family: Bahnschrift">
        <br />
        <br />
        <br />
        <br />
        Register New User</span></strong><br />
        <br />
        <br />
        <br />
        <table class="auto-style5">
            <tr>
                <td class="auto-style14" style="text-align: right; color: #646464; font-family: Bahnschrift; font-weight: bolder;">UserName: </td>
                <td class="auto-style15" style="text-align: center">
                    <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style16" style="text-align: left; font-family: 'Magic R'; font-weight: bolder; font-style: italic; color: #AE2402;">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="Username is required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style14" style="text-align: right; color: #646464; font-family: Bahnschrift; font-weight: bolder;">Password: </td>
                <td class="auto-style15" style="text-align: center">
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style16" style="text-align: left; font-family: 'Magic R'; font-weight: bolder; font-style: italic; color: #AE2402;">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ErrorMessage="Password is required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass" ControlToValidate="txtConfirm" ErrorMessage="Password does not match" SetFocusOnError="True"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style17" style="text-align: right; color: #646464; font-family: Bahnschrift; font-weight: bolder;">Confirm Password: </td>
                <td class="auto-style18" style="text-align: center">
                    <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style19" style="text-align: left; font-family: 'Magic R'; font-weight: bolder; font-style: italic; color: #AE2402;">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirm" ErrorMessage="Must confirm password" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style14" style="text-align: right; color: #646464; font-family: Bahnschrift; font-weight: bolder;">
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </td>
                <td class="auto-style15" style="text-align: center">
        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" BackColor="#B0B0FF" />
                </td>
                <td class="auto-style16"></td>
            </tr>
        </table>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
