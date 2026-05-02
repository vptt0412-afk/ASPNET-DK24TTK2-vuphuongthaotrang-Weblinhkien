<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebLinhKien_Trangvpt._Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trang sản phẩm</title>

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
            font-size: 18px;
            font-weight: bold;
        }

        .container {
            width: 1100px;
            margin: auto;
        }

        .title {
            text-align: center;
            font-size: 26px;
            margin: 20px 0 10px;
            font-weight: bold;
        }

        .filter {
            text-align: center;
            margin-bottom: 10px;
        }

        .filter a {
            text-decoration: none;
            margin: 0 6px;
            font-weight: bold;
            color: #333;
        }

        .filter a:hover {
            color: #1e3a8a;
        }

        .search-box {
            text-align: center;
            margin-bottom: 15px;
        }

        .product {
            border: 1px solid #ddd;
            width: 200px;
            padding: 10px;
            margin: 10px;
            float: left;
            background: white;
            text-align: center;
        }

        .product img {
            width: 120px;
            height: 120px;
            object-fit: contain;
        }

        .price {
            color: red;
            font-weight: bold;
            font-size: 14px;
        }

        .clear {
            clear: both;
        }
    </style>
</head>

<body>

<form id="form1" runat="server" autocomplete="off">
    <input type="text" style="display:none">

    <!-- HEADER -->
    <div class="topbar">
        💻 Web Linh Kiện
    </div>

    <div class="container">

        <div class="title">Danh sách sản phẩm</div>

        <!-- FILTER -->
        <div class="filter">
            <a href="Default.aspx">Tất cả</a>

            <asp:Repeater ID="rpLoai" runat="server">
                <ItemTemplate>
                    |
                    <a href='Default.aspx?loai=<%# Eval("Loai") %>'>
                        <%# Eval("Loai") %>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- SEARCH -->
        <div class="search-box">
            <asp:TextBox ID="txtSearch" runat="server" Width="220" placeholder="Tìm sản phẩm..." />
            <asp:Button ID="btnSearch" runat="server" Text="Tìm" OnClick="btnSearch_Click" />
        </div>

        <!-- PRODUCT LIST -->
        <asp:DataList ID="dlSanPham" runat="server" RepeatColumns="4">

            <ItemTemplate>

                <div class="product">

                    <!-- FIX ẢNH LỖI -->
                    <img src='<%# "image/" + Eval("HinhAnh") %>'
                         onerror="this.src='image/no-image.png'" />

                    <h4><%# Eval("TenSP") %></h4>

                    <p class="price">
                        <%# String.Format("{0:N0}", Eval("Gia")) %> VND
                    </p>

                    <p><%# Eval("Loai") %></p>

                    <p><%# Eval("ThuocTinh") %></p>

                    <!-- CHI TIẾT -->
                    <div style="margin-top:6px;">
                        <a href='<%# "ChiTiet.aspx?id=" + Eval("MaSP") %>'>
                            Xem chi tiết
                        </a>
                    </div>

                </div>

            </ItemTemplate>

        </asp:DataList>

        <div class="clear"></div>

    </div>

</form>

</body>
</html>