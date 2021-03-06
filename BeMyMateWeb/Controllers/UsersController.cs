﻿using BeMyMateWeb.App_Code;
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
        public IHttpActionResult GetProfileBasicInfo([FromUri] string languageCode)
        {
            var profileBasicInfo = DataManager.GetProfileBasicInfo(_userId, languageCode);
            if (profileBasicInfo == null)
            {
                return NotFound();
            }
            return Ok(profileBasicInfo);
        }

        // Note Users JSON
        [ActionName("ProfileDetailInfos")]
        public IEnumerable<ProfileDetailInfoDTO> GetProfileDetailInfos([FromUri] string languageCode)
        {
            return DataManager.GetProfileDetailInfos(_userId, languageCode);
        }

        // Note Chart JSON
        [ActionName("ProfileChartArea")]
        public IEnumerable<ProfileChartAreaDTO> GetProfileChartArea([FromUri] string languageCode)
        {
            return DataManager.GetProfileChartArea(_userId, languageCode);
        }

        #endregion
    }
}