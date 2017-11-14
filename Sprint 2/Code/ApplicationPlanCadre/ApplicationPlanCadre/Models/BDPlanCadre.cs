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
        public virtual DbSet<Cours> Cours { get; set; }
        public virtual DbSet<CriterePerformance> CriterePerformance { get; set; }
        public virtual DbSet<DevisMinistere> DevisMinistere { get; set; }
        public virtual DbSet<ElementCompetence> ElementCompetence { get; set; }
        public virtual DbSet<EnonceCompetence> EnonceCompetence { get; set; }
        public virtual DbSet<EnteteProgramme> EnteteProgramme { get; set; }
        public virtual DbSet<GrilleCours> GrilleCours { get; set; }
        public virtual DbSet<TypePlanCadre> TypePlanCadre { get; set; }
        public virtual DbSet<PlanCadre> PlanCadre { get; set; }
        public virtual DbSet<Programme> Programme { get; set; }
        public virtual DbSet<Session> Session { get; set; }
        public virtual DbSet<PlanCadreElement> PlanCadreElement { get; set; }
        public virtual DbSet<PlanCadreEnonce> PlanCadreEnonce { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ContexteRealisation>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<CriterePerformance>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<DevisMinistere>()
                .Property(e => e.annee)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<DevisMinistere>()
                .Property(e => e.codeSpecialisation)
                .IsUnicode(false);

            modelBuilder.Entity<DevisMinistere>()
                .Property(e => e.specialisation)
                .IsUnicode(false);

            modelBuilder.Entity<DevisMinistere>()
                .Property(e => e.nbUnite)
                .IsUnicode(false);

            modelBuilder.Entity<DevisMinistere>()
                .Property(e => e.condition)
                .IsUnicode(false);

            modelBuilder.Entity<DevisMinistere>()
                .Property(e => e.sanction)
                .IsUnicode(false);

            modelBuilder.Entity<DevisMinistere>()
                .Property(e => e.docMinistere)
                .IsUnicode(false);

            modelBuilder.Entity<DevisMinistere>()
                .Property(e => e.codeProgramme)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<DevisMinistere>()
                .HasMany(e => e.EnonceCompetence)
                .WithRequired(e => e.DevisMinistere)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DevisMinistere>()
                .HasMany(e => e.Programme)
                .WithRequired(e => e.DevisMinistere)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ElementCompetence>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<ElementCompetence>()
                .HasMany(e => e.CriterePerformance)
                .WithRequired(e => e.ElementCompetence)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ElementCompetence>()
                .HasMany(e => e.PlanCadreElement)
                .WithRequired(e => e.ElementCompetence)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<EnonceCompetence>()
                .Property(e => e.codeCompetence)
                .IsUnicode(false);

            modelBuilder.Entity<EnonceCompetence>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<EnonceCompetence>()
                .HasMany(e => e.ContexteRealisation)
                .WithRequired(e => e.EnonceCompetence)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<EnonceCompetence>()
                .HasMany(e => e.ElementCompetence)
                .WithRequired(e => e.EnonceCompetence)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<EnonceCompetence>()
                .HasMany(e => e.PlanCadreEnonce)
                .WithRequired(e => e.EnonceCompetence)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<EnteteProgramme>()
                .Property(e => e.codeProgramme)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<EnteteProgramme>()
                .Property(e => e.nom)
                .IsUnicode(false);

            modelBuilder.Entity<EnteteProgramme>()
                .HasMany(e => e.DevisMinistere)
                .WithRequired(e => e.EnteteProgramme)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<GrilleCours>()
                .Property(e => e.nom)
                .IsUnicode(false);

            modelBuilder.Entity<GrilleCours>()
                .HasMany(e => e.Cours)
                .WithRequired(e => e.GrilleCours)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TypePlanCadre>()
                .HasMany(e => e.PlanCadre)
                .WithRequired(e => e.TypePlanCadre)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PlanCadre>()
                .Property(e => e.numeroCours)
                .IsUnicode(false);

            modelBuilder.Entity<PlanCadre>()
                .Property(e => e.titreCours)
                .IsUnicode(false);

            modelBuilder.Entity<PlanCadre>()
                .Property(e => e.prealableAbs)
                .IsUnicode(false);

            modelBuilder.Entity<PlanCadre>()
                .Property(e => e.prealableRel)
                .IsUnicode(false);

            modelBuilder.Entity<PlanCadre>()
                .Property(e => e.indicationPedago)
                .IsUnicode(false);

            modelBuilder.Entity<PlanCadre>()
                .Property(e => e.elementsConnaissance)
                .IsUnicode(false);

            modelBuilder.Entity<PlanCadre>()
                .Property(e => e.activiteApprentissage)
                .IsUnicode(false);

            modelBuilder.Entity<PlanCadre>()
                .Property(e => e.environnementPhys)
                .IsUnicode(false);

            modelBuilder.Entity<PlanCadre>()
                .Property(e => e.ressource)
                .IsUnicode(false);

            modelBuilder.Entity<PlanCadre>()
                .HasMany(e => e.Cours)
                .WithRequired(e => e.PlanCadre)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PlanCadre>()
                .HasMany(e => e.PlanCadreElement)
                .WithRequired(e => e.PlanCadre)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PlanCadre>()
                .HasMany(e => e.PlanCadreEnonce)
                .WithRequired(e => e.PlanCadre)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Programme>()
                .Property(e => e.nom)
                .IsUnicode(false);

            modelBuilder.Entity<Programme>()
                .Property(e => e.annee)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Programme>()
                .HasMany(e => e.PlanCadre)
                .WithRequired(e => e.Programme)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Session>()
                .Property(e => e.nom)
                .IsUnicode(false);

            modelBuilder.Entity<Session>()
                .HasMany(e => e.Cours)
                .WithRequired(e => e.Session)
                .WillCascadeOnDelete(false);
        }
    }
}
