using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Backend.Libraries.Utilities;
using Backend.Models;

namespace Backend.Libraries
{
    public class LoginUtility
    {
        private FilmerEntities db = new FilmerEntities();

        public string Login(string email, string password)
        {
            var Member = db.Members.Where(u => u.Email == email).FirstOrDefault<Member>();

            if (Member != null)
            {
                if (Member.Password == password)
                {
                    return CreateTokenString(email);
                } else
                {
                    return string.Empty;
                }
            } else
            {
                return string.Empty;
            }
        }

        public string CreateTokenString(string uid)
        {
            var guid = Guid.NewGuid();
            var ret = uid + ":" + guid.ToString();
            return Base64.Encode(ret);
        }
    }
}