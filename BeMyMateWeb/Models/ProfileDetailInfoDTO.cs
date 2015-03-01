using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BeMyMateWeb.Models
{
    public class ProfileDetailInfoDTO
    {
        public int AreaId { get; set; }

        public string AreaName { get; set; }

        public IEnumerable<QuestionnaireAnswerDTO> QuestionnaireAnswers { get; set; }
    }
}