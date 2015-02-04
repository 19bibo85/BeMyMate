using BeMyMateWeb.App_Code;
using BeMyMateWeb.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace BeMyMateWeb.Controllers
{
    public class UsersController : ApiController
    {
        private int _userId = 1;

        #region Profile

        // Note Users JSON
        [ActionName("ProfileBasicInfo")]
        public string GetProfileBasicInfo([FromUri] string languageCode)
        {
            return JsonConvert.SerializeObject(CommonQuery.GetProfileBasicInfo(_userId, languageCode));
        }

        // Note Users JSON
        [ActionName("ProfileDetailInfos")]
        public string GetProfileDetailInfos([FromUri] string languageCode)
        {
            return JsonConvert.SerializeObject(CommonQuery.GetProfileDetailInfos(_userId, languageCode));
        }

        #endregion
    }
}