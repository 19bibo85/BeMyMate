using BeMyMateWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace BeMyMateWeb.App_Code
{
    public class CommonQuery
    {
        #region Menu

        // Note query to retrieve menus
        public static List<MenuDTO> GetMenus(int userId, int sectionId, string languageCode)
        {
            List<MenuDTO> menus = new List<MenuDTO>();
            using(var ent = new BeMyMateDBEntities())            
            {   
                menus =  ent.GetSectionMenuItem(userId, languageCode)
                        .Where(w => w.SectionId == sectionId)
                        .GroupBy(g => new { g.MenuId, g.MenuName, g.MenuDesc })
                        .AsEnumerable()
                        .Select(s => new MenuDTO
                        {
                            Id = s.Key.MenuId,
                            Name = s.Key.MenuName,
                            Description = s.Key.MenuDesc,
                            Items = s.Select(sItem => new MenuItemDTO
                            {
                                Id = sItem.ItemId,
                                ParentId = sItem.ParentId,
                                Name = sItem.ItemName,
                                Description = sItem.ItemDesc,
                                Icon = sItem.Icon,
                                Link = sItem.Link,
                                IsActive = sItem.Active
                            }).ToList()
                        }).ToList();
            }
            return menus;
        }
    
        // Note query to retrieve menu
        public static MenuDTO GetMenu(int userId, int sectionId, int menuId, string languageCode)
        {
            MenuDTO menu = GetMenus(userId, sectionId, languageCode).FirstOrDefault(w => w.Id == menuId);
            return menu;
        }

        #endregion

        #region User

        // Note query to retrieve users
        public static List<UserDTO> GetUsers
        {
            get
            {
                List<UserDTO> users = new List<UserDTO>();
                using (var ent = new BeMyMateDBEntities())
                {
                    users = (from user in ent.Users
                             join status in ent.UserStatus on user.statusId equals status.id
                             join avatar in ent.Avatars on user.avatarId equals avatar.id
                             select new
                             {
                                Id = user.id,
                                Guid = user.guid,
                                Name = user.name,
                                MiddleName = user.middleName,
                                Surname = user.surname,
                                Email = user.email,
                                StatusId = status.id,
                                StatusName = status.name,
                                AvatarId = avatar.id,
                                AvatarName = avatar.name
                             })
                             .Select(s => new UserDTO
                             {
                                Id = s.Id,
                                Guid = s.Guid, 
                                Name = s.Name,
                                Surname = s.Surname,
                                FullName = s.Name + " " + s.MiddleName + " " + s.Surname,
                                Email = s.Email,
                                StatusId = s.StatusId,
                                StatusName = s.StatusName,
                                AvatarId = s.AvatarId,
                                AvatarName = s.AvatarName
                            }).ToList();
                }
                return users;
            }
        }

        // Note query to retrieve user
        public static UserDTO GetUser(int userId)
        {
            var user = GetUsers.FirstOrDefault(w => w.Id == userId);
            return user;
        }

        #endregion

        #region Notification

        //Note query to retrieve notifications
        public static List<NotificationDTO> GetNotifications(int userId, string languageCode) 
        {
            List<NotificationDTO> notifications = new List<NotificationDTO>();
            using (var ent = new BeMyMateDBEntities())
            {
                notifications = ent.GetNotifications(userId, languageCode)
                                .Select(s => new
                                {
                                    Id = s.notificationId,
                                    Type = s.name,
                                    Description = s.description
                                })
                                .GroupBy(g => new { Type = g.Type, Description = g.Description })
                                .AsEnumerable()
                                .Select(s => new NotificationDTO
                                {   
                                    Type = s.Key.Type,
                                    Description = s.Key.Description,
                                    Count = s.Count()
                                })
                                .ToList();

                return notifications;
            }
        }

        #endregion

        #region Profile

        //Note query to retrieve profile basic infos
        public static ProfileBasicInfoDTO GetProfileBasicInfo(int userId, string languageCode) 
        {
            ProfileBasicInfoDTO profileBasicInfo = new ProfileBasicInfoDTO();
            using (var ent = new BeMyMateDBEntities()) 
            {
                profileBasicInfo = ent.GetProfileBasicInfo(userId, null, languageCode)
                                   .AsEnumerable()
                                   .GroupBy(g => new { g.Surname, g.AvatarPath, g.Gender, g.UserStatus })
                                   .Select(s => new ProfileBasicInfoDTO
                                   {
                                       AvatarName = s.Key.AvatarPath,
                                       UserFullName = s.Key.Surname,
                                       UserType = "Tennant",
                                       EmailName = "alberto.tosibrandi@gmail.com",
                                       Phones = s.Select(sPhone => new PhoneDTO
                                                {
                                                    Name = sPhone.Prefix + "-" + sPhone.Number,
                                                    Type = sPhone.PhoneType
                                                })
                                                .ToList(),
                                       Addresses = s.Select(sAddress => new AddressDTO
                                                {
                                                    Name = sAddress.AddressLine + "-" + sAddress.City + "-" + sAddress.PostalCode + "-" + sAddress.Province + "-" + sAddress.Country,
                                                    Type = "Home"
                                                })
                                                .ToList(),
                                       Jobs = s.Select(sJob => new JobDTO
                                                {
                                                    Name = sJob.Job
                                                })
                                                .ToList(),
                                       Gender = s.Key.Gender
                                   })
                                   .FirstOrDefault();

                return profileBasicInfo;
            }
        }

        #endregion
    }
}