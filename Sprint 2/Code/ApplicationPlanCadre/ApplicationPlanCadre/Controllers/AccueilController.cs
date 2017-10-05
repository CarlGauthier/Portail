using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ApplicationPlanCadre.Controllers
{
    [Authorize]
    public class AccueilController : Controller
    {
        // GET: Accueil
        public ActionResult Index()
        {
            return View();
        }
    }
}