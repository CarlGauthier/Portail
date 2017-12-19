using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ApplicationPlanCadre.Startup))]
namespace ApplicationPlanCadre
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}