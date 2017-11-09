namespace ApplicationPlanCadre.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PlanCadreEnonce")]
    public partial class PlanCadreEnonce
    {
        [Key]
        [Column(Order = 0)]
        public int idPlanCadreElement { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ponderationEnHeure { get; set; }

        [Key]
        [Column(Order = 2)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int idPlanCadre { get; set; }

        [Key]
        [Column(Order = 3)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int idCompetence { get; set; }

        public virtual EnonceCompetence EnonceCompetence { get; set; }

        public virtual PlanCadre PlanCadre { get; set; }
    }
}
