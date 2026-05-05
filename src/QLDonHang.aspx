<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QLDonHang.aspx.cs" Inherits="WebLinhKien_Trangvpt.QLDonHang" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Quản lý đơn hàng</title>

    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
            margin: 0;
        }

        /* ===== HEADER ===== */
        .topbar {
            background: #222;
            color: white;
            padding: 12px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .topbar a {
            color: white;
            text-decoration: none;
            margin-left: 15px;
        }

        .topbar a:hover {
            color: #00bfff;
        }

        /* ===== CONTAINER ===== */
        .box {
            width: 900px;
            margin: 40px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        /* ===== BACK BUTTON ===== */
        .back-btn {
            display: inline-block;
            margin-bottom: 15px;
            background: #007bff;
            color: white;
            padding: 8px 12px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
        }

        .back-btn:hover {
            background: #0056b3;
        }

        h2 {
            margin-bottom: 15px;
        }

        /* ===== TABLE ===== */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        th {
            background: #eee;
        }

    </style>
</head>

<body>

<form runat="server">

    <!-- HEADER -->
    <div class="topbar">
        <div>💻 Web Linh Kiện</div>

        <div>
            <a href="Default.aspx">🏠 Trang chủ</a>
        </div>
    </div>

    <div class="box">

    
        <a href="Default.aspx" class="back-btn">← Trang chủ</a>

        <h2>📦 Danh sách đơn hàng</h2>

        <asp:GridView ID="gvDonHang" runat="server"
            AutoGenerateColumns="true"
            GridLines="None" />

    </div>

</form>

</body>
</html>