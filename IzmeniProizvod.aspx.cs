using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IzmeniProizvod : System.Web.UI.Page
{
    DataClassesPetShopDBDataContext DB = new DataClassesPetShopDBDataContext();
    IQueryable<proizvod> k;
    string productId;
    protected void Page_Load(object sender, EventArgs e)
    {
        productId = Request.QueryString["IzmeniID"];
        k = from r in DB.proizvods
                where r.ID == Int32.Parse(productId)
                select r;
        if (k != null)
        {            
            Image1.ImageUrl = Link.BuildAbsolute("/Images/" + k.First().Slika);
            lblName.Text = "(" + k.Single().Naziv + ")";
            lblPrice.Text = "(" + k.First().Cena.ToString() + ")";
            lblDescription.Text = "(" + k.First().Opis + ")";
            /*if (Session["username"] != null)
                btnAddNew.Visible = true;
            else btnAddNew.Visible = false;*/
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {        
        proizvod products = DB.proizvods.Single(f => f.ID == Int32.Parse(Request.QueryString["IzmeniID"]));
        if(txtName.Text!="")
            products.Naziv = txtName.Text;
        if(txtPrice.Text!="")
            products.Cena = double.Parse(txtPrice.Text);    
        if(txtDescription.Text!="")    
            products.Opis = txtDescription.Text;
        if (FileUpload1.HasFile)
        {
            try
            {
                string filename = Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(Server.MapPath("~/Images/") + filename);
                products.Slika = filename;
            }
            catch (Exception ex)
            {

            }
        }        
        DB.SubmitChanges();
        Response.Redirect(Link.BuildAbsolute("Proizvod.aspx?ProductID=" + k.First().ID));
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        var p = from proizvod in DB.proizvods where int.Parse(productId) == proizvod.ID select proizvod;
        proizvod pr = p.Single();
        DB.proizvods.DeleteOnSubmit(pr);
        DB.SubmitChanges();
        Response.Redirect("Default.aspx");                
    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("DodajNoviProizvod.aspx");
    }
}