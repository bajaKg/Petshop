using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Proizvod : System.Web.UI.Page
{
    DataClassesPetShopDBDataContext DB = new DataClassesPetShopDBDataContext();
    IQueryable<proizvod> k;
    string productId;
    protected void Page_Load(object sender, EventArgs e)
    {
        productId = Request.QueryString["ProductID"];
        k = from r in DB.proizvods
                where r.ID == Int32.Parse(productId)
                select r;
        if (k != null)
        {
            Image1.ImageUrl = Link.BuildAbsolute("/Images/" + k.First().Slika);
            lblName.Text = k.First().Naziv;
            lblPrice.Text = k.First().Cena.ToString() + " динара";
            lblDescription.Text = k.First().Opis;
            if (Session["username"] != null)
            {
                btnAddToCart.Visible = true;
                btnSaveComm.Visible = true;
                txtComment.Visible = true;
                lblComment.Visible = false;
                if (Session["role"].ToString() != "admin")
                {
                    btnAddNew.Visible = false;
                    btnEdit.Visible = false;
                }
                else
                {
                    btnAddNew.Visible = true;
                    btnEdit.Visible = true;
                }
            }
            else
            {                
                btnAddToCart.Visible = false;
                btnAddNew.Visible = false;
                btnEdit.Visible = false;
            }
            
            
        }
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect(Link.BuildAbsolute("IzmeniProizvod.aspx?IzmeniID=" + k.First().ID.ToString()));
    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        Response.Redirect(Link.BuildAbsolute("DodajNoviProizvod.aspx"));
    }

    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        korpa cart = new korpa();           
        var korpe = from korp in DB.korpas
                    where (korp.ID_Proizvoda == k.First().ID && korp.ID_Korisnika == Int32.Parse(Session["id"].ToString()))
                    select korp;
        int quantity = 1;           
        if (korpe.Count()!=0)
        {
            korpe.First().Kolicina = korpe.First().Kolicina + 1;            
        }
        else
        {
            cart.ID_Proizvoda = k.First().ID;
            cart.ID_Korisnika = Int32.Parse(Session["id"].ToString());
            cart.Kolicina = quantity;
            DB.korpas.InsertOnSubmit(cart);            
        }
        DB.SubmitChanges();
        Response.Redirect("Default.aspx");
    }

    protected void btnSaveComm_Click(object sender, EventArgs e)
    {
        komentar kom = new komentar();
        kom.Datum = DateTime.Now;
        kom.ID_Proizvoda = Int32.Parse(productId);
        kom.ID_Korisnika = Int32.Parse(Session["id"].ToString());
        kom.Sadrzaj = txtComment.Text;
        DB.komentars.InsertOnSubmit(kom);
        DB.SubmitChanges();
        Response.Redirect(Request.RawUrl);
    }
}