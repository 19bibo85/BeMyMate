using BeMyMateWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace BeMyMateWeb.Controllers
{
    public class UsersController : ApiController
    {
        HttpRequest request = HttpContext.Current.Request;

        // GET api/<controller>
        public IEnumerable<UserDTO> GetUsers()
        {
            int skip = request["skip"] == null ? 0 : int.Parse(request["skip"]);
            int take = request["take"] == null ? 10 : int.Parse(request["take"]);

            var a = request["filter[filters][0][value]"];

            using (var ent = new BeMyMateDBEntities())
            {
                var users = (from user in ent.Users
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
                             }).ToList()
                             .Select(s=> new UserDTO
                             {
                                 //Id = s.Id,
                                 //Guid = s.Guid, 
                                 //Name = s.Name,
                                 //Surname = s.Surname,
                                 FullName = s.Name + " " + s.MiddleName + " " + s.Surname,
                                 Email = s.Email,
                                 //StatusId = s.StatusId,
                                 StatusName = s.StatusName,
                                 //AvatarId = s.AvatarId,
                                 AvatarName = s.AvatarName
                             }).Skip(skip).Take(take).ToList();
               return users;
            }
        }
    }
}