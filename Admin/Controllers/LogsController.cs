using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Data;

namespace Admin.Controllers
{
    public class LogsController : BaseController
    {
        private emlakmvcContainer emlakmvc = new emlakmvcContainer();

        // GET: Logs
        public ActionResult Index()
        {
            var logSet = emlakmvc.LogSet.Include(l => l.User);
            return View(logSet.ToList());
        }

        // GET: Logs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Log log = emlakmvc.LogSet.Find(id);
            if (log == null)
            {
                return HttpNotFound();
            }
            return View(log);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                emlakmvc.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
