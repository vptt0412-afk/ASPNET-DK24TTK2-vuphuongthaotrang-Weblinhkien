<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChiTiet.aspx.cs" Inherits="WebLinhKien_Trangvpt.ChiTiet" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Chi tiết sản phẩm</title>

    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
            margin: 0;
        }

        /* ===== HEADER GIỐNG DEFAULT ===== */
        .topbar {
            background: #222;
            color: white;
            padding: 10px 20px;
        }

        .topbar-left {
            float: left;
            font-weight: bold;
        }

        .topbar-right {
            float: right;
        }

        .topbar-right a {
            color: white;
            margin-left: 12px;
            text-decoration: none;
        }

        .clear {
            clear: both;
        }

        /* ===== CONTENT ===== */
        .container {
            width: 900px;
            margin: 40px auto;
        }

        .detail {
            display: flex;
            gap: 30px;
            background: white;
            padding: 25px;
        }

        .left img {
            width: 250px;
        }

        .right {
            flex: 1;
        }

        .price {
            color: red;
            font-size: 22px;
            font-weight: bold;
        }

        .back {
            margin-top: 20px;
            display: inline-block;
            text-decoration: none;
            color: #007bff;
        }
    </style>
</head>

<body>

<form id="form1" runat="server" autocomplete="off">
    <input type="text" style="display:none">

    <!-- HEADER -->
    <div class="topbar">

        <div class="topbar-left">
            💻 Web Linh Kiện
        </div>

        <div class="topbar-right">
            <a href="Default.aspx">Trang chủ</a>
        </div>

        <div class="clear"></div>

    </div>

    <div class="container">

        <div class="detail">

            <!-- ẢNH -->
            <div class="left">
                <asp:Image ID="imgSP" runat="server" Width="250"
                    ImageUrl="image/no-image.png" />
            </div>

            <!-- THÔNG TIN -->
            <div class="right">

                <h2>
                    <asp:Label ID="lblTen" runat="server" />
                </h2>

                <p class="price">
                    <asp:Label ID="lblGia" runat="server" />
                </p>

                <p>
                    <b>Loại:</b>
                    <asp:Label ID="lblLoai" runat="server" />
                </p>

                <p>
                    <asp:Label ID="lblMoTa" runat="server" />
                </p>

                <a href="Default.aspx" class="back">← Quay lại</a>

            </div>

        </div>

    </div>

</form>

</body>
</html>