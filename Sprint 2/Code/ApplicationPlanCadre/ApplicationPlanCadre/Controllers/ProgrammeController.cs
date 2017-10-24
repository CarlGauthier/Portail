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

        //[Route("Programme/{id:int?}", Name = "Details-programme")]
        public ActionResult Info(int? id)
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
            ViewBag.total = programme.nbHeurefrmGenerale + programme.nbHeurefrmSpecifique;
            //ViewBag.dateValidation = checkValidation(programme);
            return View(programme);
        }

        //[Route("Programme/editer/{id:int?}", Name = "edit-prog")]
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
            if(docMinistere_path != null)
                UploadFile(docMinistere_path, programme);
            if (ModelState.IsValid)
            {
                db.Entry(programme).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Info", "Programme", new { id = programme.idProgramme });
            }
            Trim(programme);
            return View(programme);
        }

        public bool UploadFile(HttpPostedFileBase file, Programme programme)
        {
            try
            {
                string fileName = Path.GetFileName(file.FileName);
                string path = Path.Combine(Server.MapPath("~/Files/Document ministériel"), fileName);
                file.SaveAs(path);
                if (programme.docMinistere_path != null)
                    DeleteFile(programme.docMinistere_path);
                programme.docMinistere_path = fileName;
                return true;
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
