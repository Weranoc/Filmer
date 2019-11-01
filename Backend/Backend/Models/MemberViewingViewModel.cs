using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Backend.Models
{
    public class MemberViewingViewModel
    {
        public int movieId { get; set; }
        public int tickets { get; set; }
        public AccessTokenViewModel token { get; set; }
    }
}