﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class BeMyMateDBEntities : DbContext
    {
        public BeMyMateDBEntities()
            : base("name=BeMyMateDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Language> Languages { get; set; }
        public virtual DbSet<Localization> Localizations { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<MenuItem> MenuItems { get; set; }
        public virtual DbSet<MenuToMenuItem> MenuToMenuItems { get; set; }
        public virtual DbSet<ObjectContext> ObjectContexts { get; set; }
        public virtual DbSet<Section> Sections { get; set; }
        public virtual DbSet<SectionToMenu> SectionToMenus { get; set; }
        public virtual DbSet<Table> Tables { get; set; }
        public virtual DbSet<C__RefactorLog> C__RefactorLog { get; set; }
        public virtual DbSet<Group> Groups { get; set; }
        public virtual DbSet<GroupObject> GroupObjects { get; set; }
        public virtual DbSet<GroupToRole> GroupToRoles { get; set; }
        public virtual DbSet<Object> Objects { get; set; }
        public virtual DbSet<ObjectGroupObject> ObjectGroupObjects { get; set; }
        public virtual DbSet<ObjectRight> ObjectRights { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<RoleGroupObjectRight> RoleGroupObjectRights { get; set; }
        public virtual DbSet<RoleToUser> RoleToUsers { get; set; }
        public virtual DbSet<Address> Addresses { get; set; }
        public virtual DbSet<AddressType> AddressTypes { get; set; }
        public virtual DbSet<Avatar> Avatars { get; set; }
        public virtual DbSet<Country> Countries { get; set; }
        public virtual DbSet<File> Files { get; set; }
        public virtual DbSet<FileApp> FileApps { get; set; }
        public virtual DbSet<FileInfo> FileInfoes { get; set; }
        public virtual DbSet<FriendshipStatu> FriendshipStatus { get; set; }
        public virtual DbSet<Gender> Genders { get; set; }
        public virtual DbSet<Job> Jobs { get; set; }
        public virtual DbSet<Message> Messages { get; set; }
        public virtual DbSet<MessageToFile> MessageToFiles { get; set; }
        public virtual DbSet<Nationality> Nationalities { get; set; }
        public virtual DbSet<Notification> Notifications { get; set; }
        public virtual DbSet<NotificationType> NotificationTypes { get; set; }
        public virtual DbSet<Phone> Phones { get; set; }
        public virtual DbSet<PhoneType> PhoneTypes { get; set; }
        public virtual DbSet<ProfileAnswer> ProfileAnswers { get; set; }
        public virtual DbSet<ProfileArea> ProfileAreas { get; set; }
        public virtual DbSet<ProfileQuestionnaire> ProfileQuestionnaires { get; set; }
        public virtual DbSet<ProfileQuestionnaireToAnswer> ProfileQuestionnaireToAnswers { get; set; }
        public virtual DbSet<Province> Provinces { get; set; }
        public virtual DbSet<Review> Reviews { get; set; }
        public virtual DbSet<SettingAnswer> SettingAnswers { get; set; }
        public virtual DbSet<SettingArea> SettingAreas { get; set; }
        public virtual DbSet<SettingQuestionnaire> SettingQuestionnaires { get; set; }
        public virtual DbSet<SettingQuestionnaireToAnswer> SettingQuestionnaireToAnswers { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserLog> UserLogs { get; set; }
        public virtual DbSet<UserProfileInfo> UserProfileInfoes { get; set; }
        public virtual DbSet<UserRegistrationStatu> UserRegistrationStatus { get; set; }
        public virtual DbSet<UserSettingInfo> UserSettingInfoes { get; set; }
        public virtual DbSet<UserStatu> UserStatus { get; set; }
        public virtual DbSet<UserToAddress> UserToAddresses { get; set; }
        public virtual DbSet<UserToFriend> UserToFriends { get; set; }
        public virtual DbSet<UserToJob> UserToJobs { get; set; }
        public virtual DbSet<UserToLanguage> UserToLanguages { get; set; }
        public virtual DbSet<UserToMessage> UserToMessages { get; set; }
        public virtual DbSet<UserToNationality> UserToNationalities { get; set; }
        public virtual DbSet<UserToNotification> UserToNotifications { get; set; }
        public virtual DbSet<UserToPhone> UserToPhones { get; set; }
    
        public virtual ObjectResult<GetUserSecurity_Result> GetUserSecurity(Nullable<System.Guid> userGuid, Nullable<int> userID)
        {
            var userGuidParameter = userGuid.HasValue ?
                new ObjectParameter("UserGuid", userGuid) :
                new ObjectParameter("UserGuid", typeof(System.Guid));
    
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetUserSecurity_Result>("GetUserSecurity", userGuidParameter, userIDParameter);
        }
    
        public virtual int SetUserSecurity(Nullable<int> userId, Nullable<int> groupId)
        {
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("userId", userId) :
                new ObjectParameter("userId", typeof(int));
    
            var groupIdParameter = groupId.HasValue ?
                new ObjectParameter("groupId", groupId) :
                new ObjectParameter("groupId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SetUserSecurity", userIdParameter, groupIdParameter);
        }
    
        public virtual ObjectResult<GetFriends_Result> GetFriends(Nullable<int> userID, string languageCode)
        {
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            var languageCodeParameter = languageCode != null ?
                new ObjectParameter("LanguageCode", languageCode) :
                new ObjectParameter("LanguageCode", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetFriends_Result>("GetFriends", userIDParameter, languageCodeParameter);
        }
    
        public virtual ObjectResult<GetMessageInbox_Result> GetMessageInbox(Nullable<System.Guid> messageGuid, Nullable<int> userID)
        {
            var messageGuidParameter = messageGuid.HasValue ?
                new ObjectParameter("MessageGuid", messageGuid) :
                new ObjectParameter("MessageGuid", typeof(System.Guid));
    
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetMessageInbox_Result>("GetMessageInbox", messageGuidParameter, userIDParameter);
        }
    
        public virtual ObjectResult<GetMessageOutbox_Result> GetMessageOutbox(Nullable<System.Guid> messageGuid, Nullable<int> userID)
        {
            var messageGuidParameter = messageGuid.HasValue ?
                new ObjectParameter("MessageGuid", messageGuid) :
                new ObjectParameter("MessageGuid", typeof(System.Guid));
    
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetMessageOutbox_Result>("GetMessageOutbox", messageGuidParameter, userIDParameter);
        }
    
        public virtual ObjectResult<GetMessagesInbox_Result> GetMessagesInbox(Nullable<int> userID)
        {
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetMessagesInbox_Result>("GetMessagesInbox", userIDParameter);
        }
    
        public virtual ObjectResult<GetMessagesOutbox_Result> GetMessagesOutbox(Nullable<int> userID)
        {
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetMessagesOutbox_Result>("GetMessagesOutbox", userIDParameter);
        }
    
        public virtual ObjectResult<GetProfileDetailInfo_Result> GetProfileDetailInfo(Nullable<int> userID, Nullable<System.Guid> userGuid, string languageCode)
        {
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            var userGuidParameter = userGuid.HasValue ?
                new ObjectParameter("UserGuid", userGuid) :
                new ObjectParameter("UserGuid", typeof(System.Guid));
    
            var languageCodeParameter = languageCode != null ?
                new ObjectParameter("LanguageCode", languageCode) :
                new ObjectParameter("LanguageCode", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetProfileDetailInfo_Result>("GetProfileDetailInfo", userIDParameter, userGuidParameter, languageCodeParameter);
        }
    
        public virtual ObjectResult<GetProfileQuestionnaireAnswer_Result> GetProfileQuestionnaireAnswer(Nullable<int> userID, string languageCode)
        {
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            var languageCodeParameter = languageCode != null ?
                new ObjectParameter("LanguageCode", languageCode) :
                new ObjectParameter("LanguageCode", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetProfileQuestionnaireAnswer_Result>("GetProfileQuestionnaireAnswer", userIDParameter, languageCodeParameter);
        }
    
        public virtual ObjectResult<GetSettingInfo_Result> GetSettingInfo(Nullable<int> userID, string languageCode)
        {
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            var languageCodeParameter = languageCode != null ?
                new ObjectParameter("LanguageCode", languageCode) :
                new ObjectParameter("LanguageCode", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetSettingInfo_Result>("GetSettingInfo", userIDParameter, languageCodeParameter);
        }
    
        public virtual ObjectResult<GetSettingQuestionnaireAnswer_Result> GetSettingQuestionnaireAnswer(Nullable<int> userID, string languageCode)
        {
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            var languageCodeParameter = languageCode != null ?
                new ObjectParameter("LanguageCode", languageCode) :
                new ObjectParameter("LanguageCode", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetSettingQuestionnaireAnswer_Result>("GetSettingQuestionnaireAnswer", userIDParameter, languageCodeParameter);
        }
    
        public virtual int SetUserPrivacy(Nullable<int> userId)
        {
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("userId", userId) :
                new ObjectParameter("userId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SetUserPrivacy", userIdParameter);
        }
    
        public virtual ObjectResult<GetNotifications_Result> GetNotifications(Nullable<int> userID, string languageCode)
        {
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            var languageCodeParameter = languageCode != null ?
                new ObjectParameter("LanguageCode", languageCode) :
                new ObjectParameter("LanguageCode", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetNotifications_Result>("GetNotifications", userIDParameter, languageCodeParameter);
        }
    
        public virtual ObjectResult<GetSectionMenuItem_Result> GetSectionMenuItem(Nullable<int> userID, string languageCode)
        {
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            var languageCodeParameter = languageCode != null ?
                new ObjectParameter("LanguageCode", languageCode) :
                new ObjectParameter("LanguageCode", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetSectionMenuItem_Result>("GetSectionMenuItem", userIDParameter, languageCodeParameter);
        }
    
        public virtual ObjectResult<GetProfileBasicInfo_Result> GetProfileBasicInfo(Nullable<int> userID, Nullable<System.Guid> userGuid, string languageCode)
        {
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            var userGuidParameter = userGuid.HasValue ?
                new ObjectParameter("UserGuid", userGuid) :
                new ObjectParameter("UserGuid", typeof(System.Guid));
    
            var languageCodeParameter = languageCode != null ?
                new ObjectParameter("LanguageCode", languageCode) :
                new ObjectParameter("LanguageCode", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetProfileBasicInfo_Result>("GetProfileBasicInfo", userIDParameter, userGuidParameter, languageCodeParameter);
        }
    }
}
