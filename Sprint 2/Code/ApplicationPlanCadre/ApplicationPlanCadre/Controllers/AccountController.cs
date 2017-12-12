using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Net;
using System.Web.Mvc;
using ApplicationPlanCadre.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using ApplicationPlanCadre.Helpers;
using System.Web.Security;

namespace ApplicationPlanCadre.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        public AccountController()
        {

        }

        public AccountController(ApplicationUserManager userManager, ApplicationSignInManager signInManager )
        {
            UserManager = userManager;
            SignInManager = signInManager;
        }

        public ActionResult Index()
        {
            var users = db.Users.ToList();
            foreach (var user in users)
            {
                user.roles = UserManager.GetRoles(user.Id);
            }
            return View(users);
        }

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set 
            { 
                _signInManager = value; 
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        [AllowAnonymous]
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        public ActionResult Login(string returnUrl)
        {
            string psw = new PasswordGenerator().GeneratePassword(10);
            if (User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index", "Accueil");
            }
            ViewBag.ReturnUrl = returnUrl ?? Url.Action("Index", "Accueil");
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Login(LoginViewModel model, string returnUrl)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var result = await SignInManager.PasswordSignInAsync(model.Email, model.Password, model.RememberMe, shouldLockout: false);
            switch (result)
            {
                case SignInStatus.Success:
                    return RedirectToLocal(returnUrl);
                case SignInStatus.LockedOut:
                    return View("Lockout");
                case SignInStatus.RequiresVerification:
                    return RedirectToAction("SendCode", new { ReturnUrl = returnUrl, RememberMe = model.RememberMe });
                case SignInStatus.Failure:
                default:
                    ModelState.AddModelError("", "Tentative de connexion non valide.");
                    return View(model);
            }
        }

        [AllowAnonymous]
        public ActionResult Register()
        {
            ViewBag.roles = BuildRoleSelectList();
            ViewBag.codeProgramme = new ConsoleDevisMinistereController().BuildCodeDevisMinistereSelectList();
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Register(RegisterViewModel model, ICollection<string> roles)
        {
            if (ModelState.IsValid)
            {
                string password = new PasswordGenerator().GeneratePassword(10);
                var user = new ApplicationUser { nom = model.Nom, prenom = model.Prenom, UserName = model.Email, Email = model.Email };
                var result = await UserManager.CreateAsync(user, password);
                if (result.Succeeded)
                {
                    UserManager.AddToRoles(user.Id, roles.ToArray());
                    new MailHelper().SendActivationMail(user, password);
                    return RedirectToAction("Index", "Account");
                }
                AddErrors(result);
            }
            ViewBag.roles = BuildRoleSelectList();
            ViewBag.codeProgramme = new ConsoleDevisMinistereController().BuildCodeDevisMinistereSelectList();
            return View(model);
        }

        public ActionResult Edit(string userId)
        {
            if (userId == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ApplicationUser user = UserManager.FindById(userId);
            if (user == null)
            {
                return HttpNotFound();
            }
            EditUserViewModel model = new EditUserViewModel { UserId = user.Id, Prenom = user.prenom, Nom = user.nom, Email = user.Email, Roles = UserManager.GetRoles(user.Id) };
            ViewBag.roles = BuildRoleSelectList();
            ViewBag.codeProgramme = new ConsoleDevisMinistereController().BuildCodeDevisMinistereSelectList();
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(EditUserViewModel model)
        {
            if (ModelState.IsValid)
            {
                var result = UserManager.SetEmail(model.UserId, model.Email);
                if (!result.Succeeded)
                    AddErrors(result);

                var user = UserManager.FindById(model.UserId);
                user.prenom = model.Prenom;
                user.nom = model.Nom;
                user.roles = UserManager.GetRoles(user.Id);

                result = UserManager.Update(user);
                if (result.Succeeded)
                {
                    string password = new PasswordGenerator().GeneratePassword(10);

                    new MailHelper().SendEditMail(user, password);
                    new RolesHelper().ChangeRoles(user, model.Roles, UserManager);

                    return RedirectToAction("Index", "Account");
                }
                AddErrors(result);
            }
            return View(model);
        }

        private SelectList BuildRoleSelectList()
        {
            var liste = db.Roles.Select(e => e.Name).ToList();
            return new SelectList(liste, "role");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogOff()
        {
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            return RedirectToAction("Login", "Account");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (_userManager != null)
                {
                    _userManager.Dispose();
                    _userManager = null;
                }

                if (_signInManager != null)
                {
                    _signInManager.Dispose();
                    _signInManager = null;
                }
            }

            base.Dispose(disposing);
        }

        #region Applications auxiliaires
        // Utilisé(e) pour la protection XSRF lors de l'ajout de connexions externes
        private const string XsrfKey = "XsrfId";

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            return RedirectToAction("Index", "Accueil");
        }

        internal class ChallengeResult : HttpUnauthorizedResult
        {
            public ChallengeResult(string provider, string redirectUri)
                : this(provider, redirectUri, null)
            {
            }

            public ChallengeResult(string provider, string redirectUri, string userId)
            {
                LoginProvider = provider;
                RedirectUri = redirectUri;
                UserId = userId;
            }

            public string LoginProvider { get; set; }
            public string RedirectUri { get; set; }
            public string UserId { get; set; }

            public override void ExecuteResult(ControllerContext context)
            {
                var properties = new AuthenticationProperties { RedirectUri = RedirectUri };
                if (UserId != null)
                {
                    properties.Dictionary[XsrfKey] = UserId;
                }
                context.HttpContext.GetOwinContext().Authentication.Challenge(properties, LoginProvider);
            }
        }
        #endregion
    }
}