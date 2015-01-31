using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BeMyMateWeb.Models
{
    public class MenuDTO
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public List<MenuItemDTO> Items { get; set; }

    }
}