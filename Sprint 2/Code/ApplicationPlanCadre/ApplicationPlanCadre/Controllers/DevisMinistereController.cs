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
    [Authorize(Roles = "RCP")]
    public class DevisMinistereController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        public ActionResult _TreeView()
        {
            var devisMinistere = db.DevisMinistere.ToList();

            return PartialView(devisMinistere);
        }

        [Route("DevisMinistere", Name = "Index-devisMinistere")]
        public ActionResult Index()
        {
            return View(db.DevisMinistere.ToList());
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
		
        public ActionResult Create()
        {
            ViewBag.codeProgramme = new SelectList(db.EnteteProgramme, "codeProgramme", "commentaire");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idDevis,annee,nom,nbUnite,codeSpecialisation,specialisation,nbHeurefrmGenerale,nbHeurefrmSpecifique,condition,sanction,commentaire,docMinistere,dateValidation,codeProgramme")] DevisMinistere devisMinistere)
        {
            Trim(devisMinistere);
            if (ModelState.IsValid)
            {
                db.DevisMinistere.Add(devisMinistere);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.codeProgramme = new SelectList(db.EnteteProgramme, "codeProgramme", "commentaire", devisMinistere.codeProgramme);
            return View(devisMinistere);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DevisMinistere devisMinistere = db.DevisMinistere.Find(id);
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
