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
    
    public partial class Notification
    {
        public Notification()
        {
            this.UserToNotifications = new HashSet<UserToNotification>();
        }
    
        public int id { get; set; }
        public int senderId { get; set; }
        public int typeId { get; set; }
        public System.Guid guid { get; set; }
        public System.DateTime dtCreated { get; set; }
        public Nullable<System.DateTime> dtUpdated { get; set; }
        public Nullable<System.DateTime> dtChecked { get; set; }
        public Nullable<System.DateTime> dtDeleted { get; set; }
    
        public virtual User User { get; set; }
        public virtual NotificationType NotificationType { get; set; }
        public virtual ICollection<UserToNotification> UserToNotifications { get; set; }
    }
}