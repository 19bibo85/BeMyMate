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
using System.Web.Http.Results;

namespace BeMyMateWeb.Controllers
{
    public class UsersController : ApiController
    {
        private int _userId = 1;

        #region Profile

        // Note Users JSON
        [ActionName("ProfileBasicInfo")]
        public ProfileBasicInfoDTO GetProfileBasicInfo([FromUri] string languageCode)
        {   
            return DataManager.GetProfileBasicInfo(_userId, languageCode);
        }

        // Note Users JSON
        [ActionName("ProfileDetailInfos")]
        public JsonResult<List<ProfileDetailInfoDTO>> GetProfileDetailInfos([FromUri] string languageCode)
        {
            return this.Json(DataManager.GetProfileDetailInfos(_userId, languageCode));
        }

        // Note Chart JSON
        [ActionName("ProfileChartArea")]
        public JsonResult<List<ProfileChartAreaDTO>> GetProfileChartArea([FromUri] string languageCode)
        {
            return this.Json(DataManager.GetProfileChartArea(_userId, languageCode));
            //return JsonConvert.SerializeObject(DataManager.GetProfileChartArea(_userId, languageCode));
        }

        #endregion
    }
}