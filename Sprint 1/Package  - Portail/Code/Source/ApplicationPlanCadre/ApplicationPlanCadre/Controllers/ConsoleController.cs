using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ApplicationPlanCadre.Helpers;

namespace ApplicationPlanCadre.Controllers
{
    [customAuthorize(Roles = "Admin")]
    public class ConsoleController : Controller
    {
        
        // GET: Console
        public ActionResult indexConsole()
        {
            return View();
        }
    }
}