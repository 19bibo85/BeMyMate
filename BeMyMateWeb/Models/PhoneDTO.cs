using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BeMyMateWeb.Models
{
    public class PhoneDTO
    {
        public string Prefix { get; set; }

        public string Number { get; set; }

        public string Phone 
        {
            get 
            {
                return Prefix + " " + Number;
            }
        }

        public string Type { get; set; }
    }
}