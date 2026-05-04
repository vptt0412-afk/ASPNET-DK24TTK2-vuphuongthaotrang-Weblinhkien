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

        /* ===== HEADER ===== */
        .topbar {
            background: #222;
            color: white;
            padding: 12px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .topbar-right a {
            color: white;
            margin-left: 15px;
            text-decoration: none;
        }

        .topbar-right a:hover {
            color: #00bfff;
        }

        .cart-badge {
            background: red;
            color: white;
            border-radius: 50%;
            padding: 2px 6px;
            font-size: 12px;
            margin-left: 3px;
        }

        /* ===== CONTAINER ===== */
        .container {
            width: 1000px;
            margin: 40px auto;
        }

        .detail {
            display: flex;
            gap: 40px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        /* LEFT */
        .left img {
            width: 300px;
            border-radius: 10px;
        }

        /* RIGHT */
        .right {
            flex: 1;
        }

        .right h2 {
            margin-top: 0;
        }

        .price {
            color: red;
            font-size: 24px;
            font-weight: bold;
        }

        .qty-box {
            margin-top: 15px;
        }

        .qty-box input {
            width: 60px;
            padding: 5px;
            text-align: center;
        }

        /* BUTTON */
        .btn-add {
            margin-top: 20px;
            padding: 12px 20px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-add:hover {
            background: #218838;
        }

    </style>
</head>

<body>

<form id="form1" runat="server">

   
    <div class="topbar">

        <div>💻 Web Linh Kiện</div>

        <div class="topbar-right">

            <asp:Label ID="lblUser" runat="server"></asp:Label>

            <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="Default.aspx">
                🏠 Trang chủ
            </asp:HyperLink>

            <asp:HyperLink ID="lnkCart" runat="server" NavigateUrl="GioHang.aspx">
                🛒 Giỏ hàng
                <asp:Label ID="lblCartCount" runat="server" CssClass="cart-badge"></asp:Label>
            </asp:HyperLink>

        </div>

    </div>

  
    <div class="container">

        <div class="detail">

            <!-- LEFT -->
            <div class="left">
                <asp:Image ID="imgSP" runat="server" />
            </div>

            <!-- RIGHT -->
            <div class="right">

                <h2>
                    <asp:Label ID="lblTen" runat="server" />
                </h2>

                <p class="price">
                    <asp:Label ID="lblGia" runat="server" /> VND
                </p>

                <p><b>Loại:</b> <asp:Label ID="lblLoai" runat="server" /></p>
                <p><asp:Label ID="lblThuocTinh" runat="server" /></p>

                <div class="qty-box">
                    Số lượng:
                    <asp:TextBox ID="txtSL" runat="server" Text="1"></asp:TextBox>
                </div>

                <asp:Button ID="btnAdd" runat="server"
                    Text="🛒 Thêm vào giỏ"
                    CssClass="btn-add"
                    OnClick="btnAdd_Click" />

            </div>

        </div>

    </div>

</form>

</body>
</html>