using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Data;

namespace Web.Controllers
{
    public class HomeController : BaseController
    {
        // GET: Home
        public ActionResult Index(int start=0, int pageSize=1)
        {
            var ilanlar = emlakmvc.IlanSet.OrderByDescending(q => q.Id).Skip(start).Take(pageSize);

            ViewBag.start = start + pageSize;
            ViewBag.pageSize = pageSize;

            return View(ilanlar);
        }
        public ActionResult Api()
        {
            var list = emlakmvc.LogSet.Select(x => new { x.Id, x.Subject, x.Detail });

            return Json(list, JsonRequestBehavior.AllowGet);
        }
    }
}