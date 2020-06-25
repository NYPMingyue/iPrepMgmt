using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace iPrepMgmt.DAO
{
    public class Account
    {
        public int SID { get; set; }
        public string UserId { get; set; }
        public int Role { get; set; }
        public string password { get; set; }
    }
}