using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ApplicationPlanCadre.Controllers
{
    public class ConsoleController : Controller
    {
        [Authorize]
        // GET: Console
        public ActionResult indexConsole()
        {
            return View();
        }
    }
}