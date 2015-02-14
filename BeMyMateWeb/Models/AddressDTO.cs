using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BeMyMateWeb.Models
{
    public class AddressDTO
    {
        public string Line { get; set; }

        public string City { get; set; }

        public string PostaCode { get; set; }

        public string Province { get; set; }

        public string Country { get; set; }

        public string Type { get; set; }
    }
}