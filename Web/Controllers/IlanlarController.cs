using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Helpers;


namespace Web.Controllers
{
    public class IlanlarController : BaseController
    {
        // GET: Ilanlar
        public ActionResult Index(int id = 0, int start = 0, int pageSize = 1, string query = "")
        {
            var ilanlar = emlakmvc.IlanSet.AsQueryable();

            if (id > 0)
            {
                ilanlar = ilanlar.Where(q => q.KategoriId == id);
            }

            if (query.Length > 0)
            {
                ilanlar = ilanlar.Where(q => q.Title.Contains(query) || q.IlanDetay.Aciklama.Contains(query));
            }

            ilanlar.OrderByDescending(q => q.Id).Skip(start).Take(pageSize);

            ViewBag.start = start + pageSize;
            ViewBag.pageSize = pageSize;

            return View(ilanlar);
        
        }

        public ActionResult Show(int id = 0)
        {
            Ilan ilan = emlakmvc.IlanSet.FirstOrDefault(q => q.Id == id);
            return View(ilan);
        }

        [HttpPost]
        public ActionResult Comment(int post_id, String comment_text)
        {
            var user = (User)Session["user"];

            if (user == null)
            {
                TempData["comment_error"] = "Giriş yapmadan yorum yapamasınız !";
                return Redirect(Request.UrlReferrer.ToString());
            }

            if (comment_text == "" || post_id < 1)
            {
                TempData["comment_error"] = "Formdaki eksikleri doldurunuz !";
                return Redirect(Request.UrlReferrer.ToString());
            }

            var comment = new Comment();
            comment.Date = DateTime.Now;
            comment.IlanId = post_id;
            comment.Text = comment_text;
            comment.UserId = user.Id;
            comment.Verified = false;

            emlakmvc.CommentSet.Add(comment);
            emlakmvc.SaveChanges();

            TempData["comment_success"] = "Yorumunuz onay sonrasında yayına alınacaktır, teşekkürler !";
            return Redirect(Request.UrlReferrer.ToString());
        }

        [HttpPost]
        public ActionResult CommentAjax(int post_id, String comment_text)
        {
            Comment(post_id, comment_text);

            if (TempData["comment_error"] != null)
            {
                return Content(TempData["comment_error"].ToString());
            }
            return Content(TempData["comment_success"].ToString());
        }

        public ActionResult Json(int id)
        {
            var list = emlakmvc.IlanSet.Where(q => q.KategoriId == id).Select(x => new { x.Id, x.Title });
            return Json(list, JsonRequestBehavior.AllowGet);
        }



        //public ActionResult Resim(int id)
        //{
        //    User user = emlakmvc.UserSet.Find(id);

        //    if (user == null)
        //    {
        //        return Content("Resim bulunamadı");
        //    }
        //    byte[] file = user.Avatar;
        //    return File(file, ImageHelper.GetContentType(file).ToString());
        //}
        public ActionResult Resim(int id)
        {
            byte[] file = emlakmvc.IlanSet.Find(id).Resim;
            if (file == null)
            {
                return Content("Resim bulunamadı");
            }
            return File(file, ImageHelper.GetContentType(file).ToString());
        }
    }
    }
