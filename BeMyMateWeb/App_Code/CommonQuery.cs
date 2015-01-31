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

        // Note query to retrieve users
        public static List<UserDTO> GetUsers(int sectionId, string languageCode)
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

        // Note query to retrieve user
        public static UserDTO GetUser(int userId, int sectionId, string languageCode)
        {
            var user = GetUsers(sectionId, languageCode).FirstOrDefault(w => w.Id == userId);
            return user;
        }
    }
}