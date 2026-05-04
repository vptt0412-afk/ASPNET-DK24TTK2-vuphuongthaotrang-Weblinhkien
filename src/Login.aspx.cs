using System;
using System.Data.SqlClient;
using System.Configuration;

namespace WebLinhKien_Trangvpt
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMsg.Text = "";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPass.Text.Trim();

            if (username == "" || password == "")
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Vui lòng nhập đầy đủ tài khoản và mật khẩu!";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT Username, Role FROM Users WHERE Username=@u AND Password=@p";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@u", username);
                    cmd.Parameters.AddWithValue("@p", password);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                       
                        Session["user"] = reader["Username"].ToString();
                        Session["role"] = reader["Role"].ToString();

                       

                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        lblMsg.ForeColor = System.Drawing.Color.Red;
                        lblMsg.Text = "❌ Sai tài khoản hoặc mật khẩu!";
                    }

                    reader.Close();
                }
            }
        }
    }
}