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
    
    public partial class GetSectionMenuItem_Result
    {
        public int SectionId { get; set; }
        public string SectionName { get; set; }
        public string SecionDesc { get; set; }
        public int SectionLevel { get; set; }
        public int MenuId { get; set; }
        public string MenuName { get; set; }
        public string MenuDesc { get; set; }
        public string MenuLink { get; set; }
        public Nullable<int> ItemId { get; set; }
        public string ItemName { get; set; }
        public string ItemDesc { get; set; }
        public string Icon { get; set; }
        public string Link { get; set; }
        public Nullable<bool> Active { get; set; }
        public Nullable<int> ParentId { get; set; }
    }
}