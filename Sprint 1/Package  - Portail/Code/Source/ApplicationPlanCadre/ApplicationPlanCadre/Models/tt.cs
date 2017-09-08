namespace ApplicationPlanCadre.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tt")]
    public partial class tt
    {
        public int id { get; set; }

        [Required]
        [StringLength(5)]
        public string champ { get; set; }
    }
}
