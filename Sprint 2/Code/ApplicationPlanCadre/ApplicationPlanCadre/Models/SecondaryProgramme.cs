using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApplicationPlanCadre.Models
{
    public class SecondaryProgramme
    {
        
        
        public int idProgramme { get; set; }
        public string annee { get; set; }
        public string nom { get; set; }
        public string codeSpecialisation { get; set; }
        public string specialisation { get; set; }
        public string condition { get; set; }
        public string sanction { get; set; }
        public string commentaire { get; set; }
        public string nbUnite { get; set; }
        public string nbHeurefrmGeneral { get; set; }
        public string nbHeurefrmSpecifique { get; set; }
        public string codeProgramme { get; set; }
        public string total { get; set; }

        

        
    }
}