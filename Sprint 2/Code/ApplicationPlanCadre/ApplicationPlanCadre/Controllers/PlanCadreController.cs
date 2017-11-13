using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ApplicationPlanCadre.Models;

namespace ApplicationPlanCadre.Controllers
{
    public class PCInstanceController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();
        // GET: PCInstance
        public ActionResult Index()
        {
            return View();
        }
    }
}