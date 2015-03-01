using BeMyMateWeb.App_Code;
using BeMyMateWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Data.Entity;

namespace BeMyMateWeb.Controllers
{
    public class ReviewsController : ApiController
    {
        #region Variables

        BeMyMateDBEntities _db = new BeMyMateDBEntities();
        private int _userId = 1;

        #endregion

        #region Reviews

        // Note Get Reviews
        [ActionName("Reviews")]
        public IEnumerable<ReviewDTO> GetReviews([FromUri] string languageCode)
        {
            return DataManager.GetReviews(_userId, languageCode);
        }

        // Note Put Reviews
        [ActionName("Reviews")]
        public IEnumerable<ReviewDTO> PutReviews(ReviewDTO review)
        {
            return DataManager.PutReviews(review);
        }

        // Note Post Reviews
        [ActionName("Reviews")]
        public IEnumerable<ReviewDTO> PostReviews(ReviewDTO review)
        {
            return DataManager.PostReviews(review);
        }

        // Note Delete Reviews
        [ActionName("Reviews")]
        public IEnumerable<ReviewDTO> DeleteReviews(ReviewDTO review)
        {
            return DataManager.DeleteReviews(review);
        }

        #endregion
    }
}
