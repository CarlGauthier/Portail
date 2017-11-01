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
    public class ProgrammeController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();
        public ActionResult _TreeView()
        {
            var programme = db.Programme
                          .Include(p => p.EnonceCompetence)
                          .ToList();
            return PartialView(programme);
        }

        [Route("Programme", Name = "Index-programme")]
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
            ViewBag.total = programme.nbHeurefrmGenerale + programme.nbHeurefrmSpecifique;
            //ViewBag.dateValidation = checkValidation(programme);
            return View(programme);
        }
		
        public ActionResult Create()
        {
            ViewBag.codeProgramme = new SelectList(db.EnteteProgramme, "codeProgramme", "commentaire");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idProgramme,annee,nom,nbUnite,codeSpecialisation,specialisation,nbHeurefrmGenerale,nbHeurefrmSpecifique,condition,sanction,commentaire,docMinistere_path,dateValidation,codeProgramme")] Programme programme)
        {
            if (ModelState.IsValid)
            {
                Trim(programme);
                db.Programme.Add(programme);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.codeProgramme = new SelectList(db.EnteteProgramme, "codeProgramme", "commentaire", programme.codeProgramme);
            return View(programme);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Programme programme = db.Programme.Find(id);
            if (programme == null)
            {
                return HttpNotFound();
            }
            return View(programme);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idProgramme, codeProgramme, annee, codeSpecialisation, nom, dateValidation, docMinistere_path, specialisation, sanction, nbUnite, condition, nbHeurefrmGenerale,nbHeurefrmSpecifique")] Programme programme, HttpPostedFileBase docMinistere_path)
        {
            if (docMinistere_path != null)
            {
                if(!UploadFile(docMinistere_path, programme))
                    ModelState.AddModelError("PDF", "Le fichier doit être de type PDF.");
            }
                
            if (ModelState.IsValid)
            {
                Trim(programme);
                db.Entry(programme).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Info", "Programme", new { idProgramme = programme.idProgramme });
            }
            return View(programme);
        }

        public bool UploadFile(HttpPostedFileBase file, Programme programme)
        {
            try
            {
                string fileName = Path.GetFileName(file.FileName);
                string path = Path.Combine(Server.MapPath("~/Files/Document ministériel"), fileName);
                string ext = fileName.Substring(fileName.Length - 4, 4);
                string oldPath = programme.docMinistere_path;
                programme.docMinistere_path = fileName;
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

        private void Trim(Programme programme)
        {
            programme.nom.Trim();
            programme.specialisation.Trim();
            programme.sanction.Trim();
            programme.nbUnite.Trim();
            programme.condition.Trim();
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
