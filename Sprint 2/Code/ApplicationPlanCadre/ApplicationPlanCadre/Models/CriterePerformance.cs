namespace ApplicationPlanCadre.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CriterePerformance")]
    public partial class CriterePerformance
    {
        [Key]
        public int idCritere { get; set; }

        [Column("criterePerformance")]
        [Required]
        [StringLength(300)]
        [Display(Name = "Critère de performance")]
        public string criterePerformance1 { get; set; }

        [Display(Name = "Numéro")]
        public int numero { get; set; }

        [StringLength(200)]
        public string commentaire { get; set; }

        public int idElement { get; set; }

        public virtual ElementCompetence ElementCompetence { get; set; }
    }
}
