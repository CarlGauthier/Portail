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
        public ActionResult Create()
        {
            ViewBag.idProgramme = new SelectList(db.Programme, "idProgramme", "code");
            return View();
        }

        // POST: EnonceCompetences/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idCompetence,codeCompetence,enonceCompetence1,motClef,obligatoire,actif,commentaire,idProgramme")] EnonceCompetence enonceCompetence)
        {
            if (ModelState.IsValid)
            {
                db.EnonceCompetence.Add(enonceCompetence);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idProgramme = new SelectList(db.Programme, "idProgramme", "code", enonceCompetence.idProgramme);
            return View(enonceCompetence);
        }

        // GET: EnonceCompetences/Edit/5
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
            ViewBag.idProgramme = new SelectList(db.Programme, "idProgramme", "code", enonceCompetence.idProgramme);
            return View(enonceCompetence);
        }

        // POST: EnonceCompetences/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
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

        // GET: EnonceCompetences/Delete/5
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

        // POST: EnonceCompetences/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            EnonceCompetence enonceCompetence = db.EnonceCompetence.Find(id);
            db.EnonceCompetence.Remove(enonceCompetence);
            db.SaveChanges();
            return RedirectToAction("Index");
        }


        /*-------------------------------- COMPÉTENCE --------------------------------*/

        public ActionResult CreateCompetence(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EnonceCompetence competence = db.EnonceCompetence.Find(id);
            if (competence == null)
            {
                return HttpNotFound();
            }
            return View(competence);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateCompetence([Bind(Include = "idProgramme,codeCompetence,enonceCompetence1,obligatoire,actif")] EnonceCompetence competence)
        {
            if (ModelState.IsValid)
            {
                db.EnonceCompetence.Add(competence);
                db.SaveChanges();
                return RedirectToAction("Details", new { id = competence.idProgramme });
            }

            return View(competence);
        }

        //public ActionResult _partialContexte(int? id)
        //{
        //    var contexte = db.EnonceCompetence.SingleOrDefault(x => x.idCompetence == id);
        //    return View(contexte); 
        //}

        public ActionResult _partialCreateContexte()
        {
            return View();
        }
        public void createContexte([Bind(Include = "contexteRealisation1,idCompetence")] ContexteRealisation contexte)
        {
            if (ModelState.IsValid)
            {
                db.ContexteRealisation.Add(contexte);
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
