using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_ProductList : System.Web.UI.UserControl
{
    DataClassesPetShopDBDataContext DB = new DataClassesPetShopDBDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateControl();
    }

    private void PopulateControl()
    {
        string categoryID = Request.QueryString["CategoryID"];
        var k = from r in DB.proizvods
                where r.kategorija.ID == Int32.Parse(categoryID)
                select r;        
        dlProducts.DataSource = k;
        dlProducts.DataBind();
    }
}