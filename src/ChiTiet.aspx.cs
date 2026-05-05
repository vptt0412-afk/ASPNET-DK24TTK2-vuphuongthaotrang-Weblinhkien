using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;

namespace WebLinhKien_Trangvpt
{
    public partial class ChiTiet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSP();
            }

            LoadHeader();
        }

        //  LOAD SẢN PHẨM
        void LoadSP()
        {
            int id;

          
            if (!int.TryParse(Request.QueryString["id"], out id))
                return;

            string connStr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT * FROM SanPham WHERE MaSP=@id";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@id", id);

                conn.Open();
                SqlDataReader r = cmd.ExecuteReader();

                if (r.Read())
                {
                    lblTen.Text = r["TenSP"].ToString();

                    
                    int gia = Convert.ToInt32(r["Gia"]);
                    lblGia.Text = String.Format(new CultureInfo("vi-VN"), "{0:N0}", gia) + " VND";

                    lblLoai.Text = r["Loai"].ToString();
                    lblThuocTinh.Text = r["ThuocTinh"].ToString();

                   
                    imgSP.ImageUrl = "image/" + r["HinhAnh"].ToString();

              
                    ViewState["HinhAnh"] = r["HinhAnh"].ToString();
                    ViewState["Gia"] = gia;
                }

                r.Close();
            }
        }

        void LoadHeader()
        {
            if (Session["user"] != null)
            {
                lblUser.Text = "Xin chào: " + Session["user"].ToString();
            }
            else
            {
                lblUser.Text = "";
            }

            if (Session["cart"] != null)
            {
                List<CartItem> cart = (List<CartItem>)Session["cart"];

                int count = 0;
                foreach (CartItem item in cart)
                {
                    count += item.SoLuong;
                }

                lblCartCount.Text = count.ToString();
            }
            else
            {
                lblCartCount.Text = "0";
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            int sl;

            //  
            if (!int.TryParse(txtSL.Text, out sl) || sl <= 0)
                sl = 1;

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
                    item.SoLuong += sl;
                    found = true;
                    break;
                }
            }

            if (!found)
            {
                cart.Add(new CartItem
                {
                    MaSP = id,
                    TenSP = lblTen.Text,

                    
                    Gia = (int)ViewState["Gia"],

                    SoLuong = sl,

                    HinhAnh = ViewState["HinhAnh"].ToString()
                });
            }

            Session["cart"] = cart;

            
            LoadHeader();
        }
    }
}