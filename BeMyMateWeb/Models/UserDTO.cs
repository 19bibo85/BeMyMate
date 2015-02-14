using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BeMyMateWeb.Models
{
    public class UserDTO
    {
        public int Id { get; set; }

        public Guid Guid { get; set; }

        public string Name { get; set; }

        public string MiddleName { get; set; }

        public string Surname { get; set; }

        public string FullName 
        {
            get 
            {
                return Name + " " + MiddleName + " " + Surname;
            } 
        }

        public string Email { get; set; }

        public int StatusId { get; set; }

        public string StatusName { get; set; }

        public int AvatarId { get; set; }

        public string AvatarName { get; set; }

        public string AvatarPath { get; set; }
    }
}