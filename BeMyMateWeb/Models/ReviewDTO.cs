using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BeMyMateWeb.Models
{
    public class ReviewDTO
    {
        public int ReviewId { get; set; }

        public string ReviewText { get; set; }

        public DateTime Date { get; set; }

        public bool IsEditVisible { get; set; }

        public bool IsDeleteVisible { get; set; }

        public bool IsReportVisible { get; set; }

        public IEnumerable<AreaDTO> Areas { get; set; }
    }
}