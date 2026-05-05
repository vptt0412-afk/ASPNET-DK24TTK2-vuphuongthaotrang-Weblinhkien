using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebLinhKien_Trangvpt
{
    public partial class QLSanPham : Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // CHẶN USER KHÔNG PHẢI ADMIN
            if (Session["role"] == null || Session["role"].ToString() != "admin")
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                LoadData();
            }
        }

        // ================= LOAD =================
        void LoadData()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT * FROM SanPham";
                SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvSP.DataSource = dt;
                gvSP.DataBind();
            }
        }

        // ================= THÊM =================
        protected void btnThem_Click(object sender, EventArgs e)
        {
            string ten = txtTen.Text.Trim();
            string gia = txtGia.Text.Trim();
            string loai = txtLoai.Text.Trim();
            string thuocTinh = txtThuocTinh.Text.Trim();

            // validate
            if (ten == "" || gia == "")
            {
                return;
            }

            int giaInt;
            if (!int.TryParse(gia, out giaInt))
            {
                return;
            }

            string tenFile = "";

            
            if (fileHinh.HasFile)
            {
                tenFile = Guid.NewGuid().ToString() + "_" + fileHinh.FileName;
                fileHinh.SaveAs(Server.MapPath("~/image/") + tenFile);
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"INSERT INTO SanPham(TenSP, Gia, Loai, ThuocTinh, HinhAnh)
                               VALUES (@ten, @gia, @loai, @tt, @hinh)";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@ten", ten);
                cmd.Parameters.AddWithValue("@gia", giaInt);
                cmd.Parameters.AddWithValue("@loai", loai);
                cmd.Parameters.AddWithValue("@tt", thuocTinh);
                cmd.Parameters.AddWithValue("@hinh", tenFile);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            // reset
            txtTen.Text = "";
            txtGia.Text = "";
            txtLoai.Text = "";
            txtThuocTinh.Text = "";

            LoadData();
        }

        // ================= XOÁ =================
        protected void gvSP_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvSP.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "DELETE FROM SanPham WHERE MaSP=@id";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@id", id);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            LoadData();
        }

        // ================= EDIT =================
        protected void gvSP_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvSP.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void gvSP_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvSP.EditIndex = -1;
            LoadData();
        }

        // ================= UPDATE =================
        protected void gvSP_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvSP.DataKeys[e.RowIndex].Value);

            string ten = ((TextBox)gvSP.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string gia = ((TextBox)gvSP.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string loai = ((TextBox)gvSP.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string thuocTinh = ((TextBox)gvSP.Rows[e.RowIndex].Cells[4].Controls[0]).Text;

            int giaInt;
            if (!int.TryParse(gia, out giaInt))
            {
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"UPDATE SanPham 
                               SET TenSP=@ten, Gia=@gia, Loai=@loai, ThuocTinh=@tt 
                               WHERE MaSP=@id";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@ten", ten);
                cmd.Parameters.AddWithValue("@gia", giaInt);
                cmd.Parameters.AddWithValue("@loai", loai);
                cmd.Parameters.AddWithValue("@tt", thuocTinh);
                cmd.Parameters.AddWithValue("@id", id);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            gvSP.EditIndex = -1;
            LoadData();
        }

        // ================= QUAY LẠI =================
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}