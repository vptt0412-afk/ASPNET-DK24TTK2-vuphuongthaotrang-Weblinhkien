<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebLinhKien_Trangvpt._Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trang sản phẩm</title>

    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
            margin: 0;
        }

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
            margin-left: 10px;
            text-decoration: none;
        }

        .cart-badge {
            background: red;
            color: white;
            border-radius: 50%;
            padding: 2px 6px;
            font-size: 12px;
            margin-left: 4px;
        }

        .container {
            width: 1100px;
            margin: auto;
        }

        .title {
            text-align: center;
            font-size: 26px;
            margin: 20px 0;
        }

        .filter {
            text-align: center;
            margin-bottom: 10px;
        }

        .filter a {
            margin: 0 6px;
            font-weight: bold;
            color: #333;
            text-decoration: none;
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
        }

        .clear { clear: both; }
    </style>
</head>

<body>

<form id="form1" runat="server" autocomplete="off">
    <input type="text" style="display:none" />

    <!-- HEADER -->
    <div class="topbar">
        <div class="topbar-left">💻 Web Linh Kiện</div>

        <div class="topbar-right">
            <asp:Label ID="lblUser" runat="server"></asp:Label>

            <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="Login.aspx">Đăng nhập</asp:HyperLink>
            <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="Register.aspx">Đăng ký</asp:HyperLink>
            <asp:HyperLink ID="lnkLogout" runat="server" NavigateUrl="Logout.aspx">Đăng xuất</asp:HyperLink>

            <!-- CHỈ GIỮ QL SẢN PHẨM -->
            <asp:HyperLink ID="lnkAdmin" runat="server" NavigateUrl="QLSanPham.aspx">Quản lý</asp:HyperLink>

            <!-- ❌ ĐÃ XOÁ QL ĐƠN HÀNG -->

            <asp:HyperLink ID="lnkCart" runat="server" NavigateUrl="GioHang.aspx">
                🛒
                <asp:Label ID="lblCartCount" runat="server" CssClass="cart-badge"></asp:Label>
            </asp:HyperLink>
        </div>

        <div class="clear"></div>
    </div>

    <!-- CONTENT -->
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
            <asp:TextBox ID="txtSearch" runat="server" Width="220" placeholder="Tìm sản phẩm..." autocomplete="off" />
            <asp:Button ID="btnSearch" runat="server" Text="Tìm" OnClick="btnSearch_Click" />
        </div>

        <!-- LIST -->
        <asp:DataList ID="dlSanPham" runat="server"
            RepeatColumns="4"
            OnItemCommand="dlSanPham_ItemCommand">

            <ItemTemplate>
                <div class="product">

                    <img src='<%# "image/" + Eval("HinhAnh") %>'
                         onerror="this.src='image/no-image.png'" />

                    <h4><%# Eval("TenSP") %></h4>

                    <p class="price">
                        <%# String.Format("{0:N0}", Eval("Gia")) %> VND
                    </p>

                    <p><%# Eval("Loai") %></p>

                    <div>
                        <a href='<%# "ChiTiet.aspx?id=" + Eval("MaSP") %>'>Chi tiết</a>
                        |
                        <asp:LinkButton runat="server"
                            CommandName="addCart"
                            CommandArgument='<%# Eval("MaSP") %>'>
                            🛒
                        </asp:LinkButton>
                    </div>

                </div>
            </ItemTemplate>

        </asp:DataList>

        <div class="clear"></div>
    </div>

</form>

</body>
</html>