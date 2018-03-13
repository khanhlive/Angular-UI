using Angular.Authentication;
using Angular.Models;
using ICB.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace Angular.Api
{
    /// <summary>
    /// Customer
    /// </summary>
    
    public class CustomerController : ApiController
    {
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [AppAuthorize(ModuleType.NewsModule, ActionType.View, RoleCollection.Superadmin, RoleCollection.Admin)]
        public async Task<List<Customer>> GetAll()
        {
            using (var customerProvider = new ICB.Business.Access.CustomerProvider())
            {
                customerProvider.SetProxy(false);
                ICollection<Customer> customers = await customerProvider.GetAllAsync();
                List<Customer> response = new List<Customer>();
                foreach (var item in customers)
                {
                    var it = item as Customer;
                    response.Add(it);
                }
                return (response);
            }
        }
        /// <summary>
        /// Get Customer by Id
        /// </summary>
        /// <param name="id">Customer Id</param>
        /// <returns></returns>
        [HttpGet]
        [AppAuthorize(ModuleType.NewsModule, ActionType.View, RoleCollection.Superadmin, RoleCollection.Admin)]

        public async Task<Customer> GetId(int id)
        {
            using (var customerProvider = new ICB.Business.Access.CustomerProvider())
            {
                return await customerProvider.GetByIDAsync(id);
            }
        }
        /// <summary>
        /// Add new Customer
        /// </summary>
        /// <param name="customer">Customer model</param>
        /// <returns></returns>
        [HttpPost]
        [AppAuthorize(ModuleType.NewsModule, ActionType.Addition, RoleCollection.Superadmin, RoleCollection.Admin)]
        public async Task<IHttpActionResult> Add(Customer customer)
        {
            using (var customerProvider = new ICB.Business.Access.CustomerProvider())
            {
                return Ok(await customerProvider.AddAsync(customer));
            }
        }

        /// <summary>
        /// Update Customer
        /// </summary>
        /// <param name="id">Customer id</param>
        /// <param name="customer">Customer model</param>
        /// <returns></returns>
        [HttpPut]
        [AppAuthorize(ModuleType.NewsModule, ActionType.Edit, RoleCollection.Superadmin, RoleCollection.Admin)]
        public async Task<IHttpActionResult> Edit(int id, Customer customer)
        {
            using (var customerProvider = new ICB.Business.Access.CustomerProvider())
            {
                return Ok(await customerProvider.EditAsync(id, customer));
            }
        }

        /// <summary>
        /// delete Customer
        /// </summary>
        /// <param name="id">Customer id</param>
        /// <returns></returns>
        [HttpDelete]
        [AppAuthorize(ModuleType.NewsModule, ActionType.Delete, RoleCollection.Superadmin, RoleCollection.Admin)]
        public async Task<IHttpActionResult> Delete(int id)
        {
            using (var customerProvider = new ICB.Business.Access.CustomerProvider())
            {
                return Ok(await customerProvider.DeleteAsync(id));
            }
        }
    }
}
