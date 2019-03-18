using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Psi : System.Web.UI.Page
{
    DataClassesPetShopDBDataContext DB = new DataClassesPetShopDBDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

        PopulateControl();
    }

    private void PopulateControl()
    {       
    }
}
