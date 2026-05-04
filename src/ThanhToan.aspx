<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="WebLinhKien_Trangvpt.ThanhToan" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Thanh toán</title>

    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
        }

        .box {
            width: 380px;
            margin: 50px auto;
            background: white;
            padding: 15px;
            border: 1px solid #ddd; 
        }

        input {
            width: 100%;
            padding: 6px;
            margin: 6px 0;
        }

        .btn {
            background: green;
            color: white;
            padding: 8px;
            border: none;
            width: 100%;
            cursor: pointer;
        }
    </style>
</head>

<body>

<form runat="server" autocomplete="off">


    <input type="text" style="display:none">

    <div class="box">

        <h3>Thông tin thanh toán</h3>

        <asp:TextBox ID="txtTen" runat="server" placeholder="Tên" /><br />
        <asp:TextBox ID="txtSDT" runat="server" placeholder="SĐT" /><br />
        <asp:TextBox ID="txtDiaChi" runat="server" placeholder="Địa chỉ" /><br />
        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" /><br />

        <asp:Button ID="btnDone" runat="server"
            Text="Hoàn tất"
            CssClass="btn"
            OnClick="btnDone_Click" />

        <br /><br />

        <asp:Label ID="lblMsg" runat="server" ForeColor="Green"></asp:Label>

    </div>

</form>

</body>
</html>