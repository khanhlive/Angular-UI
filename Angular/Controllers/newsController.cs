using Angular.Authentication;
using Angular.Models;
using ICB.Business.Access;
using ICB.Business.Entities.Message;
using ICB.Business.Models;
using NDK.ApplicationCore.Extensions.ResponseResults;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web.Http;

namespace Angular.Controllers
{
    /// <summary>
    /// News manager
    /// </summary>
    public class NewsController : ApiController
    {
        // GET: api/news
        /// <summary>
        /// Get all news
        /// </summary>
        /// <returns></returns>
        [AppAuthorize(ModuleType.NewsModule,ActionType.View,RoleCollection.Superadmin,RoleCollection.Admin)]
        [HttpGet]
        //[CustomAuthorize("0","1")]
        public async Task<ICollection<News>> GetAll()
        {
            using (var newsProvider= new NewsProvider())
            {
                return await newsProvider.GetAllAsync();
            }
        }
        /// <summary>
        /// Get single news
        /// </summary>
        /// <param name="id">id news</param>
        /// <returns></returns>
        [HttpGet]
        [AppAuthorize(ModuleType.NewsModule, ActionType.View, RoleCollection.Superadmin, RoleCollection.Admin)]
        public async Task<News> Get(int id)
        {
            using (var newsProvider = new NewsProvider())
            {
                return await newsProvider.GetByIDAsync(id);
            }
        }
        /// <summary>
        /// create news
        /// </summary>
        /// <param name="model">News model</param>
        /// <returns></returns>
        [HttpPost]
        [AppAuthorize(ModuleType.NewsModule, ActionType.Addition, RoleCollection.Superadmin, RoleCollection.Admin)]
        public async Task<AccessEntityResult> Add(News model) 
        {
            ClaimsIdentity acc = (ClaimsIdentity)User.Identity;
            model.PostedDate = DateTime.Now;
            var idUser = acc.Claims.FirstOrDefault(p => p.Type == ClaimTypes.Sid);
            model.UserID = idUser == null ? 0 : Convert.ToInt32(idUser.Value);
            if (ModelState.IsValid)
            {
                using (var newsProvider = new NewsProvider())
                {
                    return await newsProvider.AddAsync(model);
                }
            }
            else
            {
                return new AccessEntityResult { Status = AccessEntityStatusCode.ModelFailed, Message = MessageManager.GetErrorMessage(ICB.Business.Entities.Apps.ModuleType.Base, MessageType.ModelFailed) };
            }
            
        }
        /// <summary>
        /// Update news
        /// </summary>
        /// <param name="id">id news</param>
        /// <param name="model">News model</param>
        /// <returns></returns>
        [HttpPut]
        [AppAuthorize(ModuleType.NewsModule, ActionType.Edit, RoleCollection.Superadmin, RoleCollection.Admin)]
        public async Task<AccessEntityResult> Edit(int id,News model)
        {
            model.PostedDate = DateTime.Now;
            ClaimsIdentity acc = (ClaimsIdentity)User.Identity;
            var idUser = acc.Claims.FirstOrDefault(p => p.Type == ClaimTypes.Sid);
            model.UserID = idUser == null ? 0 : Convert.ToInt32(idUser.Value);
            if (ModelState.IsValid)
            {
                using (var newsProvider = new NewsProvider())
                {
                    return await newsProvider.EditAsync(id, model);
                }
            }
            else
            {
                return new AccessEntityResult { Status = AccessEntityStatusCode.ModelFailed, Message = MessageManager.GetErrorMessage(ICB.Business.Entities.Apps.ModuleType.Base, MessageType.ModelFailed) };
            }

        }
        /// <summary>
        /// Delete news
        /// </summary>
        /// <param name="id">id new</param>
        /// <returns></returns>
        [HttpDelete]
        [AppAuthorize(ModuleType.NewsModule, ActionType.Delete, RoleCollection.Superadmin, RoleCollection.Admin)]
        public async Task<AccessEntityStatusCode> Delete(int id)
        {
            using (var newsProvider = new NewsProvider())
            {
                return await newsProvider.DeleteAsync(id);
            }
        }

    }
}
