using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BeMyMateWeb.Models
{
    public class ProfileDetailInfoDTO
    {
        public string AreaName { get; set; }

        public List<QuestionnaireAnswerDTO> QuestionnaireAnswers { get; set; }
    }
}