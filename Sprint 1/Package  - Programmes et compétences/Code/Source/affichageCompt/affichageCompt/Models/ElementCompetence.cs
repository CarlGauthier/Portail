namespace affichageCompt.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ElementCompetence")]
    public partial class ElementCompetence
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ElementCompetence()
        {
            CriterePerformance = new HashSet<CriterePerformance>();
        }

        [Key]
        public int idElement { get; set; }

        [Required]
        [StringLength(300)]
        public string element { get; set; }

        public int numero { get; set; }

        [StringLength(30)]
        public string motClef { get; set; }

        [StringLength(200)]
        public string commentaire { get; set; }

        public int idCompetence { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CriterePerformance> CriterePerformance { get; set; }

        public virtual EnonceCompetence EnonceCompetence { get; set; }
    }
}
