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
    
    public partial class GetMessagesOutbox_Result
    {
        public int userId { get; set; }
        public string userName { get; set; }
        public string surname { get; set; }
        public string email { get; set; }
        public int messageId { get; set; }
        public System.Guid guid { get; set; }
        public string subject { get; set; }
        public string body { get; set; }
        public Nullable<int> fileId { get; set; }
        public string name { get; set; }
        public string path { get; set; }
        public string extension { get; set; }
    }
}
