<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QLSanPham.aspx.cs" Inherits="WebLinhKien_Trangvpt.QLSanPham" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Quản lý sản phẩm</title>

    <style>
        body {
            font-family: Arial;
            background: #f1f3f6;
        }

        .container {
            width: 1100px;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 10px;
        }

        /* HEADER */
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .btn {
            padding: 8px 14px;
            border: none;
            cursor: pointer;
            border-radius: 6px;
            color: white;
        }

        .btn-home {
            background: #6c757d;
        }

        .btn-home:hover {
            background: #5a6268;
        }

        .btn-add {
            background: #007bff;
        }

        .btn-add:hover {
            background: #0056b3;
        }

        /* FORM */
        .form-box {
            background: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .form-row {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
        }

        .form-row input {
            flex: 1;
            padding: 6px;
        }

        /* TABLE */
        .gridview {
            width: 100%;
            border-collapse: collapse;
        }

        .gridview th {
            background: #007bff;
            color: white;
            padding: 8px;
        }

        .gridview td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        .gridview tr:hover {
            background: #f2f2f2;
        }

        .img-sp {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 6px;
        }

    </style>

</head>
<body>

<form runat="server">

    <div class="container">

        <!-- HEADER -->
        <div class="top-bar">
            <asp:Button ID="btnHome" runat="server"
                Text="← Trang chủ"
                CssClass="btn btn-home"
                OnClick="btnHome_Click" />

            <h2>Quản lý sản phẩm</h2>

            <div></div>
        </div>

        <!-- FORM THÊM -->
        <div class="form-box">

            <h3>Thêm sản phẩm</h3>

            <div class="form-row">
                <asp:TextBox ID="txtTen" runat="server" placeholder="Tên sản phẩm"></asp:TextBox>
                <asp:TextBox ID="txtGia" runat="server" placeholder="Giá"></asp:TextBox>
            </div>

            <div class="form-row">
                <asp:TextBox ID="txtLoai" runat="server" placeholder="Loại"></asp:TextBox>
                <asp:TextBox ID="txtThuocTinh" runat="server" placeholder="Thuộc tính"></asp:TextBox>
            </div>

            <div class="form-row">
                <asp:FileUpload ID="fileHinh" runat="server" />
                <asp:Button ID="btnThem" runat="server"
                    Text="Thêm sản phẩm"
                    CssClass="btn btn-add"
                    OnClick="btnThem_Click" />
            </div>

        </div>

        <!-- GRIDVIEW -->
        <asp:GridView ID="gvSP" runat="server"
            CssClass="gridview"
            AutoGenerateColumns="False"
            DataKeyNames="MaSP"
            OnRowDeleting="gvSP_RowDeleting"
            OnRowEditing="gvSP_RowEditing"
            OnRowUpdating="gvSP_RowUpdating"
            OnRowCancelingEdit="gvSP_RowCancelingEdit">

            <Columns>

                <asp:BoundField DataField="MaSP" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="TenSP" HeaderText="Tên" />
                <asp:BoundField DataField="Gia" HeaderText="Giá" />
                <asp:BoundField DataField="Loai" HeaderText="Loại" />
                <asp:BoundField DataField="ThuocTinh" HeaderText="Thuộc tính" />

                <asp:TemplateField HeaderText="Hình">
                    <ItemTemplate>
                        <img class="img-sp" src='image/<%# Eval("HinhAnh") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />

            </Columns>

        </asp:GridView>

    </div>

</form>

</body>
</html>