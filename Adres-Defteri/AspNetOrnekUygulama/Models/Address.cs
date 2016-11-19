using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AspNetOrnekUygulama.Models
{
    public class Address
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string NickName { get; set; }
        public DateTime BirtDay { get; set; }
        public string EMail { get; set; }
        public string MobileNumb { get; set; }
        public string Fax { get; set; }
        public string UserAddress { get; set; }
        public string HomeNumb { get; set; }
        public bool Gender { get; set; }
        public string Note { get; set; }

    }
}