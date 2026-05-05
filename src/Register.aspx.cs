using System;
using System.Data.SqlClient;
using System.Configuration;

namespace WebLinhKien_Trangvpt
{
    public partial class Register : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPass.Text.Trim();

            //  CHECK RỖNG
            if (username == "" || password == "")
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Vui lòng nhập đầy đủ thông tin!";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                //  CHECK TRÙNG USER
                string check = "SELECT COUNT(*) FROM Users WHERE Username=@u";
                using (SqlCommand cmdCheck = new SqlCommand(check, conn))
                {
                    cmdCheck.Parameters.AddWithValue("@u", username);

                    int count = (int)cmdCheck.ExecuteScalar();

                    if (count > 0)
                    {
                        lblMsg.ForeColor = System.Drawing.Color.Red;
                        lblMsg.Text = "Tài khoản đã tồn tại!";
                        return;
                    }
                }

                //  INSERT USER
                string sql = "INSERT INTO Users(Username, Password, Role) VALUES(@u, @p, 'user')";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@u", username);
                    cmd.Parameters.AddWithValue("@p", password);

                    cmd.ExecuteNonQuery();
                }

                //  AUTO LOGIN
                Session["user"] = username;   // ✅ sửa chỗ này
                Session["role"] = "user";

                
                Response.Redirect("Default.aspx");
            }
        }
    }
}