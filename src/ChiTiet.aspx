<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChiTiet.aspx.cs" Inherits="WebLinhKien_Trangvpt.ChiTiet" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Chi tiết sản phẩm</title>

    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
            margin: 0;
        }

        .topbar {
            background: #1e3a8a;
            color: white;
            padding: 12px 20px;
        }

        .topbar a {
            color: white;
            margin-left: 15px;
            text-decoration: none;
        }

        .container {
            width: 900px;
            margin: 40px auto;
        }

        .detail {
            display: flex;
            gap: 30px;
            background: white;
            padding: 25px;
            border-radius: 10px;
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
            color: #1e3a8a;
            font-weight: bold;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <!-- HEADER -->
    <div class="topbar">
        💻 Web Linh Kiện

        <a href="Default.aspx">🏠 Trang chủ</a>
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

                <!-- NÚT QUAY LẠI -->
                <a href="Default.aspx" class="back">← Quay lại</a>

            </div>

        </div>

    </div>

</form>

</body>
</html>