using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BeMyMateWeb.Models
{
    public class SectionDTO
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public int Level { get; set; }

        public List<MenuDTO> Menus { get; set; }
    }
}