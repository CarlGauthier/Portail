namespace ApplicationPlanCadre.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class BDPlanCadre : DbContext
    {
        public BDPlanCadre()
            : base("name=BDPlanCadre")
        {
        }

        public virtual DbSet<tt> tt { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<tt>()
                .Property(e => e.champ)
                .IsUnicode(false);
        }
    }
}