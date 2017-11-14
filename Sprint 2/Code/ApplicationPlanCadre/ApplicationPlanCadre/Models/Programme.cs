namespace ApplicationPlanCadre.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Programme")]
    public partial class Programme
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Programme()
        {
            PlanCadre = new HashSet<PlanCadre>();
        }

        [Key]
        public int idProgramme { get; set; }

        [StringLength(50)]
        public string nom { get; set; }

        [Required]
        [StringLength(4)]
        public string annee { get; set; }

        [Display(Name = "Dernière validation")]
        public DateTime? dateValidation { get; set; }

        public int idDevis { get; set; }

        public virtual DevisMinistere DevisMinistere { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlanCadre> PlanCadre { get; set; }
    }
}
