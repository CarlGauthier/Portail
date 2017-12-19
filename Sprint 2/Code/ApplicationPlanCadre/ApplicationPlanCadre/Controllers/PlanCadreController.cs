using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ApplicationPlanCadre.Models;

namespace ApplicationPlanCadre.Controllers
{
    public class PlanCadreController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        public ActionResult _TreeView()
        {
            var planCadre = db.PlanCadre.ToList();

            return PartialView(planCadre);
        }

        public ActionResult Index()
        {
            return View(db.PlanCadre.ToList());
        }

        public ActionResult Create(int? idProgramme)
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
            PlanCadre planCadre = new PlanCadre();
            planCadre.idProgramme = programme.idProgramme;
            return View(planCadre);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idPlanCadre,numeroCours,titreCours,indicationPedago,environementPhys,ressource,nbHeureTheorie,nbHeurePratique,nbHeureDevoir,idProgramme")] PlanCadre planCadre)
        {
            planCadre.idType = 1;
            bool existe;
            existe = db.PlanCadre.Any(pc => pc.titreCours == planCadre.titreCours && pc.idProgramme == planCadre.idProgramme);
            //Trim();
            if (!existe && ModelState.IsValid)
            {
                db.PlanCadre.Add(planCadre);
                db.SaveChanges();
                return RedirectToAction("Competence", new { idPlanCadre = planCadre.idPlanCadre });
                //return RedirectToAction("info", "Programme", new { idProgramme = planCadre.idProgramme });
            }
            if (existe)
                ModelState.AddModelError("Duplique", "Erreur, un plan cadre avec ce nom existe déjà.");
            return View(planCadre);
        }

        public ActionResult Competence(int? idPlanCadre)
        {
            ViewBag.enonce = BuildEnonceSelectList();
            if (idPlanCadre == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlanCadre planCadre = db.PlanCadre.Find(idPlanCadre);
            if (planCadre == null)
            {
                return HttpNotFound();
            }
            return View(planCadre);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Competence(int idProgramme, int idPlancadre,ICollection<int> ponderationEnHeure, ICollection<int> enonces, ICollection<int> elements)
        {
            List<EnonceCompetence> listeEnonce = new List<EnonceCompetence>();
            List<ElementCompetence> listeELement = new List<ElementCompetence>();
            List<int> listePonderation = new List<int>();
            int cpt = 0;
            if(ponderationEnHeure != null)
            {
                foreach (var ponderation in ponderationEnHeure)
                {
                    listePonderation.Add(ponderation);
                }
            }

            if(enonces != null)
            {
                foreach (var e in enonces)
                {
                    var EnonceCompetence = from a in db.EnonceCompetence
                                           where a.idCompetence == e
                                           select a;
                    listeEnonce.AddRange(EnonceCompetence);
                }

                foreach (var i in listeEnonce)
                {
                    PlanCadreEnonce planCadreEnonce = new PlanCadreEnonce();
                    planCadreEnonce.idPlanCadre = idPlancadre;
                    planCadreEnonce.idCompetence = i.idCompetence;
                    planCadreEnonce.ponderationEnHeure = listePonderation[cpt];
                    //if (ModelState.IsValid)
                    //{
                    //    db.PlanCadreEnonce.Add(planCadreEnonce);
                    //    db.SaveChanges();
                    //}
                    cpt++;
                }
            }

            if(elements != null)
            {
                foreach (var x in elements)
                {
                    var ElementCompetence = from y in db.ElementCompetence
                                            where y.idElement == x
                                            select y;
                    listeELement.AddRange(ElementCompetence);
                }

                foreach (var z in listeELement)
                {
                    PlanCadreElement planCadreElement = new PlanCadreElement();
                    planCadreElement.idPlanCadre = idPlancadre;
                    planCadreElement.idElement = z.idElement;
                    planCadreElement.idElementConnaissance = 1;
                    if (ModelState.IsValid)
                    {
                        db.PlanCadreElement.Add(planCadreElement);
                        db.SaveChanges();
                    }
                }
            }
            ElementConnaissance elementConnaissance = new ElementConnaissance();
            ViewBag.planCadreElement = BuildElementSelectList(idPlancadre);
            return View("Connaissance", elementConnaissance);
        }

        [HttpPost]
        public ActionResult Connaissance()
        {
            return RedirectToAction("Index", "Programme");
        }
        public ActionResult Edit(int? idPlanCadre)
        {
            if (idPlanCadre == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlanCadre planCadre = db.PlanCadre.Find(idPlanCadre);
            if (planCadre == null)
            {
                return HttpNotFound();
            }
            return View(planCadre);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idPlanCadre,numeroCours,titreCours,indicationPedago,environementPhys,ressource,nbHeureTheorie,nbHeurePratique,nbHeureDevoir,idProgramme")] PlanCadre planCadre)
        {
            bool existe;
            existe = db.PlanCadre.Any(pc => pc.idProgramme != planCadre.idProgramme && pc.titreCours == planCadre.titreCours);
            //Trim();
            if (!existe && ModelState.IsValid)
            {
                db.Entry(planCadre).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("info", new { idPlanCadre = planCadre.idPlanCadre });
            }
            if (existe)
                ModelState.AddModelError("Duplique", "Erreur, un plan cadre avec ce nom existe déjà.");
            return View(planCadre);
        }

        private SelectList BuildEnonceSelectList()
        {
            var enonce = db.EnonceCompetence;
            List<SelectListItem> liste = new List<SelectListItem>();
            foreach(EnonceCompetence e in enonce)
            {
                liste.Add(new SelectListItem { Value = e.idCompetence.ToString(), Text = e.description });
            }
            return new SelectList(liste, "Value", "Text");
        }

        private SelectList BuildElementSelectList(int idPlanCadre)
        {
            var elementPlanCadre = from a in db.PlanCadreElement
                                   where a.idPlanCadre == idPlanCadre
                                   select a.ElementCompetence;

            List<SelectListItem> liste = new List<SelectListItem>();
            foreach(ElementCompetence e in elementPlanCadre)
            {
                liste.Add(new SelectListItem { Value = e.idElement.ToString(), Text = e.description });
            }
            return new SelectList(liste, "Value", "Text");
        }
        public ActionResult Info(int? idPlanCadre)
        {
            if (idPlanCadre == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlanCadre planCadre = db.PlanCadre.Find(idPlanCadre);
            if (planCadre == null)
            {
                return HttpNotFound();
            }
            return View(planCadre);
        }
    }
} 