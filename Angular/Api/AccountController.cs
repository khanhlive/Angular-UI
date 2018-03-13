using Angular.Authentication;
using Angular.Models;
using ICB.Business.Entities.Message;
using ICB.Business.ModelBase;
using ICB.Business.Models;
using NDK.ApplicationCore.Extensions.Hepler;
using NDK.ApplicationCore.Extensions.ResponseResults;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.Http;

namespace Angular.Api
{
    /// <summary>
    /// Account manager
    /// </summary>
    public class AccountController : ApiController
    {
        /// <summary>
        /// Get list of Acount
        /// </summary>
        /// <returns>return List(Account)</returns>
        [HttpGet]
        [AppAuthorize(ModuleType.NewsModule, ActionType.View, RoleCollection.Superadmin, RoleCollection.Admin)]
        public async Task<List<AccountBase>> GetAll()
        {
            using (var accountProvider = new ICB.Business.Access.AccountProvider())
            {
                accountProvider.SetProxy(false);
                ICollection<Account> acccounts = await accountProvider.GetAllAsync();
                List<AccountBase> response = new List<AccountBase>();
                foreach (var item in acccounts)
                {
                    var it = item as AccountBase;
                    response.Add(it);
                }
                return (response);
            }
        }

        /// <summary>
        /// Get Account by Id
        /// </summary>
        /// <param name="id">Account Id</param>
        /// <returns></returns>
        [HttpGet]
        [AppAuthorize(ModuleType.NewsModule, ActionType.View, RoleCollection.Superadmin, RoleCollection.Admin)]
        public async Task<AccountBase> GetId(int id)
        {
            using (var accountProvider = new ICB.Business.Access.AccountProvider())
            {
                return await( accountProvider.GetByIDAsync(id));
            }
        }
        /// <summary>
        /// Add new account
        /// </summary>
        /// <param name="account">account model</param>
        /// <returns></returns>
        [HttpPost]
        [AppAuthorize(ModuleType.NewsModule, ActionType.Addition, RoleCollection.Superadmin, RoleCollection.Admin)]
        public async Task<AccessEntityResult> Add(Account account)
        {
            if (ModelState.IsValid)
            {
                account.Password = StringHelper.CreateMD5(account.Password);
                using (var accountProvider = new ICB.Business.Access.AccountProvider())
                {
                    return await accountProvider.RegisterAsync(account);
                }
            }
            else
            {
                return new AccessEntityResult { Status= AccessEntityStatusCode.ModelFailed, Message="Thông tin không hợp lệ" };
            }
            
        }

        /// <summary>
        /// Update account
        /// </summary>
        /// <param name="id">account id</param>
        /// <param name="account">account model</param>
        /// <returns></returns>
        [HttpPut]
        [AppAuthorize(ModuleType.NewsModule, ActionType.Edit, RoleCollection.Superadmin, RoleCollection.Admin)]
        public async Task<AccessEntityResult> Edit(int id, Account account)
        {
            using (var accountProvider = new ICB.Business.Access.AccountProvider())
            {
                var result = await accountProvider.EditAsync(account, id);
                return new AccessEntityResult { Status=result.Item1, Data=result.Item2, Message= MessageManager.GetErrorMessage(ICB.Business.Entities.Apps.ModuleType.Register, result.Item1) };
            }
        }

        /// <summary>
        /// delete account
        /// </summary>
        /// <param name="id">account id</param>
        /// <returns></returns>
        [HttpDelete]
        [AppAuthorize(ModuleType.NewsModule, ActionType.Delete, RoleCollection.Superadmin, RoleCollection.Admin)]
        public async Task<IHttpActionResult> Delete(int id)
        {
            using (var accountProvider = new ICB.Business.Access.AccountProvider())
            {
                return Ok(await accountProvider.DeleteAsync(id));
            }
        }
    }
}
