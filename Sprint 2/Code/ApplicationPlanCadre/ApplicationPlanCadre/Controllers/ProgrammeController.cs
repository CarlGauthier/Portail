using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ApplicationPlanCadre.Models;

namespace ApplicationPlanCadre.Controllers
{
    public class ProgrammeController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        public ActionResult _TreeView()
        {
            var programme = db.Programme.ToList();

            return PartialView(programme);
        }
		
        // GET: Programme
        public ActionResult Index()
        {
            return View(db.Programme.ToList());
        }

        public ActionResult Info(int? idProgramme)
        {
            if (idProgramme == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Programme programme = db.Programme.Find(idProgramme);
            if (programme == null)
            {
                return HttpNotFound();
            }
            return View(programme);
        }
    }
}
