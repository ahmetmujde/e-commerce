using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.IO;
using System.Security;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;



namespace ahmet_koray_eticaret
{
    public partial class Uyeprofil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlisim.Visible = false;
                pnlsifre.Visible = false;
                pnladres.Visible = false;
                pnluyeadres.Visible = false;
                ddlil.AutoPostBack = true;
                ddlilce.AutoPostBack = true;

                panelsec();
                uyeprofil();
            }

            
        }

        private void panelsec()
        {
            string panelno = Request.QueryString["panelno"];

            if (panelno != null) { 
                switch (int.Parse(panelno))
                {
                    case 0:
                        pnluyeadres.Visible = true;
                        break;

                    case 1:
                        pnlisim.Visible = true;
                        break;
                    case 2:
                        pnlsifre.Visible = true;
                        break;
                    case 3: pnladres.Visible = true;
                        break;

                    default:
                        break;
                }
            }
        }

        private void uyeprofil()
        {
            

            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = "Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true";

            conn.Open();

            SqlCommand cmd = new SqlCommand("select upper(uye_adi) as ad ,upper(uye_soyadi) as soyad,adres,telefon,il_adi,ilce_adi from uyeadres inner join iller on uyeadres.il=iller.id inner join ilceler on uyeadres.il=ilceler.il_kodu inner join uyeler on uyeadres.uye_id=uyeler.id where uyeadres.ilce=ilceler.id and uye_id=(select id from uyeler where email='"+ Session["user"].ToString() + "') ", conn);



            SqlDataAdapter sda = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();
            sda.Fill(dt);
            rptuyeprofil.DataSource = dt;
            rptuyeprofil.DataBind();


        }


        protected void btnisim_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = "Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true";

            conn.Open();


            if (tbisim.Text != null && tbsoyisim != null)
            {

                SqlCommand sqlkod = new SqlCommand("update uyeler set uye_adi='" + tbisim.Text + "', uye_soyadi='" + tbsoyisim.Text + "' where email='" + Session["user"].ToString() + "' ", conn);

                sqlkod.ExecuteNonQuery();

                Response.Redirect("Uyeprofil.aspx?panelno=0");
            }

            else
                return;
            
            conn.Dispose();
            conn.Close();
        }

        [Obsolete]
        protected void btnsifre_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = "Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true";

            conn.Open();

            string mevcut_sifre = FormsAuthentication.HashPasswordForStoringInConfigFile(tbmevcutsfr.Text, "MD5");

            SqlCommand sqlsifre = new SqlCommand("select count(*)  from uyeler where sifre='" + mevcut_sifre + "'", conn);


            if ((tbmevcutsfr.Text != null) && (tbyenisfr.Text != null) && (tbsfrtekrar.Text != null))
            {
                if (int.Parse(sqlsifre.ExecuteScalar().ToString()) == 1)
                {
                    if (tbyenisfr.Text.Length > 7 && tbsfrtekrar.Text.Length > 7)
                    {
                        if (tbyenisfr.Text == tbsfrtekrar.Text)
                        {
                            string yeni_sifre = FormsAuthentication.HashPasswordForStoringInConfigFile(tbyenisfr.Text, "MD5");

                            SqlCommand sqlyenisifre = new SqlCommand("update uyeler set sifre='" + yeni_sifre + "' where email='" + Session["user"].ToString() + "' ", conn);

                            sqlyenisifre.ExecuteNonQuery();

                            Response.Write("<script> alert('Sifreniz Başarıyla Değiştirildi!')</script>");
                            Response.Redirect("Uyeprofil.aspx?panelno=0");

                        }
                        else
                        {
                            Response.Write("<script> alert(' Girilen Sifreler Uyuşmuyor!')</script>");
                            return;
                        }

                    }

                }

            }

            else
                return;

            conn.Dispose();
            conn.Close();
        }

        protected void btnadres_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = "Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true";

            conn.Open();

            
            if (taAdres.Value != null && tbtel.Text != null)
            {
                //uye adresi sayiya dönüstür 

                SqlCommand sqlkod = new SqlCommand("update uyeadres set adres='" + taAdres.Value + "', il='" + ddlil.SelectedValue + "' , ilce='" + ddlilce.SelectedValue + "',telefon='" + tbtel.Text + "' where uye_id=(select id  from uyeler where email='" + Session["user"].ToString() + "' )", conn);

                sqlkod.ExecuteNonQuery();

                Response.Write("<script>alert('Adres Bilgileriniz GÜncellendi!')</script>");

                Response.Redirect("Uyeprofil.aspx?panelno=0");

            }
            else
            {
                if (taAdres.Value == null)
                    Response.Write("<script> alert(' Adres boş geçilemez!')</script>");

                if (tbtel.Text == null)
                    Response.Write("<script> alert(' Telefon boş geçilemez!')</script>");

                return;
            }
            

            conn.Dispose();
            conn.Close();
        }
    }
}