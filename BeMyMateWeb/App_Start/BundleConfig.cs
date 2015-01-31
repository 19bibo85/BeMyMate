using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace BeMyMateWeb.App_Start
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            #region JS / SCRIPT

            bundles.Add(new ScriptBundle("~/bundle/jQuery").Include(
                "~/Scripts/jquery-2.1.3.js",
                "~/Scripts/jquery-2.1.3.intellisense.js",
                "~/Scripts/bootstrap.js"
                ));

            #endregion

            #region CSS / Style

            bundles.Add(new ScriptBundle("~/bundle/BootstrapCss").Include(
               "~/Content/bootstrap.min.css",
               "~/Content/bootstrap-theme.min.css"
               ));

            #endregion
        }
    }
}