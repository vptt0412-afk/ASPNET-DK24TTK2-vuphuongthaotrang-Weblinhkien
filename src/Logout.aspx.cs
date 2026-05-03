using System;

namespace WebLinhKien_Trangvpt
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();   // xoá session
            Session.Abandon();

            Response.Redirect("Default.aspx"); // về trang chủ
        }
    }
}