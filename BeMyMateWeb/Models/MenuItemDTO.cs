using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BeMyMateWeb.Models
{
    public class MenuItemDTO
    {
        public int? Id { get; set; }

        public int? ParentId { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public string Icon { get; set; }

        public string Link { get; set; }

        public bool? IsActive { get; set; }
    }
}