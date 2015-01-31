//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BeMyMateWeb.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ObjectContext
    {
        public ObjectContext()
        {
            this.Menus = new HashSet<Menu>();
            this.MenuItems = new HashSet<MenuItem>();
            this.Sections = new HashSet<Section>();
        }
    
        public int id { get; set; }
        public bool anonymous { get; set; }
        public bool tennant { get; set; }
        public bool landlord { get; set; }
        public bool agency { get; set; }
        public System.DateTime dtCreated { get; set; }
        public Nullable<System.DateTime> dtUpdated { get; set; }
        public Nullable<System.DateTime> dtDeleted { get; set; }
    
        public virtual ICollection<Menu> Menus { get; set; }
        public virtual ICollection<MenuItem> MenuItems { get; set; }
        public virtual ICollection<Section> Sections { get; set; }
    }
}
