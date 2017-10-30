using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Dynamic;
using System.Web.Mvc;
using System.Data.Entity;
using System.Configuration;
using ApplicationPlanCadre.Helpers;
using Rotativa;


using ApplicationPlanCadre.Models;

namespace ApplicationPlanCadre.Controllers
{
    public class rechercheController : Controller
    {

        // GET: recherche
        public ActionResult Index()
        {
            return View("recherche");
        }

        [HttpPost]
        public ActionResult Rechercher(string searchStr, bool chkRecherche)
        {
            dynamic model = new ExpandoObject();
            if (chkRecherche)
            {
                model.Programme = getProgramme(searchStr);
                model.EnonceCompetence = getEnoncerComp(searchStr);
            }
            else
            {
                model.EnonceCompetence = getEnoncerComp(searchStr);
            model.ElementCompetence = getElemComp(searchStr);
            model.EnteteProgramme = getEnteteProg(searchStr);
            model.Programme = getProgramme(searchStr);
            model.CriterePerformance = getCritPerf(searchStr);
            model.ContexteRealisation = getContextReal(searchStr);
            }
            
            
            
            return PartialView("_afficherRecherche",model);
        }
        private static List<SecondaryEnonceCompetence> getEnoncerComp(string searchStr)
        {
            string strSearch = "\'%" + searchStr + "%\'";
            List<SecondaryEnonceCompetence> EnoncerCompt = new List<SecondaryEnonceCompetence>();
            string query = "SELECT idCompetence,codeCompetence,enonceCompetence,commentaire FROM EnonceCompetence WHERE enonceCompetence LIKE " + strSearch + " OR codeCompetence LIKE " + strSearch +" OR commentaire LIKE " + strSearch;
            string constr = ConfigurationManager.ConnectionStrings["BDPlanCadre"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection=con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            EnoncerCompt.Add(new SecondaryEnonceCompetence
                            {
                                idCompetence = Convert.ToInt32(sdr["idCompetence"]),
                                codeCompetence = sdr["codeCompetence"].ToString().HighlightKeyWords(searchStr, "yellow", false),
                                enonceCompetence1=sdr["enonceCompetence"].ToString().HighlightKeyWords(searchStr,"yellow",false),//
                                commentaire=sdr["commentaire"].ToString().HighlightKeyWords(searchStr, "yellow", false)
                            });
                        }
                    }
                    con.Close();
                    return EnoncerCompt;
                }
            }
        }
        private static List<SecondaryElementCompetence>getElemComp(string searchStr)
        {
            string strSearch = "\'%" + searchStr + "%\'";
            List<SecondaryElementCompetence> EnoncerCompt = new List<SecondaryElementCompetence>();
            string query = "SELECT idElement,element,commentaire FROM ElementCompetence WHERE element LIKE " + strSearch + " OR commentaire LIKE " + strSearch;
            string constr = ConfigurationManager.ConnectionStrings["BDPlanCadre"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            EnoncerCompt.Add(new SecondaryElementCompetence
                            {
                                idElement = Convert.ToInt32(sdr["idElement"]),
                                element = sdr["element"].ToString().HighlightKeyWords(searchStr, "yellow", false),
                                commentaire = sdr["commentaire"].ToString().HighlightKeyWords(searchStr, "yellow", false)
                            });
                        }
                    }
                    con.Close();
                    return EnoncerCompt;
                }
            }
        }
        private static List<SecondaryEnteteProgramme> getEnteteProg(string searchStr)
        {
            string strSearch = "\'%" + searchStr + "%\'";
            List<SecondaryEnteteProgramme> EnoncerCompt = new List<SecondaryEnteteProgramme>();
            string query = "SELECT codeProgramme,commentaire FROM EnteteProgramme WHERE codeProgramme LIKE " + strSearch + " OR commentaire LIKE " + strSearch;
            string constr = ConfigurationManager.ConnectionStrings["BDPlanCadre"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            EnoncerCompt.Add(new SecondaryEnteteProgramme
                            {
                                codeProgramme = sdr["codeProgramme"].ToString(),
                                codeProgrammeSPANNED = sdr["codeProgramme"].ToString().ToString().HighlightKeyWords(searchStr, "yellow", false),
                                commentaire = sdr["commentaire"].ToString().ToString().HighlightKeyWords(searchStr, "yellow", false)
                            });
                        }
                    }
                    con.Close();
                    return EnoncerCompt;
                }
            }
        }

        private static List<SecondaryProgramme> getProgramme(string searchStr)
        {
            string strSearch = "\'%" + searchStr + "%\'";
            List<SecondaryProgramme> EnoncerCompt = new List<SecondaryProgramme>();
            string query = "SELECT idProgramme,annee,nom,codeSpecialisation,specialisation,condition,sanction,commentaire FROM Programme WHERE annee LIKE " + strSearch + " OR nom LIKE " + strSearch + " OR codeSpecialisation LIKE " + strSearch + 
              " OR specialisation LIKE " + strSearch + " OR condition LIKE " + strSearch + " OR sanction LIKE " + strSearch + " OR commentaire LIKE " + strSearch;
            string constr = ConfigurationManager.ConnectionStrings["BDPlanCadre"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            EnoncerCompt.Add(new SecondaryProgramme
                            {
                                idProgramme = Convert.ToInt32(sdr["idProgramme"]),
                                annee = sdr["annee"].ToString().HighlightKeyWords(searchStr, "yellow", false),
                                nom = sdr["nom"].ToString().HighlightKeyWords(searchStr, "yellow", false),
                                codeSpecialisation = sdr["codeSpecialisation"].ToString().HighlightKeyWords(searchStr, "yellow", false),
                                specialisation = sdr["specialisation"].ToString().HighlightKeyWords(searchStr, "yellow", false),
                                condition = sdr["condition"].ToString().HighlightKeyWords(searchStr, "yellow", false),
                                sanction = sdr["sanction"].ToString().HighlightKeyWords(searchStr, "yellow", false),
                                commentaire = sdr["commentaire"].ToString().HighlightKeyWords(searchStr, "yellow", false)
                            });
                        }
                    }
                    con.Close();
                    return EnoncerCompt;
                }
            }
        }
        private static List<SecondaryCriterePerformance> getCritPerf(string searchStr)
        {
            string strSearch = "\'%" + searchStr + "%\'";
            List<SecondaryCriterePerformance> EnoncerCompt = new List<SecondaryCriterePerformance>();
            string query = "SELECT idCritere,criterePerformance,commentaire FROM CriterePerformance WHERE criterePerformance LIKE " + strSearch + " OR commentaire LIKE " + strSearch;
            string constr = ConfigurationManager.ConnectionStrings["BDPlanCadre"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            EnoncerCompt.Add(new SecondaryCriterePerformance
                            {
                                idCritere =Convert.ToInt32(sdr["idCritere"]),
                                criterePerformance1=sdr["criterePerformance"].ToString().HighlightKeyWords(searchStr, "yellow", false),
                                commentaire = sdr["commentaire"].ToString().HighlightKeyWords(searchStr, "yellow", false)
                            });
                        }
                    }
                    con.Close();
                    return EnoncerCompt;
                }
            }
        }

        private static List<SecondaryContexteRealisation> getContextReal(string searchStr)
        {
            string strSearch = "\'%" + searchStr + "%\'";
            List<SecondaryContexteRealisation> EnoncerCompt = new List<SecondaryContexteRealisation>();
            string query = "SELECT idContexte,contexteRealisation,commentaire FROM ContexteRealisation WHERE contexteRealisation LIKE " + strSearch + " OR commentaire LIKE " + strSearch;
            string constr = ConfigurationManager.ConnectionStrings["BDPlanCadre"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            EnoncerCompt.Add(new SecondaryContexteRealisation
                            {
                                idContexte = Convert.ToInt32(sdr["idContexte"]),
                                contexteRealisation1 = sdr["contexteRealisation"].ToString().HighlightKeyWords(searchStr, "yellow", false),
                                commentaire = sdr["commentaire"].ToString().HighlightKeyWords(searchStr, "yellow", false)
                            });
                        }
                    }
                    con.Close();
                    return EnoncerCompt;
                }
            }
        }
    }
}