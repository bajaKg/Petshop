using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_CommetnList : System.Web.UI.UserControl
{
    DataClassesPetShopDBDataContext DB = new DataClassesPetShopDBDataContext();
    string productId;
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateControl();
    }

    private void PopulateControl()
    {
        productId = Request.QueryString["ProductID"];
        var komentari = from kom in DB.komentars
                        join kor in DB.korisniks on kom.ID_Korisnika equals kor.ID
                        where kom.ID_Proizvoda == Int32.Parse(productId)                        
                        orderby kom.ID_Komentara descending
                        select new { Ime = kor.Ime, Datum = kom.Datum, Sadrzaj = kom.Sadrzaj, ID_Korisnika = kor.ID, ID_Proizvoda = kom.ID_Proizvoda };
        dlComments.DataSource = komentari;
        dlComments.DataBind();
    }   
}