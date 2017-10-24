
﻿//http://www.c-sharpcorner.com/article/upload-files-in-asp-net-mvc-5/

using ApplicationPlanCadre.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace ApplicationPlanCadre.Controllers
{
    public class UploadController : Controller
    {

        private BDPlanCadre db = new BDPlanCadre();


        public static int noProgramme{get; set;}

        // GET: Upload
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult UploadFile(int? id)
        {
           
                
            noProgramme = id.GetValueOrDefault();               //https://stackoverflow.com/questions/5995317/how-to-convert-c-sharp-nullable-int-to-int
            Programme programme = db.Programme.Find(id);
            if (programme == null)
            {
                return HttpNotFound();
            }
            ViewBag.codeProgramme = new SelectList(db.EnteteProgramme, "codeProgramme", "commentaire", programme.codeProgramme);
            return View(programme);
            //return View();
        }
        [HttpPost]
        public ActionResult UploadFile(HttpPostedFileBase file)
        {
            Programme programme = db.Programme.Find(noProgramme);
            try
            {
                if (file.ContentLength > 0)
                {
                    string _FileName = Path.GetFileName(file.FileName);
                    string _path = Path.Combine(Server.MapPath("~/UploadedFiles"), _FileName);
                    file.SaveAs(_path);
                }
                ViewBag.Message = "Téléchargement réussi!!";
                enregistrerPathBase(programme, Path.GetFileName(file.FileName));
                return View(programme);

            }
            catch
            {
                ViewBag.Message = "Échec du téléchargement!!";
                return View(programme);
            }
        }

        public void enregistrerPathBase(Programme programme, string _FileName) {
            programme.docMinistere_path = _FileName;
            db.Entry(programme).State = EntityState.Modified;
            db.SaveChanges();
        }


        //Ajout le 11/10/2017 Pas réussi à passer l'id en paramètre
        public ActionResult UploadFileId(HttpPostedFileBase file, int? id)
        {
            //ViewBag.Message = "UploadFile avec deux paramètres";

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
                return View(programme);
            }
        }

    }
}