<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebLinhKien_Trangvpt.Login" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>

<form id="form1" runat="server" autocomplete="off">
        <input type="text" style="display:none">

    <h2>Đăng nhập</h2>

    <p>Tài khoản:</p>
    <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>

    <p>Mật khẩu:</p>
    <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>

    <br /><br />

    <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click" />

    <br /><br />

    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>

</form>

</body>
</html>