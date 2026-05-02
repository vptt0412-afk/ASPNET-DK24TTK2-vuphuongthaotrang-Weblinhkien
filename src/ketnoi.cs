using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public class ketnoi
{
    SqlConnection conn;

    public ketnoi()
    {
        string str = WebConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        conn = new SqlConnection(str);
    }

    public DataTable getData(string sql)
    {
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
}