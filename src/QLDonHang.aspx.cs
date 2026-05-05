using System;
using System.Data;

namespace WebLinhKien_Trangvpt
{
    public partial class QLDonHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // CHỈ ADMIN MỚI XEM
            if (Session["role"] == null || Session["role"].ToString() != "admin")
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                LoadDonHang();
            }
        }

        void LoadDonHang()
        {
            ketnoi kn = new ketnoi();
            DataTable dt = kn.getData("SELECT * FROM DonHang ORDER BY Ngay DESC");

            gvDonHang.DataSource = dt;
            gvDonHang.DataBind();
        }
    }
}