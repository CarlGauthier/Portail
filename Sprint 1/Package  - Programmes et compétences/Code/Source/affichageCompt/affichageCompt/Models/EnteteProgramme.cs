namespace affichageCompt.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("EnteteProgramme")]
    public partial class EnteteProgramme
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public EnteteProgramme()
        {
            Programme = new HashSet<Programme>();
        }

        [Key]
        public int idEnteteProgramme { get; set; }

        [Required]
        [StringLength(3)]
        public string code { get; set; }

        [StringLength(200)]
        public string commentaire { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Programme> Programme { get; set; }
    }
}
