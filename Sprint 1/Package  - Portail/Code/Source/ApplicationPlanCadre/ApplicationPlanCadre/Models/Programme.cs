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
            EnonceCompetence = new HashSet<EnonceCompetence>();
        }

        [Key]
        public int idProgramme { get; set; }

        [Required]
        [StringLength(4)]
        [Display(Name = "Ann�e")]
        [RegularExpression("^(196[7-9]|19[789][0-9]|2[01][0-9][0-9])$", ErrorMessage = "L'ann�e est invalide, le programme ne peux avoir �t� cr�e avant 1967.")]
        public string annee { get; set; }

        [StringLength(50)]
        [Display(Name = "Nom")]
        public string nom { get; set; }

        [StringLength(6)]
        [Display(Name = "Nombre d'unit�s")]
        public string nbUnite { get; set; }

        [Required]
        [StringLength(3)]
        [RegularExpression("^[A-Z][A-Z|0-9]?[A-Z|0-9]$", ErrorMessage = "Le code est invalide, il doit commencer par une lettre et �tre suivis d'une autre lettre ou un chiffre.")]
        [Display(Name = "Code de sp�cialisation")]
        public string codeSpecialisation { get; set; }

        [StringLength(30)]
        [Display(Name = "Sp�cialisation")]
        public string specialisation { get; set; }

        [Display(Name = "Heures de formation g�n�rale")]
        public int? nbHeurefrmGenerale { get; set; }

        [Display(Name = "Heures de formation sp�cifique")]
        public int? nbHeurefrmSpecifique { get; set; }

        [StringLength(300)]
        public string condition { get; set; }

        [StringLength(50)]
        public string sanction { get; set; }

        [StringLength(200)]
        public string commentaire { get; set; }

        [StringLength(200)]
        public string docMinistere_path { get; set; }

        public DateTime? dateValidation { get; set; }

        [Required]
        [StringLength(3)]
        public string codeProgramme { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EnonceCompetence> EnonceCompetence { get; set; }

        [Display(Name = "Programme")]
        public virtual EnteteProgramme EnteteProgramme { get; set; }
    }
}
