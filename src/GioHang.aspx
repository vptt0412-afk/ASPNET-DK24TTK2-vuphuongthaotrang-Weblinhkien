<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="WebLinhKien_Trangvpt.GioHang" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Giỏ hàng</title>

    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
            margin: 0;
        }

        .topbar {
            background: #222;
            color: white;
            padding: 12px 20px;
            display: flex;
            justify-content: space-between;
        }

        .topbar-right a {
            color: white;
            margin-left: 15px;
            text-decoration: none;
        }

        .cart-badge {
            background: red;
            color: white;
            border-radius: 50%;
            padding: 2px 6px;
            font-size: 12px;
        }

        .container {
            width: 1000px;
            margin: 40px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #eee;
        }

        img {
            width: 70px;
        }

        .qty {
            display: flex;
            justify-content: center;
            gap: 8px;
        }

        .qty a {
            padding: 4px 10px;
            background: #ddd;
            border-radius: 5px;
            text-decoration: none;
        }

        .delete-btn {
            color: red;
            font-weight: bold;
        }

        .bottom {
            text-align: right;
            margin-top: 20px;
        }

        .total {
            font-size: 20px;
            font-weight: bold;
        }

        .total span {
            color: red;
        }

        .btn-pay {
            padding: 10px 20px;
            background: green;
            color: white;
            border: none;
            border-radius: 5px;
        }

        .empty {
            text-align: center;
            padding: 40px;
            color: gray;
        }
    </style>
</head>

<body>
<form runat="server">

<!-- HEADER -->
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

<h2>🛒 Giỏ hàng của bạn</h2>

<asp:Panel ID="pnlEmpty" runat="server" Visible="false" CssClass="empty">
    Giỏ hàng trống!
</asp:Panel>

<asp:Panel ID="pnlCart" runat="server">

<table>
<tr>
    <th>Ảnh</th>
    <th>Tên</th>
    <th>Giá</th>
    <th>Số lượng</th>
    <th>Thành tiền</th>
    <th>Xoá</th>
</tr>

<asp:Repeater ID="rpCart" runat="server" OnItemCommand="rpCart_ItemCommand">

<ItemTemplate>
<tr>
    <td>
        <img src='<%# "image/" + Eval("HinhAnh") %>' onerror="this.src='image/no-image.png'" />
    </td>

    <td><%# Eval("TenSP") %></td>

    <td>
        <%# String.Format("{0:N0}", Eval("Gia")) %> VND
    </td>

    <td>
        <div class="qty">
            <asp:LinkButton runat="server" CommandName="minus" CommandArgument='<%# Eval("MaSP") %>'>−</asp:LinkButton>
            <%# Eval("SoLuong") %>
            <asp:LinkButton runat="server" CommandName="plus" CommandArgument='<%# Eval("MaSP") %>'>+</asp:LinkButton>
        </div>
    </td>

    <td>
        <%# String.Format("{0:N0}", Eval("ThanhTien")) %> VND
    </td>

    <td>
        <asp:LinkButton runat="server"
            CssClass="delete-btn"
            CommandName="delete"
            CommandArgument='<%# Eval("MaSP") %>'>
            Xoá
        </asp:LinkButton>
    </td>
</tr>
</ItemTemplate>

</asp:Repeater>

</table>

<div class="bottom">
    <div class="total">
        Tổng: <span><asp:Label ID="lblTotal" runat="server"></asp:Label></span>
    </div>

    <br />

    <asp:Button ID="btnPay" runat="server"
        Text="Thanh toán"
        CssClass="btn-pay"
        OnClick="btnPay_Click" />
</div>

</asp:Panel>

</div>

</form>
</body>
</html>