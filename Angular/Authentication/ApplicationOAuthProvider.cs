using ICB.Business.Access;
using ICB.Business.Models;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;
using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Angular.Authentication
{
    /// <summary>
    /// 
    /// </summary>
    public class ApplicationOAuthProvider : OAuthAuthorizationServerProvider
    {
        private readonly string _publicClientId;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="publicClientId"></param>
        public ApplicationOAuthProvider(string publicClientId)
        {
            if (publicClientId == null)
            {
                throw new ArgumentNullException("publicClientId");
            }

            _publicClientId = publicClientId;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>

        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            //context.OwinContext.Response.Headers.Add("Access-Control-Allow-Origin", new[] { "http://localhost:4200" });
            /*Replace below user authentication code as per your Entity Framework Model ***/
            using (AccountProvider obj = new AccountProvider())
            {

                //tblUserMaster entry = obj.tblUserMasters.Where
                //<tblUserMaster>(record =>
                //record.User_ID == context.UserName &&
                //record.User_Password == context.Password).FirstOrDefault();
                Account account = await obj.SignInAsync(context.UserName, context.Password);
                if (account == null)
                {
                    context.SetError("invalid_grant",
                    "The user name or password is incorrect.");
                    return;
                }
                else
                {
                    ClaimsIdentity oAuthIdentity = new ClaimsIdentity(context.Options.AuthenticationType);
                    oAuthIdentity.AddClaim(new Claim(ClaimTypes.Name, account.Username));
                    oAuthIdentity.AddClaim(new Claim(ClaimTypes.Role, account.Role.ToString()));
                    oAuthIdentity.AddClaim(new Claim(ClaimTypes.Email, account.Email));
                    oAuthIdentity.AddClaim(new Claim("Fullname", account.Fullname));
                    oAuthIdentity.AddClaim(new Claim(ClaimTypes.Sid, account.ID.ToString()));
                    ClaimsIdentity cookiesIdentity = new ClaimsIdentity(context.Options.AuthenticationType);

                    AuthenticationProperties properties = CreateProperties(context.UserName, account.Fullname, account.Role);
                    AuthenticationTicket ticket =
                    new AuthenticationTicket(oAuthIdentity, properties);
                    context.Validated(ticket);
                    context.Request.Context.Authentication.SignIn(cookiesIdentity);
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public override Task TokenEndpoint(OAuthTokenEndpointContext context)
        {
            foreach (KeyValuePair<string,
            string> property in context.Properties.Dictionary)
            {
                context.AdditionalResponseParameters.Add(property.Key, property.Value);
            }

            return Task.FromResult<object>(null);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public override Task ValidateClientAuthentication
        (OAuthValidateClientAuthenticationContext context)
        {
            // Resource owner password credentials does not provide a client ID.
            if (context.ClientId == null)
            {
                context.Validated();
            }

            return Task.FromResult<object>(null);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public override Task ValidateClientRedirectUri
        (OAuthValidateClientRedirectUriContext context)
        {
            if (context.ClientId == _publicClientId)
            {
                Uri expectedRootUri = new Uri(context.Request.Uri, "/");

                if (expectedRootUri.AbsoluteUri == context.RedirectUri)
                {
                    context.Validated();
                }
            }

            return Task.FromResult<object>(null);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="fullname"></param>
        /// <param name="role"></param>
        /// <returns></returns>
        public static AuthenticationProperties CreateProperties(string userName, string fullname, byte role)
        {
            IDictionary<string, string>
            data = new Dictionary<string, string>
            {
                { "userName", userName },
                { "fullName", fullname },
                { "role", role.ToString() }
            };
            return new AuthenticationProperties(data);
        }
    }
}