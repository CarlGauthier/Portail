using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using programmeBDDevCF.Models;
using System.IO;

namespace programmeBDDevCF.Controllers
{
    public class ProgrammeController : Controller
    {
        private BDProgramme db = new BDProgramme();

        // GET: Programme
        public ActionResult Index()
        {
            var programme = db.Programme.Include(p => p.EnteteProgramme);
            return View(programme.ToList());
        }

        // GET: Programme/Details/5
        public ActionResult Details(int? id)
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
            int total = Convert.ToInt32(programme.nbHeurefrmGenerale) + Convert.ToInt32(programme.nbHeurefrmSpecifique);
            ViewBag.total = total;
            return View(programme);
        }

        // GET: Programme/Create
        public ActionResult Create()
        {
            ViewBag.codeProgramme = new SelectList(db.EnteteProgramme, "codeProgramme", "commentaire");
            return View();
        }

        // POST: Programme/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idProgramme,annee,nom,nbUnite,codeSpecialisation,specialisation,nbHeurefrmGenerale,nbHeurefrmSpecifique,condition,sanction,commentaire,docMinistere_path,dateValidation,codeProgramme")] Programme programme)
        {
            if (ModelState.IsValid)
            {
                db.Programme.Add(programme);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.codeProgramme = new SelectList(db.EnteteProgramme, "codeProgramme", "commentaire", programme.codeProgramme);
            return View(programme);
        }

        // GET: Programme/Edit/5
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
            ViewBag.codeProgramme = new SelectList(db.EnteteProgramme, "codeProgramme", "commentaire", programme.codeProgramme);
            return View(programme);
        }

        // POST: Programme/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idProgramme,annee,nbUnite,codeSpecialisation,specialisation,nbHeurefrmGenerale,nbHeurefrmSpecifique,condition,sanction,commentaire,docMinistere_path,dateValidation,idCodeProgramme")] Programme programme)
        {
            if (ModelState.IsValid)
            {
                db.Entry(programme).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.codeProgramme = new SelectList(db.EnteteProgramme, "codeProgramme", "commentaire", programme.codeProgramme);
            return View(programme);
        }

        // GET: Programme/Delete/5
        public ActionResult Delete(int? id)
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

        // POST: Programme/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Programme programme = db.Programme.Find(id);
            db.Programme.Remove(programme);
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

        [HttpGet]
        public ActionResult UploadFile()
        {
            return View();
        }
        [HttpPost]
        public ActionResult UploadFile(HttpPostedFileBase file)
        {
            try
            {
                if (file.ContentLength > 0)
                {
                    string _FileName = Path.GetFileName(file.FileName);
                    string _path = Path.Combine(Server.MapPath("~/UploadedFiles"), _FileName);
                    file.SaveAs(_path);
                }
                ViewBag.Message = "File Uploaded Successfully!!";
                return View();
            }
            catch
            {
                ViewBag.Message = "File upload failed!!";
                return View();
            }
        }

    }
}
