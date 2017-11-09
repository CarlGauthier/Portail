namespace ApplicationPlanCadre.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PlanCadre")]
    public partial class PlanCadre
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PlanCadre()
        {
            Cours = new HashSet<Cours>();
            PlanCadreElement = new HashSet<PlanCadreElement>();
            PlanCadreEnonce = new HashSet<PlanCadreEnonce>();
        }

        [Key]
        public int idPlanCadre { get; set; }

        [StringLength(10)]
        public string numeroCours { get; set; }

        [Required]
        [StringLength(150)]
        public string titreCours { get; set; }

        [StringLength(300)]
        public string prealableAbs { get; set; }

        [StringLength(300)]
        public string prealableRel { get; set; }

        [StringLength(500)]
        public string indicationPedago { get; set; }

        [StringLength(500)]
        public string elementsConnaissance { get; set; }

        [StringLength(500)]
        public string activiteApprentissage { get; set; }

        [StringLength(300)]
        public string environnementPhys { get; set; }

        [StringLength(300)]
        public string ressource { get; set; }

        public int? nbHeureTheorie { get; set; }

        public int? nbHeurePratique { get; set; }

        public int? nbHeureDevoir { get; set; }

        public int idDevis { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cours> Cours { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlanCadreElement> PlanCadreElement { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlanCadreEnonce> PlanCadreEnonce { get; set; }

        public virtual Programme Programme { get; set; }
    }
}
