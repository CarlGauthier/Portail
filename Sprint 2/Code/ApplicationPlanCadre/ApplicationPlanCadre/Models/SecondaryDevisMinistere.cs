using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApplicationPlanCadre.Models
{
    public class SecondaryDevisMinistere
    {
        
        public int idDevis { get; set; }

        
        public string annee { get; set; }

       
        public string codeSpecialisation { get; set; }

        
        public string specialisation { get; set; }

        
        public string nbUnite { get; set; }

        public int? nbHeureFrmGenerale { get; set; }

        public int? nbHeureFrmSpecifique { get; set; }

        
        public string condition { get; set; }

        
        public string sanction { get; set; }

        
        public string docMinistere { get; set; }

        public int total { get; set; }
        
        public string codeProgramme { get; set; }
    }
}