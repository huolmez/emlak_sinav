using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Helpers;

namespace Web.Controllers
{
    public class ProjectsController : BaseController
    {
        // GET: Projects
        public ActionResult Index()
        {
            var projects = emlakmvc.ProjectSet.AsQueryable();

            return View(projects);
        }

        public ActionResult Download(int id)
        {
            var project = emlakmvc.ProjectSet.FirstOrDefault(q => q.Id == id);
            if (project == null)
            {
                return Content("Dosya bulunamadı");
            }

            Response.AddHeader("Content-Disposition", "attachment; filename=" + project.FileName);

            return File(project.File, project.ContentType);
        }

        [HttpPost]
        public ActionResult AddToCart(int id)
        {
            if (UserHelper.isMember() == true)
            {

                Cart cart = new Cart();
                cart.ProjectId = id;
                cart.UserId = UserHelper.Current().Id;
                cart.Status = CartStatus.New;
                cart.Count = 1;

                emlakmvc.CartSet.Add(cart);

                emlakmvc.SaveChanges();

                return Json(id);
            }

            return Json("login");
        }

        [HttpPost]
        public ActionResult RemoveFromCart(int id)
        {
            if (UserHelper.isMember() == true)
            {
                int userId = UserHelper.Current().Id;
                var cart = emlakmvc.CartSet.FirstOrDefault(q => q.Status == CartStatus.New &&
                                                          q.UserId == userId &&
                                                          q.ProjectId == id
                                                    );
                emlakmvc.CartSet.Remove(cart);
                emlakmvc.SaveChanges();

                return Json(id);
            }

            return Json("login");
        }
    }
}