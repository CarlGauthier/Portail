namespace ApplicationPlanCadre.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DevisMinistere")]
    public partial class DevisMinistere
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DevisMinistere()
        {
            EnonceCompetence = new HashSet<EnonceCompetence>();
            Programme = new HashSet<Programme>();
        }

        [Key]
        public int idDevis { get; set; }

        [Required]
        [StringLength(4)]
        public string annee { get; set; }

        [Required]
        [StringLength(3)]
        public string codeSpecialisation { get; set; }

        [StringLength(30)]
        public string specialisation { get; set; }

        [StringLength(6)]
        public string nbUnite { get; set; }

        public int? nbHeureFrmGenerale { get; set; }

        public int? nbHeureFrmSpecifique { get; set; }

        [StringLength(300)]
        public string condition { get; set; }

        [StringLength(50)]
        public string sanction { get; set; }

        [StringLength(200)]
        public string docMinistere { get; set; }

        [Required]
        [StringLength(3)]
        public string codeProgramme { get; set; }

        public virtual EnteteProgramme EnteteProgramme { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EnonceCompetence> EnonceCompetence { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Programme> Programme { get; set; }
    }
}
