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
            PlanCadrePrealable = new HashSet<PlanCadrePrealable>();
            PlanCadreElement = new HashSet<PlanCadreElement>();
            PlanCadreEnonce = new HashSet<PlanCadreEnonce>();
            Prealable = new HashSet<PlanCadrePrealable>();
        }

        [Key]
        public int idPlanCadre { get; set; }

        [StringLength(10)]
        public string numeroCours { get; set; }

        [Required]
        [StringLength(150)]
        public string titreCours { get; set; }
        /*
                [StringLength(300)]
                public string prealableAbs { get; set; }

                [StringLength(300)]
                public string prealableRel { get; set; }
        */
        [Column(TypeName = "text")]
        public string indicationPedago { get; set; }

        [Column(TypeName = "text")]
        public string environnementPhys { get; set; }

        [Column(TypeName = "text")]
        public string ressource { get; set; }

        public int? nbHeureTheorie { get; set; }

        public int? nbHeurePratique { get; set; }

        public int? nbHeureDevoir { get; set; }

        public int idProgramme { get; set; }

        public int idType { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cours> Cours { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlanCadrePrealable> PlanCadrePrealable { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlanCadreElement> PlanCadreElement { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlanCadreEnonce> PlanCadreEnonce { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlanCadrePrealable> Prealable { get; set; }

        public virtual Programme Programme { get; set; }

        public virtual TypePlanCadre TypePlanCadre { get; set; }
    }
}
