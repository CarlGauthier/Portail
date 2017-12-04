using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Dynamic;
using ApplicationPlanCadre.Models;

namespace ApplicationPlanCadre.Controllers
{
    public class GrilleCoursController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        // GET: GrilleCours
        public ActionResult Index()
        {
            return View(db.GrilleCours.ToList());
        }

        // GET: GrilleCours/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GrilleCours grilleCours = db.GrilleCours.Find(id);
            if (grilleCours == null)
            {
                return HttpNotFound();
            }
            return View(grilleCours);
        }

        // GET: GrilleCours/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: GrilleCours/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idGrille,nom")] GrilleCours grilleCours)
        {
            if (ModelState.IsValid)
            {
                db.GrilleCours.Add(grilleCours);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(grilleCours);
        }

        public ActionResult _TreeView()
        {
            var grilleCours = db.GrilleCours
                          .ToList();
            return PartialView(grilleCours);
        }

        public ActionResult _Structure(int id)
        {
            return PartialView(db.GrilleCours.Find(id));
        }

        // GET: GrilleCours/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GrilleCours grilleCours = db.GrilleCours.Find(id);
            if (grilleCours == null)
            {
                return HttpNotFound();
            }
            return View(grilleCours);
        }

        // POST: GrilleCours/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idGrille,nom")] GrilleCours grilleCours)
        {
            if (ModelState.IsValid)
            {
                db.Entry(grilleCours).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(grilleCours);
        }


        public ActionResult Info(int id)
        {

            return View(db.GrilleCours.Find(id));
        }

        public ActionResult infoHeure(int id) {
            return View(db.GrilleCours.Find(id));
        }

        public ActionResult _Heure(int id)
        {
            return PartialView(db.GrilleCours.Find(id));
        }

        public ActionResult infoPrealable(int id)
        {
            return View(db.GrilleCours.Find(id));
        }

        public ActionResult _Prealable(int id)
        {
            return PartialView(db.GrilleCours.Find(id));
        }

        private List<PlanCadre> getPlanCadre() {
            List<PlanCadre> listePlanCadre = new List<PlanCadre>();
            var list = from pc in db.PlanCadre
                       select pc;
            return list.ToList();
        }

        private GrilleCours getInfoGrille(int id) {
            var list = from grille in db.GrilleCours
                       where grille.idGrille == id
                       select grille;
            GrilleCours infoGrille = new GrilleCours();
            foreach (GrilleCours grille in list)
            {
                infoGrille.idGrille = grille.idGrille;
                infoGrille.nom = grille.nom;
            }
            return infoGrille;
        }

        private List<Cours> getCours(int id)
        {
            List<Cours> listeCours = new List<Cours>();
            var list = from a in db.Cours
                       where a.idGrille == id
                       select a;
             return list.ToList();
        }



        private List<EnonceCompetence> getEnonce()
        {
            List<EnonceCompetence> listeEnonce = new List<EnonceCompetence>();
            var list = from enonce in db.EnonceCompetence
                       select enonce;
            return list.ToList();
        }


        private List<Session> getSession()
        {
            List<Session> listeSession = new List<Session>();
            var list = from session in db.Session
                       select session;
            return list.ToList();
        }
        private List<GrilleCours> getGrilleCours(int id)
        {
            List<GrilleCours> listeGrille = new List<GrilleCours>();
            var list = from a in db.GrilleCours
                       where a.idGrille == id
                       select a;
            return list.ToList();
        }
        private List<PlanCadreEnonce> getPlanCadreEnonce()
        {
            List<PlanCadreEnonce> listePlanCadreEnonce = new List<PlanCadreEnonce>();
            var list = from planCadreEnonce in db.PlanCadreEnonce
                       select planCadreEnonce;
            return list.ToList();
        }


        private List<PlanCadre> getPlanCadre(int id) {
            List<PlanCadre> planList = new List<PlanCadre>();
            var liste = from a in db.PlanCadre
                        where id == a.idPlanCadre
                        select a;
            return liste.ToList();
        }

        // GET: GrilleCours/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GrilleCours grilleCours = db.GrilleCours.Find(id);
            if (grilleCours == null)
            {
                return HttpNotFound();
            }
            return View(grilleCours);
        }

        // POST: GrilleCours/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            GrilleCours grilleCours = db.GrilleCours.Find(id);
            db.GrilleCours.Remove(grilleCours);
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

    }
}

