using Angular.Authentication;
using ICB.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Data.Entity;

namespace Angular.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    public class ConfigController : ApiController
    {
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [AppAuthorize]
        public async Task<object> Get()
        {
            using (var db=new WebContext())
            {
                
                var roles = await (from a in db.Accounts.Where(p => p.Username == User.Identity.Name)
                            join b in db.RoleManagers on a.ID equals b.AccountId
                            select new { b.ModuleId,b.Addition,b.CanActive,b.Delete,b.Edit }).ToListAsync();
                return roles;
            }
        }
    }
}
