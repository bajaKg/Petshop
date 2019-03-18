using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using VPMilosBajic;

public partial class Account_Register : Page
{
    DataClassesPetShopDBDataContext db = new DataClassesPetShopDBDataContext();
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        var manager = new UserManager();
        korisnik userdb = new korisnik();
        var user = new ApplicationUser() { UserName = UserName.Text };        
        IdentityResult result = manager.Create(user, Password.Text);
        userdb.Ime = FirstName.Text;
        userdb.Prezime = LastName.Text;
        userdb.UserName = UserName.Text;
        userdb.Passwrod = Password.Text;                
        userdb.EMail = Email.Text;
        userdb.Role = "user";
        if (result.Succeeded)
        {
            IdentityHelper.SignIn(manager, user, isPersistent: false);

            db.korisniks.InsertOnSubmit(userdb);
            db.SubmitChanges();

            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
        }
        else
        {
            ErrorMessage.Text = result.Errors.FirstOrDefault();
        }
    }
}