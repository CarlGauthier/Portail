using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using ApplicationPlanCadre.Models;

//Solution en provenance de https://stackoverflow.com/questions/11493873/how-to-implement-custom-authorize-attribute-for-the-following-case

namespace ApplicationPlanCadre.Helpers
{
    public abstract class RCPAuthorize : AuthorizeAttribute
    {
        protected BDPlanCadre db = new BDPlanCadre();
        protected abstract string idName { get; }

        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            var authorized = base.AuthorizeCore(httpContext);
            if (!authorized)
            {
                // The user is not authenticated
                return false;
            }

            var user = httpContext.User;
            if (user.IsInRole("RCP"))
            {
                return ModelVerification(httpContext);
            }
            return false;
        }

        protected virtual bool ModelVerification(HttpContextBase httpContext)
        {
            var rd = httpContext.Request.RequestContext.RouteData;
            string id = httpContext.Request.Params.Get(idName);
            if (id == null || id == "0")
                return true;
            //Cette ligne cause une exception si il y a un doublon de l'ID dans l'url, assuré vous d'avoir chaque champ une seule fois si le problème survient.
            return isRCPOwner(httpContext.User.Identity.Name, Convert.ToInt32(id));
        }

        protected abstract bool isRCPOwner(string username, int id);
    }

    public class RCPDevisMinistereAuthorize : RCPAuthorize
    {
        protected override string idName { get { return "idDevis"; } }

        protected override bool isRCPOwner(string username, int id)
        {
            DevisMinistere devisMinistere = db.DevisMinistere.Find(id);
            return db.AccesProgramme.Any(e => e.codeProgramme == devisMinistere.EnteteProgramme.codeProgramme);
        }
    }

    public class RCPEnonceCompetenceAuthorize : RCPAuthorize
    {
        protected override string idName { get { return "idCompetence"; } }

        protected override bool isRCPOwner(string username, int id)
        {
            EnonceCompetence enonceCompetence = db.EnonceCompetence.Find(id);
            return db.AccesProgramme.Any(e => e.codeProgramme == enonceCompetence.DevisMinistere.EnteteProgramme.codeProgramme);
        }
    }

    public class RCPContexteRealisationAuthorize : RCPAuthorize
    {
        protected override string idName { get { return "idContexte"; } }

        protected override bool isRCPOwner(string username, int id)
        {
            ContexteRealisation contexteRealisation = db.ContexteRealisation.Find(id);
            return db.AccesProgramme.Any(e => e.codeProgramme == contexteRealisation.EnonceCompetence.DevisMinistere.EnteteProgramme.codeProgramme);
        }
    }

    public class RCPElementCompetenceAuthorize : RCPAuthorize
    {
        protected override string idName { get { return "idElement"; } }

        protected override bool isRCPOwner(string username, int id)
        {
            ElementCompetence elementCompetence = db.ElementCompetence.Find(id);
            return db.AccesProgramme.Any(e => e.codeProgramme == elementCompetence.EnonceCompetence.DevisMinistere.EnteteProgramme.codeProgramme);
        }
    }

    public class RCPCriterePerformanceAuthorize : RCPAuthorize
    {
        protected override string idName { get { return "idCritere"; } }

        protected override bool isRCPOwner(string username, int id)
        {
            CriterePerformance criterePerformance = db.CriterePerformance.Find(id);
            return db.AccesProgramme.Any(e => e.codeProgramme == criterePerformance.ElementCompetence.EnonceCompetence.DevisMinistere.EnteteProgramme.codeProgramme);
        }
    }

    public class RCPProgrammeAuthorize : RCPAuthorize
    {
        protected override string idName { get { return "idProgramme"; } }

        protected override bool isRCPOwner(string username, int id)
        {
            Programme programme = db.Programme.Find(id);
            return db.AccesProgramme.Any(e => e.codeProgramme == programme.DevisMinistere.EnteteProgramme.codeProgramme);
        }
    }

    public class RCPPlanCadreAuthorize : RCPAuthorize
    {
        protected override string idName { get { return "idPlanCadre"; } }

        protected override bool isRCPOwner(string username, int id)
        {
            PlanCadre planCadre = db.PlanCadre.Find(id);
            return db.AccesProgramme.Any(e => e.codeProgramme == planCadre.Programme.DevisMinistere.EnteteProgramme.codeProgramme);
        }
    }
}
