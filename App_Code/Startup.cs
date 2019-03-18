using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(VPMilosBajic.Startup))]
namespace VPMilosBajic
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
