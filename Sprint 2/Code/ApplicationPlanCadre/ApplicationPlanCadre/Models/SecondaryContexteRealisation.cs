using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApplicationPlanCadre.Models
{
    public class SecondaryContexteRealisation
    {
        public int idContexte { get; set; }
        public string description{ get; set; }
        public int numero { get; set; }
        public int idCompetence { get; set; }

        
    }
}