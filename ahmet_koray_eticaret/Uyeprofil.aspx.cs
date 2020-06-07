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
                if (Session["user"] != null)
                {
                    pnlisim.Visible = false;
                    pnlsifre.Visible = false;
                    pnladres.Visible = false;
                    pnlsiparis.Visible = false;
                    pnluyeadres.Visible = false;
                    ddlil.AutoPostBack = true;
                    ddlilce.AutoPostBack = true;

                    panelsec();
                    uyeprofil();

                }

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
                    case 4: pnlsiparis.Visible = true; siparisler();
                        break;

                    default:
                        break;
                }
            }
            
        }

        private void siparisler()
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = "Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true";

            conn.Open();

            SqlCommand siparis = new SqlCommand("select sd.durum_adi,urunler.urun_baslik,s.urun_adedi,i.il_adi,ilceler.ilce_adi,uyeadres.adres,s.toplam_fiyat,k.kargo_adi,convert(varchar,s.satis_tarihi,106) as tarih from siparisler as s inner join siparisdurumu as sd on s.siparis_durumu=sd.id inner join urunler on urunler.id=s.siparis_urun inner join kargosirketleri k on k.id=s.kargo_firmasi inner join iller as i on i.id=s.gonderilen_il inner join ilceler on ilceler.id=s.gonderilen_ilce inner join uyeadres on s.adres=uyeadres.id where satin_alan_uye=(select id from uyeler where email='" + Session["user"].ToString() + "')", conn);

            SqlDataAdapter sda = new SqlDataAdapter(siparis);

            DataTable dt = new DataTable();

            sda.Fill(dt);

            rptsiparis.DataSource = dt;
            rptsiparis.DataBind();


            conn.Dispose();
            conn.Close();

        }


        private void uyeprofil()
        {
            

            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = "Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true";

            conn.Open();

            SqlCommand cmd = new SqlCommand("select  ROW_NUMBER ( ) OVER(ORDER BY adres) as satir,adres,telefon,il_adi,ilce_adi from uyeadres inner join iller on uyeadres.il=iller.id inner join ilceler on uyeadres.il=ilceler.il_kodu inner join uyeler on uyeadres.uye_id=uyeler.id where uyeadres.ilce=ilceler.id and uye_id=(select id from uyeler where email='" + Session["user"].ToString() + "') ", conn);



            SqlDataAdapter sda = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();
            sda.Fill(dt);
            rptuyeprofil.DataSource = dt;
            rptuyeprofil.DataBind();


            SqlCommand adresler = new SqlCommand("select upper(adres) as adres,id from uyeadres where uye_id = (select id from uyeler where email = '" + Session["user"].ToString() + "' )", conn);

            SqlDataReader adresoku = adresler.ExecuteReader();



            while (adresoku.Read())
            {

                rbladres.Items.Add(new ListItem(adresoku[0].ToString(), adresoku[1].ToString()));
            }

            conn.Dispose();
            conn.Close();


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

            SqlCommand adres_sayisi = new SqlCommand("select count(*) from uyeadres where uye_id=(select id from uyeler where email ='"+ Session["user"].ToString() + "')", conn);

            if (int.Parse(adres_sayisi.ExecuteScalar().ToString()) > 0)
            {

                if(rbladres.SelectedItem == null)
                {
                    Response.Write("<script> alert('Lütfen Seçeceginiz Adresi Seçiniz!')</script>");
                }

                else
                {

                    if ((taAdres.Value != "") && (tbtel.Text != ""))
                    {

                        SqlCommand sqlupdate = new SqlCommand("update uyeadres set adres='" + taAdres.Value + "', il='" + ddlil.SelectedValue + "' , ilce='" + ddlilce.SelectedValue + "',telefon='" + tbtel.Text + "',guncellenme_tarihi='" + DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss") + "'   where id='" + rbladres.SelectedItem.Value + "' and uye_id=(select id  from uyeler where email='" + Session["user"].ToString() + "' )", conn);

                        sqlupdate.ExecuteNonQuery();


                        Response.Write("<script>alert('Adres Bilgileriniz GÜncellendi!')</script>");

                        Response.Redirect("Uyeprofil.aspx?panelno=0");


                    }

                    else
                    {
                        Response.Write("<script> alert('Lütfen Boş Alan Bırakmayınız!')</script>");
                    }
                }


            }


            else
            {
                if ((taAdres.Value != "") && (tbtel.Text != ""))
                {
                    SqlCommand sqlinsert = new SqlCommand("insert into uyeadres (uye_id,adres,il,ilce,telefon) values ((select id  from uyeler where email='" + Session["user"].ToString() + "'),'" + taAdres.Value + "','" + ddlil.SelectedValue + "','" + ddlilce.SelectedValue + "','" + tbtel.Text + "')", conn);

                    sqlinsert.ExecuteNonQuery();


                    Response.Write("<script>alert('Adres Bilgileriniz GÜncellendi!')</script>");

                    Response.Redirect("Uyeprofil.aspx?panelno=0");

                }


                else
                {
                    Response.Write("<script> alert('Lütfen Boş Alan Bırakmayınız!')</script>");
                }

            }

            conn.Dispose();
            conn.Close();
        }
    }
}