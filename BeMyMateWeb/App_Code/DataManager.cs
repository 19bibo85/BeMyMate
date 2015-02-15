using BeMyMateWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace BeMyMateWeb.App_Code
{
    public class DataManager
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
                        .GroupBy(g => new { g.MenuId, g.MenuName, g.MenuDesc, g.MenuLink })
                        .AsEnumerable()
                        .Select(s => new MenuDTO
                        {
                            Id = s.Key.MenuId,
                            Name = s.Key.MenuName,
                            Description = s.Key.MenuDesc,
                            Link = s.Key.MenuLink,
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
                                AvatarName = avatar.name,
                                AvatarPath =  avatar.path
                             })
                             .Select(s => new UserDTO
                             {
                                Id = s.Id,
                                Guid = s.Guid, 
                                Name = s.Name,
                                Surname = s.Surname,
                                MiddleName = s.MiddleName,
                                Email = s.Email,
                                StatusId = s.StatusId,
                                StatusName = s.StatusName,
                                AvatarId = s.AvatarId,
                                AvatarName = s.AvatarName,
                                AvatarPath = s.AvatarPath
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
                                   .GroupBy(g => new { g.AvatarPath, g.Name, g.Surname, g.Email, g.Gender, g.UserStatus })
                                   .Select(s => new ProfileBasicInfoDTO
                                   {
                                       AvatarName = s.Key.AvatarPath,
                                       UserName = s.Key.Name,
                                       UserMiddleName = "",
                                       UserSurname = s.Key.Surname,
                                       UserType = "Tennant",
                                       EmailName = s.Key.Email,
                                       Phones = s.Select(sPhone => new PhoneDTO
                                                {
                                                    Prefix = sPhone.Prefix,
                                                    Number = sPhone.Number,
                                                    Type = sPhone.PhoneType
                                                })
                                                .ToList(),
                                       Addresses = s.Select(sAddress => new AddressDTO
                                                {
                                                    Line = sAddress.AddressLine,
                                                    City = sAddress.City,
                                                    PostaCode = sAddress.PostalCode,
                                                    Province = sAddress.Province,
                                                    Country = sAddress.Country,
                                                    Type = "Home"
                                                })
                                                .ToList(),
                                       Jobs = s.Select(sJob => new JobDTO
                                                {
                                                    Name = sJob.Job
                                                })
                                                .ToList(),
                                       Gender = s.Key.Gender,
                                       Friends = new List<FriendDTO>
                                            {
                                                new FriendDTO
                                                {
                                                    UserName = "Silvia Durzu",
                                                    UserUID = new Guid()
                                                },
                                                new FriendDTO
                                                {
                                                    UserName = "Giovanni Basilico",
                                                    UserUID = new Guid()
                                                },
                                                new FriendDTO
                                                {
                                                    UserName = "Laura Cocco",
                                                    UserUID = new Guid()
                                                }
                                            },
                                       Areas = new List<AreaDTO> 
                                            {
                                                new AreaDTO
                                                {
                                                    AreaName = "Detail Info",
                                                    AreaValue = 20,
                                                },
                                                new AreaDTO
                                                {
                                                    AreaName = "Detail Info1",
                                                    AreaValue = 20,
                                                },
                                                new AreaDTO
                                                {
                                                    AreaName = "Detail Info2",
                                                    AreaValue = 20,
                                                },
                                                new AreaDTO
                                                {
                                                    AreaName = "Detail Info3",
                                                    AreaValue = 20,
                                                },
                                                new AreaDTO
                                                {
                                                    AreaName = "Detail Inf4",
                                                    AreaValue = 20,
                                                },
                                                new AreaDTO
                                                {
                                                    AreaName = "Detail Info5",
                                                    AreaValue = 20,
                                                }
                                                
                                            }
                                   })
                                   .FirstOrDefault();

                return profileBasicInfo;
            }
        }

        //Note query to retrieve profile detail infos
        public static List<ProfileDetailInfoDTO> GetProfileDetailInfos(int userId, string languageCode) 
        {
            List<ProfileDetailInfoDTO> profileDetailInfos = new List<ProfileDetailInfoDTO>();
            using (var ent = new BeMyMateDBEntities())
            {
                profileDetailInfos = ent.GetProfileDetailInfo(userId, null, languageCode)
                                    .AsEnumerable()
                                    .GroupBy(g => g.Area)
                                    .Select(s => new ProfileDetailInfoDTO
                                    {
                                        AreaName = s.Key,
                                        QuestionnaireAnswers = s.Select(sItem => new QuestionnaireAnswerDTO
                                        {
                                            QuestionnaireName = sItem.Questionnaire,
                                            AnswerName = sItem.Answer
                                        })
                                        .ToList()
                                    })
                                    .ToList();

                return profileDetailInfos;
            }
        }

        //Note query to retrieve profile chart area
        public static List<ProfileChartAreaDTO> GetProfileChartArea(int userId, string languageCode) 
        {
            List<ProfileChartAreaDTO> profileChartArea = new List<ProfileChartAreaDTO>();
            using (var ent = new BeMyMateDBEntities())
            {
                //profileChartArea = ent.GetProfileDetailInfo(userId, null, languageCode)
                //                   .AsEnumerable()
                //                   .GroupBy(g => g.Area)
                //                   .Select(s => new ProfileChartAreaDTO
                //                   {
                //                        AreaName = s.Key,
                //                        AreaValue = 10
                //                   })
                //                   .ToList();
                profileChartArea = new List<ProfileChartAreaDTO>{
                                                                new ProfileChartAreaDTO
                                                                {
                                                                    AreaName = "Area1",
                                                                    AreaValue = 10
                                                                },
                                                                new ProfileChartAreaDTO
                                                                {
                                                                    AreaName = "Area2",
                                                                    AreaValue = 5
                                                                },
                                                                new ProfileChartAreaDTO
                                                                {
                                                                    AreaName = "Area3",
                                                                    AreaValue = 10
                                                                },
                                                                new ProfileChartAreaDTO
                                                                {
                                                                    AreaName = "Area4",
                                                                    AreaValue = 15
                                                                },
                                                                new ProfileChartAreaDTO
                                                                {
                                                                    AreaName = "Area5",
                                                                    AreaValue = 15
                                                                }};



                return profileChartArea;
            }
        }

        #endregion

        //#region Friend

        //public static IEnumerable<> GetFriends(int userId, string languageCode)
        //{
        //    var friends = new IEnumerable<>();
        //    using(var ent = new BeMyMateDBEntities())
        //    {
        //        friends = ent.GetFriends(userId, languageCode)
        //                  .Select(s=> new 
        //                  {
                              
        //                  })
        //                  .ToList();
        //    }
        //}

        //#endregion
    }
}