using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Http;
using System.Net.Http;
using System.Web.Http.Controllers;

namespace Angular.Authentication
{
    public class CustomAuthorizeAttribute: AuthorizeAttribute
    {
        public CustomAuthorizeAttribute(params string[] roles)
        {
            this.Roles = string.Join(",", roles);
        }
        public override void OnAuthorization(HttpActionContext actionContext)
        {
            base.OnAuthorization(actionContext);
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
            
        }
    }
}