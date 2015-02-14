using BeMyMateWeb.App_Code;
using BeMyMateWeb.App_Start;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Optimization;
using System.Web.Routing;

namespace BeMyMateWeb
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            BundleTable.EnableOptimizations = true;

            GlobalConfiguration.Configure(config =>
            {
                ODataConfig.Register(config); //this has to be before WebApi
                WebApiConfig.Register(config);

            });
        }
    }
}
