using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ahmet_koray_eticaret.admin
{
    public partial class urun_guncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["admin"] == null)
            {
                paneloturum.Visible = false;
                Response.Redirect("Adminlogin.aspx");
            }
            else
            {
                paneloturum.Visible = true;
            }
            
        }

        protected void btncikis_Click(object sender, EventArgs e)
        {
            Session.Remove("admin");
            Response.Redirect("Adminlogin.aspx");
        }
    }
}