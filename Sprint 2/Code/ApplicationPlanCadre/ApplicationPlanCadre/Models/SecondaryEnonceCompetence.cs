using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApplicationPlanCadre.Models
{
    public class SecondaryEnonceCompetence
    {
        public int idCompetence { get; set; }
        public string codeCompetence { get; set; }
        public string description { get; set; }
        
        public int idDevis { get; set; }


    }
}