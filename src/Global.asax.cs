using System;
using System.Web;
using System.Web.Routing;
using System.Web.SessionState;

namespace WebLinhKien_Trangvpt
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Route 
            RouteConfig.RegisterRoutes(RouteTable.Routes);

        }
    }
}