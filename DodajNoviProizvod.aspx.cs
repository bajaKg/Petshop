using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DodajNoviProizvod : System.Web.UI.Page
{
    DataClassesPetShopDBDataContext DB = new DataClassesPetShopDBDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        proizvod product = new proizvod();        
        if (txtName.Text != "")
            product.Naziv = txtName.Text;
        if (txtPrice.Text != "")
            product.Cena = double.Parse(txtPrice.Text);
        if (txtDescription.Text != "")
            product.Opis = txtDescription.Text;
        product.ID_Kategorije = int.Parse(ddlCategory.SelectedItem.Value.ToString());

        if (FileUpload1.HasFile)
        {
            try
            {
                string filename = Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(Server.MapPath("~/Images/") + filename);
                product.Slika = filename;
            }
            catch (Exception ex)
            {
                
            }
        }        
        DB.proizvods.InsertOnSubmit(product);
        DB.SubmitChanges();
        Response.Redirect(Link.BuildAbsolute("DodajNoviProizvod.aspx"));        
    }
}