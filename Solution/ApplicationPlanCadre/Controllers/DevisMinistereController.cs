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
    [RCPDevisMinistereAuthorize]
    public class DevisMinistereController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        private IQueryable<DevisMinistere> getRCPDevisMinistere()
        {
            string username = User.Identity.GetUserName();
            return from devisMinistere in db.DevisMinistere
                   join enteteProgramme in db.EnteteProgramme on devisMinistere.codeProgramme equals enteteProgramme.codeProgramme
                   join accesProgramme in db.AccesProgramme on enteteProgramme.codeProgramme equals accesProgramme.codeProgramme
                   where accesProgramme.userMail == username
                   select devisMinistere;
        }

        public ActionResult _TreeView()
        {
            return PartialView(getRCPDevisMinistere().ToList());
        }

        public ActionResult Index()
        {
            return View(getRCPDevisMinistere().ToList());
        }

        public ActionResult Info(int? idDevis)
        {
            if (idDevis == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DevisMinistere devisMinistere = db.DevisMinistere.Find(idDevis);
            if (devisMinistere == null)
            {
                return HttpNotFound();
            }
            ViewBag.total = devisMinistere.nbHeureFrmGenerale + devisMinistere.nbHeureFrmSpecifique;
            //ViewBag.dateValidation = checkValidation(devisMinistere);
            return View(devisMinistere);
        }

        public ActionResult Edit(int? idDevis)
        {
            if (idDevis == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DevisMinistere devisMinistere = db.DevisMinistere.Find(idDevis);
            if (devisMinistere == null)
            {
                return HttpNotFound();
            }
            return View(devisMinistere);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idDevis, codeProgramme, annee, codeSpecialisation, nom, dateValidation, docMinistere, specialisation, sanction, nbUnite, condition, nbHeurefrmGenerale,nbHeurefrmSpecifique")] DevisMinistere devisMinistere, HttpPostedFileBase docMinistere)
        {
            devisMinistere.EnteteProgramme = db.EnteteProgramme.Find(devisMinistere.codeProgramme);
            if (docMinistere != null)
            {
                if(!UploadFile(docMinistere, devisMinistere))
                    ModelState.AddModelError("PDF", "Le fichier doit être de type PDF.");
            }
            Trim(devisMinistere);
            if (ModelState.IsValid)
            {
                db.Entry(devisMinistere).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Info", "DevisMinistere", new { idDevis = devisMinistere.idDevis });
            }
            return View(devisMinistere);
        }

        public bool UploadFile(HttpPostedFileBase file, DevisMinistere devisMinistere)
        {
            try
            {
                string fileName = Path.GetFileName(file.FileName);
                string path = Path.Combine(Server.MapPath("~/Files/Document ministériel"), fileName);
                string ext = fileName.Substring(fileName.Length - 4, 4);
                string oldPath = devisMinistere.docMinistere;
                devisMinistere.docMinistere = fileName;
                if (ext == ".pdf")
                {
                    file.SaveAs(path);
                    if (oldPath != null)
                        DeleteFile(oldPath);
                    return true;
                }
                return false;
            }
            catch(IOException)
            {
                return false;
            }
        }

        public bool DeleteFile(string fileName)
        {
            try
            {
                System.IO.File.Delete(Path.Combine(Server.MapPath("~/Files/Document ministériel"), fileName));
                return true;
            }
            catch(IOException)
            {
                return false;
            }
        }

        private void Trim(DevisMinistere devisMinistere)
        {
            if (devisMinistere.specialisation != null) devisMinistere.specialisation = devisMinistere.specialisation.Trim();
            if (devisMinistere.sanction != null) devisMinistere.sanction = devisMinistere.sanction.Trim();
            if (devisMinistere.nbUnite != null) devisMinistere.nbUnite = devisMinistere.nbUnite.Trim();
            if (devisMinistere.condition != null) devisMinistere.condition = devisMinistere.condition.Trim();
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
