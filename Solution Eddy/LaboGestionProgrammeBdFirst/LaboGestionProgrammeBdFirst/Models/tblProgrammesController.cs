using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using LaboGestionProgrammeBdFirst;
using System.IO;

namespace LaboGestionProgrammeBdFirst.Models
{
    public class tblProgrammesController : Controller
    {
        private BDtestEntities db = new BDtestEntities();
        

        // GET: tblProgrammes
        public ActionResult Index()
        {
            var tblProgramme = db.tblProgramme.Include(t => t.tblCodeProgramme);
            return View(tblProgramme.ToList());
        }

        // GET: tblProgrammes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblProgramme tblProgramme = db.tblProgramme.Find(id);
            if (tblProgramme == null)
            {
                return HttpNotFound();
            }
            int total =  int.Parse(tblProgramme.formationGeneral) + int.Parse(tblProgramme.formationSpecifique);
            ViewBag.total = total;
            return View(tblProgramme);
        }

        // GET: tblProgrammes/Create
        public ActionResult Create()
        {
            ViewBag.id = new SelectList(db.tblCodeProgramme, "id", "code");
            return View();
        }

        // POST: tblProgrammes/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,code,annee,codeSpecialisation,nbUnité,specialisation,nom,formationGeneral,formationSpecifique,condition,sanction,commentaire")] tblProgramme tblProgramme)
        {
            if (ModelState.IsValid)
            {
                db.tblProgramme.Add(tblProgramme);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.id = new SelectList(db.tblCodeProgramme, "id", "code", tblProgramme.id);
            return View(tblProgramme);
        }

        // GET: tblProgrammes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblProgramme tblProgramme = db.tblProgramme.Find(id);
            if (tblProgramme == null)
            {
                return HttpNotFound();
            }
            ViewBag.id = new SelectList(db.tblCodeProgramme, "id", "code", tblProgramme.id);
            return View(tblProgramme);
            
        }

        public ActionResult EditPath(int? id)
        {
            
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblProgramme tblProgramme = db.tblProgramme.Find(id);
            if (tblProgramme == null)
            {
                return HttpNotFound();
            }
            ViewBag.id = new SelectList(db.tblCodeProgramme, "id", "code", tblProgramme.id);
            tblProgramme.pathDocMinistere = "Test2";
            return View(tblProgramme);

        }

        // POST: tblProgrammes/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]

        //public ActionResult Edit([Bind(Include = "id,code,annee,codeSpecialisation,nbUnité,specialisation,nom,formationGeneral,formationSpecifique,condition,sanction,commentaire")] tblProgramme tblProgramme)
        public ActionResult Edit([Bind(Include = "id,code,annee,codeSpecialisation,nbUnité,specialisation,nom,formationGeneral,formationSpecifique,condition,sanction,commentaire,pathDocMinistere,dateValidation")] tblProgramme tblProgramme)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblProgramme).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.id = new SelectList(db.tblCodeProgramme, "id", "code", tblProgramme.id);
            return View(tblProgramme);
        }

        // GET: tblProgrammes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblProgramme tblProgramme = db.tblProgramme.Find(id);
            if (tblProgramme == null)
            {
                return HttpNotFound();
            }
            return View(tblProgramme);
        }

        // POST: tblProgrammes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblProgramme tblProgramme = db.tblProgramme.Find(id);
            db.tblProgramme.Remove(tblProgramme);
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

        public ActionResult ViewPdf()
        {
            return View();
        }



        public ActionResult btnModifier(int id)
        {
            return RedirectToAction("Modifier", "Edit", id);
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

        [HttpGet]
        public PartialViewResult SomeAction()
        {
            return PartialView();
        }


    }
}
