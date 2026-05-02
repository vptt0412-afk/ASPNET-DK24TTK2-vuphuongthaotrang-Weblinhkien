using System;
using System.Data;
using System.Web.UI;

namespace WebLinhKien_Trangvpt
{
    public partial class ChiTiet : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadChiTiet();
            }
        }

        // ===== LOAD CHI TIẾT =====
        void LoadChiTiet()
        {
            string id = Request.QueryString["id"];

            // không có id → quay về trang chủ
            if (string.IsNullOrEmpty(id))
            {
                Response.Redirect("Default.aspx");
                return;
            }

            ketnoi kn = new ketnoi();

            string sql = "SELECT * FROM SanPham WHERE MaSP = " + id;

            DataTable dt = kn.getData(sql);

            // không có dữ liệu → quay về
            if (dt.Rows.Count == 0)
            {
                Response.Redirect("Default.aspx");
                return;
            }

            // gán dữ liệu
            lblTen.Text = dt.Rows[0]["TenSP"].ToString();
            lblGia.Text = String.Format("{0:N0}", dt.Rows[0]["Gia"]) + " VND";
            lblLoai.Text = dt.Rows[0]["Loai"].ToString();
            lblMoTa.Text = dt.Rows[0]["ThuocTinh"].ToString();

            // ảnh (có fallback)
            string img = dt.Rows[0]["HinhAnh"].ToString();

            if (!string.IsNullOrEmpty(img))
                imgSP.ImageUrl = "image/" + img;
            else
                imgSP.ImageUrl = "image/no-image.png";
        }
    }
}