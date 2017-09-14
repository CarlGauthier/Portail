using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ApplicationPlanCadre.Helpers;

namespace ApplicationPlanCadre.Controllers
{
    public class StageController : Controller
    {
        [customAuthorize(Roles ="Enseignant,Gestionnaire de stage")]
        // GET: Stage
        public ActionResult indexStage()
        {
            return View();
        }
    }
}