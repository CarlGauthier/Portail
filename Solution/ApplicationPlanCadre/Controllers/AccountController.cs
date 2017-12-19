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
    [Authorize(Roles = "Admin")]
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

        public void RegisterModelDefault(RegisterViewModel model, IEnumerable<string> role, IEnumerable<string> codeProgramme)
        {
            if (role != null)
                model.Roles = role;
            else
                model.Roles = new List<string>();

            if (codeProgramme != null)
                model.CodeProgrammes = codeProgramme;
            else
                model.CodeProgrammes = new List<string>();
        }

        public void EditModelDefault(EditUserViewModel model, IEnumerable<string> role, IEnumerable<string> codeProgramme)
        {
            if (role != null)
                model.Roles = role;
            else
                model.Roles = new List<string>();

            if (codeProgramme != null)
                model.CodeProgrammes = codeProgramme;
            else
                model.CodeProgrammes = new List<string>();
        }

        public ActionResult Register()
        {
            ViewBag.role = BuildRoleSelectList();
            ViewBag.codeProgramme = new ConsoleDevisMinistereController().BuildCodeDevisMinistereSelectList();
            RegisterViewModel model = new RegisterViewModel();
            RegisterModelDefault(model, null, null);
            return View(model);
        }

        private bool IsRCP(ICollection<string> role)
        {
            bool isRCP = false;
            if(role != null)
                foreach (string r in role)
                    if (r == "RCP")
                    {
                        isRCP = true;
                        break;
                    }
            return isRCP;
        }

        private void CreateRCPAccesProgramme(ApplicationUser user, ICollection<string> codeProgramme)
        {
            BDPlanCadre bd = new BDPlanCadre();
            foreach(string code in codeProgramme)
            {
                AccesProgramme accesProgramme = new AccesProgramme { userMail = user.UserName, codeProgramme = code };
                bd.AccesProgramme.Add(accesProgramme);
            }
            bd.SaveChanges();
        }

        private void RemoveAllRCPAccesProgramme(ApplicationUser user)
        {
            BDPlanCadre bd = new BDPlanCadre();
            bd.AccesProgramme.RemoveRange(bd.AccesProgramme.Where(e => e.userMail == user.UserName));
            bd.SaveChanges();
        }

        private void EditRCPAccesProgramme(ApplicationUser user, ICollection<string> codeProgramme)
        {
            RemoveAllRCPAccesProgramme(user);
            CreateRCPAccesProgramme(user, codeProgramme);
        }

        private void EditRoles(ApplicationUser user, ICollection<string> role)
        {
            UserManager.RemoveFromRoles(user.Id, user.roles.ToArray());
            UserManager.AddToRoles(user.Id, role.ToArray());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(RegisterViewModel model, ICollection<string> role, ICollection<string> codeProgramme)
        {
            bool rolePresent = role != null;
            bool isRCP = IsRCP(role);
            bool programmeRCP = isRCP && codeProgramme != null || !isRCP;
            
            if (ModelState.IsValid && rolePresent && programmeRCP)
            {
                string password = new PasswordGenerator().GeneratePassword(10);
                ApplicationUser user = new ApplicationUser { nom = model.Nom, prenom = model.Prenom, UserName = model.Email, Email = model.Email };
                bool mailSend = new MailHelper().SendActivationMail(user, password);
                if(mailSend)
                {
                    var result = UserManager.Create(user, password);
                    if (result.Succeeded)
                    {
                        UserManager.AddToRoles(user.Id, role.ToArray());
                        if (isRCP)
                            CreateRCPAccesProgramme(user, codeProgramme);
                        return RedirectToAction("Index", "Account");
                    }
                    AddErrors(result);
                }
                else
                    ModelState.AddModelError("netMail", "Une erreur est survenue lors de l'envoi du courriel, veuillez réessayer plus tard.");
            }
            if (!rolePresent)
                ModelState.AddModelError("rolePresent", "L'utilisateur doit avoir au minimum un rôle.");
            if (!programmeRCP)
                ModelState.AddModelError("rolePresent", "Un RCP doit avoir au minimum un programme d'assigné.");

            RegisterModelDefault(model, role, codeProgramme);
            ViewBag.role = BuildRoleSelectList();
            ViewBag.codeProgramme = new ConsoleDevisMinistereController().BuildCodeDevisMinistereSelectList();
            return View(model);
        }

        private IEnumerable<string> GetCodeProgrammes(ApplicationUser user)
        {
            return (from accesProgramme in new BDPlanCadre().AccesProgramme
                    where accesProgramme.userMail == user.UserName
                    select accesProgramme.codeProgramme).ToList();
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
            EditUserViewModel model = new EditUserViewModel { UserId = user.Id, Prenom = user.prenom, Nom = user.nom, Email = user.Email, Roles = UserManager.GetRoles(user.Id), CodeProgrammes = GetCodeProgrammes(user) };
            ViewBag.role = BuildRoleSelectList();
            ViewBag.codeProgramme = new ConsoleDevisMinistereController().BuildCodeDevisMinistereSelectList();
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(EditUserViewModel model, ICollection<string> role, ICollection<string> codeProgramme)
        {
            bool rolePresent = role != null;
            bool isRCP = IsRCP(role);
            bool programmeRCP = isRCP && codeProgramme != null || !isRCP;

            if (ModelState.IsValid && rolePresent && programmeRCP)
            {
                string password = new PasswordGenerator().GeneratePassword(10);
                ApplicationUser user = UserManager.FindById(model.UserId);
                user.prenom = model.Prenom;
                user.nom = model.Nom;
                user.roles = UserManager.GetRoles(user.Id);
                var resultMail = UserManager.SetEmail(model.UserId, model.Email);
                if (resultMail.Succeeded)
                {
                    bool mailSend = new MailHelper().SendEditMail(user, password);
                    if(mailSend)
                    {
                        var resultUpdate = UserManager.Update(user);
                        if(resultUpdate.Succeeded)
                        {
                            EditRoles(user, role);
                            if (isRCP)
                                EditRCPAccesProgramme(user, codeProgramme);
                            else
                                RemoveAllRCPAccesProgramme(user);
                            return RedirectToAction("Index", "Account");
                        }
                        AddErrors(resultUpdate);
                    }
                    else
                        ModelState.AddModelError("netMail", "Une erreur est survenue lors de l'envoi du courriel, veuillez réessayer plus tard.");
                }
                AddErrors(resultMail);
            }
            if (!rolePresent)
                ModelState.AddModelError("rolePresent", "L'utilisateur doit avoir au minimum un rôle.");
            if (!programmeRCP)
                ModelState.AddModelError("rolePresent", "Un RCP doit avoir au minimum un programme d'assigné.");

            EditModelDefault(model, role, codeProgramme);
            ViewBag.role = BuildRoleSelectList();
            ViewBag.codeProgramme = new ConsoleDevisMinistereController().BuildCodeDevisMinistereSelectList();
            return View(model);
        }

        private SelectList BuildRoleSelectList()
        {
            var liste = db.Roles.Select(e => e.Name).ToList();
            return new SelectList(liste, "role");
        }

        [HttpPost]
        [AllowAnonymous]
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