namespace ApplicationPlanCadre.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("EnonceCompetence")]
    public partial class EnonceCompetence
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public EnonceCompetence()
        {
            ContexteRealisation = new HashSet<ContexteRealisation>();
            ElementCompetence = new HashSet<ElementCompetence>();
        }

        [Key]
        public int idCompetence { get; set; }

        [Required]
        [StringLength(4)]
        public string codeCompetence { get; set; }

        [Column("enonceCompetence")]
        [Required]
        [StringLength(300)]
        public string enonceCompetence1 { get; set; }

        [StringLength(30)]
        public string motClef { get; set; }

        public bool obligatoire { get; set; }

        public bool actif { get; set; }

        [StringLength(200)]
        public string commentaire { get; set; }

        public int idProgramme { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ContexteRealisation> ContexteRealisation { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ElementCompetence> ElementCompetence { get; set; }

        public virtual Programme Programme { get; set; }
    }
}
