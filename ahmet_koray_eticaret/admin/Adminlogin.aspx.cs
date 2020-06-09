using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Security;
using System.Web.Security;

namespace ahmet_koray_eticaret
{
    public partial class adminlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true");

        [Obsolete]
        protected void btngiris_Click(object sender, EventArgs e)
        {
            string user;


            conn.Open();

            string veritabani_sifre = FormsAuthentication.HashPasswordForStoringInConfigFile(tbsifre.Text, "MD5");

            SqlCommand comm = new SqlCommand("select count(*)  from uyeler where uyetipi=1 and uye_durum=1 and email='" + tbmail.Text + "' and sifre='" + veritabani_sifre + "'", conn);

            user = comm.ExecuteScalar().ToString();

            if (tbmail.Text == string.Empty || tbsifre.Text == string.Empty)
                Response.Write("<script>alert(' Lütfen Bilgilerinizi Eksiksiz Giriniz!')</script>");

            else if (int.Parse(user) != 1)
                Response.Write("<script>alert('Lütfen Geçerli Bir Üyelik Adresi Giriniz!')</script>");


            else if (int.Parse(user) == 1)
            {
                Session.Add("admin", tbmail.Text);

                Response.Redirect("./Panel.aspx");
            }


            conn.Close();

            conn.Dispose();
        }
    }
}