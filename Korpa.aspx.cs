using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Korpa : System.Web.UI.Page
{
    DataClassesPetShopDBDataContext db = new DataClassesPetShopDBDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] != null)
        {
            gvCart.DataSource = from k in db.korpas
                                join p in db.proizvods on k.ID_Proizvoda equals p.ID
                                where k.ID_Korisnika == Int32.Parse(Session["id"].ToString())
                                select new { Naziv = p.Naziv, Cena = p.Cena, Kolicina = k.Kolicina, IDProizvoda = k.ID_Proizvoda };
            gvCart.DataBind();
        }
    }

    protected void gvCart_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gvCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string productId = gvCart.DataKeys[e.RowIndex].Values["IDProizvoda"].ToString();
        var p = from k in db.korpas
                where (k.ID_Proizvoda == Int32.Parse(productId) && k.ID_Korisnika == Int32.Parse(Session["id"].ToString()))
                select k;
        korpa cart = p.Single();
        if (cart.Kolicina > 1)
        {
            cart.Kolicina--;            
        }else
        {
            db.korpas.DeleteOnSubmit(cart);
        }                    
        db.SubmitChanges();
        Response.Redirect("Korpa.aspx");
    }
}