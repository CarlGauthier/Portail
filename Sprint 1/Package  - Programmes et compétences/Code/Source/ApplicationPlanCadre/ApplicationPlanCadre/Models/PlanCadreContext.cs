namespace ApplicationPlanCadre.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class PlanCadreContext : DbContext
    {
        public PlanCadreContext()
            : base("name=PlanCadreContext")
        {
        }


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }
    }
}
