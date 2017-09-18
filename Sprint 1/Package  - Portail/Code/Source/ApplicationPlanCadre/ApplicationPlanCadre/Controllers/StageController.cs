using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ApplicationPlanCadre.Helpers;

namespace ApplicationPlanCadre.Controllers
{
    [customAuthorize(Roles = "Enseignant, Gestionnaire de stage")]
    public class StageController : Controller
    {
        
        // GET: Stage
        public ActionResult indexStage()
        {
            return View();
        }
    }
}