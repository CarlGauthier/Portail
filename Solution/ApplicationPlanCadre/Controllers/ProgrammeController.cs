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
using ApplicationPlanCadre.Helpers;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace ApplicationPlanCadre.Controllers
{
    [RCPProgrammeAuthorize]
    public class ProgrammeController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        private IQueryable<Programme> getRCPProgramme()
        {
            string username = User.Identity.GetUserName();
            return from programme in db.Programme
                   join devisMinistere in db.DevisMinistere on programme.idDevis equals devisMinistere.idDevis
                   join enteteProgramme in db.EnteteProgramme on devisMinistere.codeProgramme equals enteteProgramme.codeProgramme
                   join accesProgramme in db.AccesProgramme on enteteProgramme.codeProgramme equals accesProgramme.codeProgramme
                   where accesProgramme.userMail == username
                   select programme;
        }

        public ActionResult _TreeView()
        {
            return PartialView(getRCPProgramme().ToList());
        }

        public ActionResult Index()
        {
            return View(getRCPProgramme().ToList());
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
