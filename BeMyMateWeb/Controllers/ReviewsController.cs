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
    public class ReviewsController : ApiController
    {
        private int _userId = 1;

        #region Reviews

        // Note Reviews JSON
        [ActionName("Reviews")]
        public IEnumerable<ReviewDTO> GetReviews([FromUri] string languageCode)
        {
            return DataManager.GetReviews(_userId, languageCode);
        }

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
