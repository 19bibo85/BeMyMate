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
    
    public partial class PhoneType
    {
        public PhoneType()
        {
            this.Phones = new HashSet<Phone>();
        }
    
        public int id { get; set; }
        public string refCode { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public System.DateTime dtCreated { get; set; }
        public Nullable<System.DateTime> dtUpdated { get; set; }
    
        public virtual ICollection<Phone> Phones { get; set; }
    }
}
