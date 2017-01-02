using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Data;

namespace Web.Controllers
{
    public class BaseController : Controller
    {
        public emlakmvcContainer emlakmvc = new emlakmvcContainer();
        // GET: Base
        public BaseController()
        {
            var httpContext = System.Web.HttpContext.Current;

            if (httpContext.Application["ilanlar"]==null)
            {
                httpContext.Application["ilanlar"] = emlakmvc.KategoriSet.ToList();
            }
        }
    }
}