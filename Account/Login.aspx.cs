using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using VPMilosBajic;
using System.Linq;


public partial class Account_Login : Page
{
        DataClassesPetShopDBDataContext db = new DataClassesPetShopDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;                
            }
        }

        public void LogIn(object sender, EventArgs e)
        {
        if (IsValid)
        {
            // Validate the user password
            var manager = new UserManager();
            ApplicationUser user = manager.Find(UserName.Text, Password.Text);
            var korisnik = from kor in db.korisniks
                           where (kor.UserName == UserName.Text && kor.Passwrod == Password.Text)
                           select kor;                                 
                if (user != null && korisnik.Count()!=0)
                {                    
                    Session["username"] = korisnik.Single().Ime;
                    Session["role"] = korisnik.Single().Role;
                    Session["id"] = korisnik.Single().ID;                
                    IdentityHelper.SignIn(manager, user, RememberMe.Checked);
                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                }
                else
                {
                    FailureText.Text = "Неисправно корисничко име или лозинка.";
                    ErrorMessage.Visible = true;
                }
            }
        }
}