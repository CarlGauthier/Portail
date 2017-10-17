using ApplicationPlanCadre.Helpers;
using ApplicationPlanCadre.Models;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace ApplicationPlanCadre.Controllers
{
    [customAuthorize(Roles ="RCP")]
    public class EnonceCompetencesController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        // GET: EnonceCompetences
        public ActionResult Index()
        {
            var enonceCompetence = db.EnonceCompetence.Include(e => e.Programme);
            return View(enonceCompetence.ToList());
        }

        // GET: EnonceCompetences/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EnonceCompetence enonceCompetence = db.EnonceCompetence.Find(id);
            if (enonceCompetence == null)
            {
                return HttpNotFound();
            }
            return View(enonceCompetence);
        }

        // GET: EnonceCompetences/Create
        public ActionResult Create(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EnonceCompetence enonceCompetence = db.EnonceCompetence.Find(id);
            if (enonceCompetence == null)
            {
                return HttpNotFound();
            }
            return View(enonceCompetence);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idProgramme,codeCompetence,enonceCompetence1,obligatoire,actif")] EnonceCompetence enonceCompetence)
        {
            if (ModelState.IsValid)
            {
                db.EnonceCompetence.Add(enonceCompetence);
                db.SaveChanges();
                return RedirectToAction("Details", "Programme", new { id = enonceCompetence.idProgramme });
            }

            return View(enonceCompetence);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EnonceCompetence enonceCompetence = db.EnonceCompetence.Find(id);
            if (enonceCompetence == null)
            {
                return HttpNotFound();
            }
            return View(enonceCompetence);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idCompetence,codeCompetence,enonceCompetence1,motClef,obligatoire,actif,commentaire,idProgramme")] EnonceCompetence enonceCompetence)
        {
            if (ModelState.IsValid)
            {
                db.Entry(enonceCompetence).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idProgramme = new SelectList(db.Programme, "idProgramme", "code", enonceCompetence.idProgramme);
            return View(enonceCompetence);
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EnonceCompetence enonceCompetence = db.EnonceCompetence.Find(id);
            if (enonceCompetence == null)
            {
                return HttpNotFound();
            }
            return View(enonceCompetence);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            EnonceCompetence enonceCompetence = db.EnonceCompetence.Find(id);
            db.EnonceCompetence.Remove(enonceCompetence);
            db.SaveChanges();
            return RedirectToAction("Index");
        }


        /*-------------------------------- CONTEXTE --------------------------------*/



        //public ActionResult _partialContexte(int? id)
        //{
        //    var contexte = db.EnonceCompetence.SingleOrDefault(x => x.idCompetence == id);
        //    return View(contexte); 
        //}

        public ActionResult _partialCreateContexte(int? id)
        {
            ContexteRealisation contexte = db.ContexteRealisation.Find(id);
            return View(contexte);
        }
        public void createContexte([Bind(Include = "idContexte,contexteRealisation1,commentaire,idCompetence")] ContexteRealisation contexteRealisation)
        {
            if (ModelState.IsValid)
            {
                db.ContexteRealisation.Add(contexteRealisation);
                db.SaveChanges();
            }
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
