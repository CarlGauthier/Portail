using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApplicationPlanCadre.Models
{
    public class SecondaryProgramme
    {
        //<th>idProgramme</th>
        //<th>annee</th>
        //<th>nom</th>
        //<th>codeSpecialisation</th>
        //<th>specialisation</th>
        //<th>condition</th>
        //<th>sanction</th>
        //<th>Commentaires</th>
        
        public int idProgramme { get; set; }
        public string annee { get; set; }
        public string nom { get; set; }
        public string codeSpecialisation { get; set; }
        public string specialisation { get; set; }
        public string condition { get; set; }
        public string sanction { get; set; }
        public string commentaire { get; set; }

        

        
    }
}