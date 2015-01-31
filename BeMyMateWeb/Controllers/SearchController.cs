using BeMyMateWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.OData;

namespace BeMyMateWeb.Controllers
{
    [RoutePrefix("search")]
    public class SearchController : ODataController
    {
        private BeMyMateDBEntities db = new BeMyMateDBEntities();

        [Route]
        [EnableQuery]
        public IQueryable<UserDTO> Get()
        {
            return BuildTestData();
        }

        private IQueryable<UserDTO> BuildTestData()
        {
            var users = (from user in db.Users
                         join status in db.UserStatus on user.statusId equals status.id
                         join avatar in db.Avatars on user.avatarId equals avatar.id
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
                         .Select(s => new UserDTO
                         {
                            //Id = s.Id,
                            //Guid = s.Guid, 
                            //Name = s.Name,
                            //Surname = s.Surname,
                            FullName = s.Name + " " + s.MiddleName + " " + s.Surname,
                            Email = s.Email,
                            //StatusId = s.StatusId,
                            //StatusName = s.StatusName,
                            //AvatarId = s.AvatarId,
                            //AvatarName = s.AvatarName
                         }).ToList().AsQueryable();
                return users;
        }
    }   
}
