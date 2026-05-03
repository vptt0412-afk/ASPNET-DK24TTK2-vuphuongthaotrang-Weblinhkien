<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebLinhKien_Trangvpt.Register" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Đăng ký</title>
</head>
<body>

<form id="form1" runat="server">

    <h2>Đăng ký</h2>

    Tài khoản:
    <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
    <br />

    Mật khẩu:
    <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
    <br />

    <asp:Button ID="btnRegister" runat="server"
        Text="Đăng ký"
        OnClick="btnRegister_Click" />

    <br />

    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>

</form>

</body>
</html>