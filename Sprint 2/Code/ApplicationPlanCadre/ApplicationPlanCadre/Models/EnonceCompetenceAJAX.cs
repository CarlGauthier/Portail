using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApplicationPlanCadre.Models
{
    public class EnonceCompetenceAJAX
    {
        public EnonceCompetence enonce { get; set; }
        public ContexteRealisation contexte { get; set; }
        public ElementCompetence element { get; set; }
        public CriterePerformance critere { get; set; }
    }
}