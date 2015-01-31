using BeMyMateWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.OData.Builder;
using System.Web.Http.OData.Extensions;

namespace BeMyMateWeb
{
    public static class ODataConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services
            // Web API routes
            config.MapHttpAttributeRoutes();

            ODataModelBuilder modelBuilder = new ODataConventionModelBuilder();
            modelBuilder.EntitySet<UserDTO>("UserDTO");

            config.Routes.MapODataServiceRoute(
                routeName: "odata",
                routePrefix: "odata",
                model: modelBuilder.GetEdmModel()
                );
        }
    }
}
