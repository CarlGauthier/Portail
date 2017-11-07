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
        public string enonceCompetence1 { get; set; }
        public string commentaire { get; set; }
        public int idProgramme { get; set; }


    }
}