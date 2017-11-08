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

        public virtual DbSet<ContexteRealisation> ContexteRealisation { get; set; }
        public virtual DbSet<CriterePerformance> CriterePerformance { get; set; }
        public virtual DbSet<ElementCompetence> ElementCompetence { get; set; }
        public virtual DbSet<EnonceCompetence> EnonceCompetence { get; set; }
        public virtual DbSet<EnteteProgramme> EnteteProgramme { get; set; }
        public virtual DbSet<Programme> Programme { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ContexteRealisation>()
                .Property(e => e.contexteRealisation1)
                .IsUnicode(false);

            modelBuilder.Entity<ContexteRealisation>()
                .Property(e => e.contexteRealisation1)
                .IsUnicode(false);

            modelBuilder.Entity<ContexteRealisation>()
                .Property(e => e.commentaire)
                .IsUnicode(false);

            modelBuilder.Entity<CriterePerformance>()
                .Property(e => e.criterePerformance1)
                .IsUnicode(false);

            modelBuilder.Entity<CriterePerformance>()
                .Property(e => e.commentaire)
                .IsUnicode(false);

            modelBuilder.Entity<ElementCompetence>()
                .Property(e => e.element)
                .IsUnicode(false);

            modelBuilder.Entity<ElementCompetence>()
                .Property(e => e.motClef)
                .IsUnicode(false);

            modelBuilder.Entity<ElementCompetence>()
                .Property(e => e.commentaire)
                .IsUnicode(false);

            modelBuilder.Entity<ElementCompetence>()
                .HasMany(e => e.CriterePerformance)
                .WithRequired(e => e.ElementCompetence)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<EnonceCompetence>()
                .Property(e => e.codeCompetence)
                .IsUnicode(false);

            modelBuilder.Entity<EnonceCompetence>()
                .Property(e => e.enonceCompetence1)
                .IsUnicode(false);

            modelBuilder.Entity<EnonceCompetence>()
                .Property(e => e.motClef)
                .IsUnicode(false);

            modelBuilder.Entity<EnonceCompetence>()
                .Property(e => e.commentaire)
                .IsUnicode(false);

            modelBuilder.Entity<EnonceCompetence>()
                .HasMany(e => e.ContexteRealisation)
                .WithRequired(e => e.EnonceCompetence)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<EnonceCompetence>()
                .HasMany(e => e.ElementCompetence)
                .WithRequired(e => e.EnonceCompetence)
                .WillCascadeOnDelete(false);

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

            modelBuilder.Entity<Programme>()
                .HasMany(e => e.EnonceCompetence)
                .WithRequired(e => e.Programme)
                .WillCascadeOnDelete(false);
        }
    }
}
