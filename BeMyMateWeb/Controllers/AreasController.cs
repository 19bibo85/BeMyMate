using BeMyMateWeb.App_Code;
using BeMyMateWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BeMyMateWeb.Controllers
{
    public class AreasController : ApiController
    {
        #region Variables

        BeMyMateDBEntities _db = new BeMyMateDBEntities();
        private int _userId = 1;

        #endregion

        #region Areas

        // Note Areas JSON
        [ActionName("Areas")]
        public IEnumerable<AreaDTO> GetAreas([FromUri] string languageCode)
        {
            return DataManager.GetAreas(languageCode);
        }

        #endregion
    }
}
