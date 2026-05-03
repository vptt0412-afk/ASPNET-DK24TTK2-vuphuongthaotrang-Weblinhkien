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

        void LoadChiTiet()
        {
            string id = Request.QueryString["id"];

            if (string.IsNullOrEmpty(id))
            {
                Response.Redirect("Default.aspx");
                return;
            }

            ketnoi kn = new ketnoi();
            DataTable dt = kn.getData("SELECT * FROM SanPham WHERE MaSP=" + id);

            if (dt.Rows.Count == 0)
            {
                Response.Redirect("Default.aspx");
                return;
            }

            DataRow row = dt.Rows[0];

            lblTen.Text = row["TenSP"].ToString();
            lblGia.Text = String.Format("{0:N0}", row["Gia"]) + " VND";
            lblLoai.Text = row["Loai"].ToString();
            lblMoTa.Text = row["ThuocTinh"].ToString();

            string img = row["HinhAnh"].ToString();
            imgSP.ImageUrl = string.IsNullOrEmpty(img) ? "image/no-image.png" : "image/" + img;
        }
    }
}