using BeMyMateWeb.Models.Bases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BeMyMateWeb.Models
{
    public class UserDTO : UserBase
    {
        public int Id { get; set; }

        public Guid Guid { get; set; }

        public string Email { get; set; }

        public int StatusId { get; set; }

        public string StatusName { get; set; }

        public int AvatarId { get; set; }

        public string AvatarName { get; set; }

        public string AvatarPath { get; set; }
    }
}