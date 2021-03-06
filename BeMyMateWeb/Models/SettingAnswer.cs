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
    
    public partial class SettingAnswer
    {
        public SettingAnswer()
        {
            this.SettingQuestionnaireToAnswers = new HashSet<SettingQuestionnaireToAnswer>();
            this.UserSettingInfoes = new HashSet<UserSettingInfo>();
        }
    
        public int id { get; set; }
        public string refCode { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public int objectId { get; set; }
        public int contextId { get; set; }
        public bool isDefault { get; set; }
        public System.DateTime dtCreated { get; set; }
        public Nullable<System.DateTime> dtUpdated { get; set; }
        public Nullable<System.DateTime> dtDeleted { get; set; }
    
        public virtual Object Object { get; set; }
        public virtual ICollection<SettingQuestionnaireToAnswer> SettingQuestionnaireToAnswers { get; set; }
        public virtual ICollection<UserSettingInfo> UserSettingInfoes { get; set; }
    }
}
