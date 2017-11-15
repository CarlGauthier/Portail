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
        [Display(Name = "Année")]
        [Range(1967, 2199, ErrorMessage = "L'année est invalide. Le devis ne peux avoir été crée avant 1967.")]
        public string annee { get; set; }

        [Required]
        [StringLength(3)]
        [RegularExpression("^[A-Za-z][A-Za-z|0-9]?[A-Za-z|0-9]$", ErrorMessage = "Le code est invalide, il doit commencer par une lettre et être suivis d'une autre lettre ou un chiffre.")]
        [Display(Name = "Code de spécialisation")]
        public string codeSpecialisation { get; set; }

        [StringLength(30)]
        [Display(Name = "Spécialisation")]
        public string specialisation { get; set; }

        [StringLength(6)]
        [Display(Name = "Nombre d'unités")]
        public string nbUnite { get; set; }

        [Display(Name = "Formation générale")]
        public int? nbHeureFrmGenerale { get; set; }

        [Display(Name = "Formation spécifique")]
        public int? nbHeureFrmSpecifique { get; set; }

        [StringLength(300)]
        [Display(Name = "Type de condition")]
        public string condition { get; set; }

        [StringLength(50)]
        [Display(Name = "Sanction")]
        public string sanction { get; set; }

        [StringLength(200)]
        [Display(Name = "Document ministériel")]
        public string docMinistere { get; set; }

        [Required]
        [StringLength(3)]
        [Display(Name = "Code de programme")]
        public string codeProgramme { get; set; }

        public virtual EnteteProgramme EnteteProgramme { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EnonceCompetence> EnonceCompetence { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Programme> Programme { get; set; }
    }
}
