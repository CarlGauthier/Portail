namespace programmeBDDevCF.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class BDProgramme : DbContext
    {
        public BDProgramme()
            : base("name=BDProgramme")
        {
        }

        public virtual DbSet<EnteteProgramme> EnteteProgramme { get; set; }
        public virtual DbSet<Programme> Programme { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<EnteteProgramme>()
                .Property(e => e.codeProgramme)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<EnteteProgramme>()
                .Property(e => e.commentaire)
                .IsUnicode(false);

            modelBuilder.Entity<EnteteProgramme>()
                .HasMany(e => e.Programme)
                .WithRequired(e => e.EnteteProgramme)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Programme>()
                .Property(e => e.annee)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Programme>()
                .Property(e => e.nom)
                .IsUnicode(false);

            modelBuilder.Entity<Programme>()
                .Property(e => e.nbUnite)
                .IsUnicode(false);

            modelBuilder.Entity<Programme>()
                .Property(e => e.codeSpecialisation)
                .IsUnicode(false);

            modelBuilder.Entity<Programme>()
                .Property(e => e.specialisation)
                .IsUnicode(false);

            modelBuilder.Entity<Programme>()
                .Property(e => e.condition)
                .IsUnicode(false);

            modelBuilder.Entity<Programme>()
                .Property(e => e.sanction)
                .IsUnicode(false);

            modelBuilder.Entity<Programme>()
                .Property(e => e.commentaire)
                .IsUnicode(false);

            modelBuilder.Entity<Programme>()
                .Property(e => e.docMinistere_path)
                .IsUnicode(false);

            modelBuilder.Entity<Programme>()
                .Property(e => e.codeProgramme)
                .IsFixedLength()
                .IsUnicode(false);
        }
    }
}
