using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Angular.Authentication
{
    /// <summary>
    /// 
    /// </summary>
    public static class MessageString
    {
        /// <summary>
        /// Từ chối truy cập vào Module
        /// </summary>
        public const string AUTH_ACCESSDENIED = "Tài khoản không có quyền để truy cập vào chức năng này.";
        /// <summary>
        /// Từ chối truy cập vào Action
        /// </summary>
        public const string AUTH_METHODDENIED = "Tài khoản của bạn không có quyền để thực hiện thao tác này.";
    }
}