using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Korisnici : System.Web.UI.Page
{
    DataClassesPetShopDBDataContext DB = new DataClassesPetShopDBDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        gvUsers.DataSource = from k in DB.korisniks                                                        
                            select new { ID = k.ID, Ime = k.Ime, Prezime = k.Prezime, UserName = k.UserName, Password = k.Passwrod, Email = k.EMail, Role = k.Role, IDKorisnika = k.ID };
        gvUsers.DataBind();
    }

    protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string userId = gvUsers.DataKeys[e.RowIndex].Values["IDKorisnika"].ToString();
        var u = from k in DB.korisniks
                where k.ID == Int32.Parse(userId)
                select k;
        korisnik user = u.Single();        
        DB.korisniks.DeleteOnSubmit(user);
        
        DB.SubmitChanges();
        Response.Redirect("Korisnici.aspx");
    }

    protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DropDownList dll = (DropDownList)gvUsers.Rows[e.NewEditIndex].FindControl("dllRole");
        dll.Items.Add(new ListItem("user"));
        dll.Items.Add(new ListItem("admin"));
    }

    protected void gvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
}