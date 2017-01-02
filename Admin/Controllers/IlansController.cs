using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Data;
using Admin.Helpers;
using System.Drawing.Imaging;

namespace Admin.Controllers
{
    public class IlansController : BaseController
    {
        private emlakmvcContainer db = new emlakmvcContainer();

        // GET: Ilans
        public ActionResult Index()
        {
            var ilanSet = db.IlanSet.Include(i => i.Kategori).Include(i => i.IlanDetay).Include(i => i.User);
            return View(ilanSet.ToList());
        }

        // GET: Ilans/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ilan ilan = db.IlanSet.Find(id);
            if (ilan == null)
            {
                return HttpNotFound();
            }
            return View(ilan);
        }

        // GET: Ilans/Create
        public ActionResult Create()
        {
            ViewBag.KategoriId = new SelectList(db.KategoriSet, "Id", "KategoriAdi");
            ViewBag.IlanDetayId = new SelectList(db.IlanDetaySet, "Id", "Kat");
            ViewBag.UserId = new SelectList(db.UserSet, "Id", "Name");
            return View();
        }

        // POST: Ilans/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Title,Fiyat,MetreKare,Tarih,UserId,KategoriId,IlanDetayId")] Ilan ilan , HttpPostedFileBase Resim)
        {
            if (ModelState.IsValid)
            {
                if (Resim != null && Resim.ContentLength > 0)
                {
                    using (var reader = new System.IO.BinaryReader(Resim.InputStream))
                    {
                        ilan.Resim = reader.ReadBytes(Resim.ContentLength);
                    }
                }

                db.IlanSet.Add(ilan);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.KategoriId = new SelectList(db.KategoriSet, "Id", "KategoriAdi", ilan.KategoriId);
            ViewBag.IlanDetayId = new SelectList(db.IlanDetaySet, "Id", "Kat", ilan.IlanDetayId);
            ViewBag.UserId = new SelectList(db.UserSet, "Id", "Name", ilan.UserId);
            return View(ilan);
        }

        // GET: Ilans/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ilan ilan = db.IlanSet.Find(id);
            if (ilan == null)
            {
                return HttpNotFound();
            }
            ViewBag.KategoriId = new SelectList(db.KategoriSet, "Id", "KategoriAdi", ilan.KategoriId);
            ViewBag.IlanDetayId = new SelectList(db.IlanDetaySet, "Id", "Kat", ilan.IlanDetayId);
            ViewBag.UserId = new SelectList(db.UserSet, "Id", "Name", ilan.UserId);
            return View(ilan);
        }

        // POST: Ilans/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Title,Fiyat,MetreKare,Tarih,UserId,KategoriId,IlanDetayId")] Ilan ilan ,HttpPostedFileBase Resim)
        {
            if (ModelState.IsValid)
            {
                if (Resim != null && Resim.ContentLength > 0)
                {
                    using (var reader = new System.IO.BinaryReader(Resim.InputStream))
                    {
                        ilan.Resim = reader.ReadBytes(Resim.ContentLength);
                    }
                }
                else
                {
                    db.Entry(ilan).Property("Resim").IsModified = false;
                }

                db.Entry(ilan).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.KategoriId = new SelectList(db.KategoriSet, "Id", "KategoriAdi", ilan.KategoriId);
            ViewBag.IlanDetayId = new SelectList(db.IlanDetaySet, "Id", "Kat", ilan.IlanDetayId);
            ViewBag.UserId = new SelectList(db.UserSet, "Id", "Name", ilan.UserId);
            return View(ilan);
        }

        // GET: Ilans/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ilan ilan = db.IlanSet.Find(id);
            if (ilan == null)
            {
                return HttpNotFound();
            }
            return View(ilan);
        }

        // POST: Ilans/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Ilan ilan = db.IlanSet.Find(id);
            db.IlanSet.Remove(ilan);
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
        public ActionResult Resim(int id)
        {
            byte[] file = db.IlanSet.Find(id).Resim;
            if (file == null)
            {
                return Content("Resim bulunamadı");
            }
            return File(file, ImageHelper.GetContentType(file).ToString());
        }
    }
}
