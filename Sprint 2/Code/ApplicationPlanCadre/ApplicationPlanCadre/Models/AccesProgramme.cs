namespace ApplicationPlanCadre.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AccesProgramme")]
    public partial class AccesProgramme
    {
        [Key]
        [Column(Order = 0)]
        public int idAcces { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(256)]
        public string userMail { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(3)]
        public string codeProgramme { get; set; }

        public virtual EnteteProgramme EnteteProgramme { get; set; }
    }
}
