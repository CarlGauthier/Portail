using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApplicationPlanCadre.Models
{
    public class SecondaryEnteteProgramme
    {

        public string codeProgramme { get; set; }//la key
        public string codeProgrammeSPANNED { get; set; } //key qui peut etre modifier avec le span
        public string commentaire { get; set; }
    }
}