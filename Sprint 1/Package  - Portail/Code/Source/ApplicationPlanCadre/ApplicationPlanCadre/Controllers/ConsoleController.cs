using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ApplicationPlanCadre.Helpers;

namespace ApplicationPlanCadre.Controllers
{
    public class ConsoleController : Controller
    {
        [customAuthorize(Roles ="Admin")]
        // GET: Console
        public ActionResult indexConsole()
        {
            return View();
        }
    }
}