using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Controllers;
using ICB.Business.Models;
using Angular.Models;

namespace Angular.Authentication
{
    /// <summary>
    /// 
    /// </summary>
    public class AppAuthorizeAttribute : AuthorizeAttribute
    {
        private int? moduleType;
        private int? actionType;
        private int[] roleArray;
        /// <summary>
        /// 
        /// </summary>
        public AppAuthorizeAttribute()
        {

        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="roles"></param>
        public AppAuthorizeAttribute(params int[] roles)
        {
            this.roleArray = roles;
            this.Roles = string.Join(",", roles);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="module"></param>
        /// <param name="action"></param>
        /// <param name="roles"></param>
        public AppAuthorizeAttribute(int module, int action, params int[] roles)
        {
            this.moduleType = module;
            this.actionType = action;
            this.roleArray = roles;
            this.Roles = string.Join(",", roles);

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="actionContext"></param>
        public override void OnAuthorization(HttpActionContext actionContext)
        {
            base.OnAuthorization(actionContext);
            if (string.IsNullOrEmpty(this.Roles) || string.IsNullOrWhiteSpace(this.Roles))
            {
                return;
            }
            ClaimsIdentity user = (ClaimsIdentity)actionContext.RequestContext.Principal.Identity;
            string username = user.Name;
            string[] roles = (user.Claims.Where(p => p.Type == ClaimTypes.Role).ToList().Select(p => p.Value).ToArray());
            bool flag = false;
            foreach (var item in roles)
            {
                if (this.Roles.Contains(item)) { flag = true; break; }
            }
            if (!flag)
            {
                actionContext.Response = actionContext.Request.CreateResponse(System.Net.HttpStatusCode.Forbidden, new { status = System.Net.HttpStatusCode.Forbidden, message = MessageString.AUTH_ACCESSDENIED });
            }
            else
            {
                if (this.moduleType!=null && this.actionType!=null)
                {
                    if (!this.AccessToAction(username))
                    {
                        actionContext.Response = actionContext.Request.CreateResponse(System.Net.HttpStatusCode.Forbidden, new { status = System.Net.HttpStatusCode.Forbidden, message = MessageString.AUTH_METHODDENIED });
                    }
                }
            }


            //actionContext.Response.ReasonPhrase = "denied";
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        protected bool AccessToAction(string username)
        {
            using (var db = new WebContext())
            {
                var rolesModule = db.RoleManagers.Where(p => p.ModuleId == this.moduleType);
                var role = (from a in db.Accounts.Where(p => p.Username == username)
                            join b in rolesModule on a.ID equals b.AccountId
                            select b).FirstOrDefault();
                if (role == null)
                {
                    return false;
                }
                else
                {
                    switch (this.actionType)
                    {
                        case ActionType.Addition: return role.Addition;
                        case ActionType.Edit: return role.Edit;
                        case ActionType.Delete: return role.Delete;
                        case ActionType.CanActive: return role.CanActive;
                        case ActionType.View: return role.View;
                        default: return false;
                    }
                }
            }
        }
        

    }
}