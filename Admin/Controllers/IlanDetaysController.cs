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
    [ValidateInput(false)]
    public class IlanDetaysController : BaseController
    {
        private emlakmvcContainer db = new emlakmvcContainer();

        // GET: IlanDetays
        public ActionResult Index()
        {
            return View(db.IlanDetaySet.ToList());
        }

        // GET: IlanDetays/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            IlanDetay ilanDetay = db.IlanDetaySet.Find(id);
            if (ilanDetay == null)
            {
                return HttpNotFound();
            }
            return View(ilanDetay);
        }

        // GET: IlanDetays/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: IlanDetays/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Kat,OdaSayi,BanyoSayi,Isitma,Esyalimi,Aciklama,Adres")] IlanDetay ilanDetay)
        {
            if (ModelState.IsValid)
            {
                db.IlanDetaySet.Add(ilanDetay);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(ilanDetay);
        }

        // GET: IlanDetays/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            IlanDetay ilanDetay = db.IlanDetaySet.Find(id);
            if (ilanDetay == null)
            {
                return HttpNotFound();
            }
            return View(ilanDetay);
        }

        // POST: IlanDetays/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Kat,OdaSayi,BanyoSayi,Isitma,Esyalimi,Aciklama,Adres")] IlanDetay ilanDetay)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ilanDetay).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(ilanDetay);
        }

        // GET: IlanDetays/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            IlanDetay ilanDetay = db.IlanDetaySet.Find(id);
            if (ilanDetay == null)
            {
                return HttpNotFound();
            }
            return View(ilanDetay);
        }

        // POST: IlanDetays/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            IlanDetay ilanDetay = db.IlanDetaySet.Find(id);
            db.IlanDetaySet.Remove(ilanDetay);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
