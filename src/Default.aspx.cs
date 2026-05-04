using System;
using System.Data;
using System.Web.UI;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace WebLinhKien_Trangvpt
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadLoai();
                LoadSanPham();
            }

            CheckLogin();
            LoadCartCount();
        }

        // ===== LOAD LOẠI =====
        void LoadLoai()
        {
            ketnoi kn = new ketnoi();
            DataTable dt = kn.getData("SELECT DISTINCT Loai FROM SanPham");

            rpLoai.DataSource = dt;
            rpLoai.DataBind();
        }

        // ===== LOAD SẢN PHẨM =====
        void LoadSanPham()
        {
            ketnoi kn = new ketnoi();

            string loai = Request.QueryString["loai"];
            string keyword = Request.QueryString["search"];

            string sql = "SELECT * FROM SanPham WHERE 1=1";

            if (!string.IsNullOrEmpty(loai))
            {
                sql += " AND Loai = N'" + loai + "'";
            }

            if (!string.IsNullOrEmpty(keyword))
            {
                sql += " AND TenSP LIKE N'%" + keyword + "%'";
            }

            DataTable dt = kn.getData(sql);

            dlSanPham.DataSource = dt;
            dlSanPham.DataBind();
        }

        // ===== SEARCH =====
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text.Trim();
            string loai = Request.QueryString["loai"];

            string url = "Default.aspx?search=" + keyword;

            if (!string.IsNullOrEmpty(loai))
            {
                url += "&loai=" + loai;
            }

            Response.Redirect(url);
        }

        // ===== LOGIN UI =====
        void CheckLogin()
        {
            if (Session["user"] == null)
            {
                lblUser.Text = "";

                lnkLogin.Visible = true;
                lnkRegister.Visible = true;
                lnkLogout.Visible = false;

                lnkAdmin.Visible = false;
            }
            else
            {
                lblUser.Text = "Xin chào: " + Session["user"].ToString();

                lnkLogin.Visible = false;
                lnkRegister.Visible = false;
                lnkLogout.Visible = true;

                
                if (Session["role"] != null && Session["role"].ToString() == "admin")
                    lnkAdmin.Visible = true;
                else
                    lnkAdmin.Visible = false;
            }
        }

        // ===== CART COUNT =====
        void LoadCartCount()
        {
            if (Session["cart"] == null)
            {
                lblCartCount.Text = "";
                return;
            }

            List<CartItem> cart = (List<CartItem>)Session["cart"];

            int total = 0;
            foreach (CartItem item in cart)
            {
                total += item.SoLuong;
            }

            lblCartCount.Text = total.ToString();
        }

        // ===== ADD TO CART =====
        protected void dlSanPham_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "addCart")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                List<CartItem> cart;

                if (Session["cart"] == null)
                    cart = new List<CartItem>();
                else
                    cart = (List<CartItem>)Session["cart"];

                bool found = false;

                foreach (CartItem item in cart)
                {
                    if (item.MaSP == id)
                    {
                        item.SoLuong++;
                        found = true;
                        break;
                    }
                }

                if (!found)
                {
                    ketnoi kn = new ketnoi();
                    DataTable dt = kn.getData("SELECT * FROM SanPham WHERE MaSP=" + id);

                    if (dt.Rows.Count > 0)
                    {
                        CartItem sp = new CartItem();

                        sp.MaSP = id;
                        sp.TenSP = dt.Rows[0]["TenSP"].ToString();
                        sp.Gia = Convert.ToInt32(dt.Rows[0]["Gia"]);
                        sp.SoLuong = 1;
                        sp.HinhAnh = dt.Rows[0]["HinhAnh"].ToString();

                        cart.Add(sp);
                    }
                }

                Session["cart"] = cart;

                
                string loai = Request.QueryString["loai"];
                string search = Request.QueryString["search"];

                string url = "Default.aspx";

                if (!string.IsNullOrEmpty(loai) || !string.IsNullOrEmpty(search))
                {
                    url += "?";

                    if (!string.IsNullOrEmpty(loai))
                        url += "loai=" + loai + "&";

                    if (!string.IsNullOrEmpty(search))
                        url += "search=" + search;
                }

                Response.Redirect(url);
            }
        }
    }
}