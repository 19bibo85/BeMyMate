using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BeMyMateWeb.Models.Bases
{
    public class UserBase
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string MiddleName { get; set; }

        public string Surname { get; set; }

        public string  FullName 
        {
            get 
            {
                return MiddleName != String.Empty ? (Name + " " + MiddleName + " " + Surname) : (Name + " " + Surname);
            }
        }

        public string Email { get; set; }
    }
}