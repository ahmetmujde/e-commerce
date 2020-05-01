using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace ahmet_koray_eticaret
{
    public partial class Sepet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
                //sepet ürün id 
                string sepetekle = Request.QueryString["sepetekle"];

                if (Session["user"] != null)
                { 
                    SqlConnection conn = new SqlConnection();

                    conn.ConnectionString = "Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true";

                    conn.Open();

                    //diger sayfalardan gelen veriyi ekleme ekleme

                    if (sepetekle != null)
                    {
                        SqlCommand sqlkod = new SqlCommand("select sepet.urun_adedi as adet from sepet where sepet_urun=" + sepetekle + "  and satin_alan_uye = (select id from uyeler where email ='" + Session["user"].ToString() + "')", conn);

                        if (sqlkod.ExecuteScalar() == null)
                        {
                            SqlCommand urunekle = new SqlCommand("insert into sepet values((select id from uyeler where email='" + Session["user"].ToString() + "')," + sepetekle + ",1)", conn);

                            urunekle.ExecuteNonQuery();
                        }


                        else if (int.Parse(sqlkod.ExecuteScalar().ToString()) >= 1)
                        {
                            SqlCommand sqlurunarttir = new SqlCommand("update sepet set urun_adedi = (" +(int.Parse(sqlkod.ExecuteScalar().ToString())+1) + ") where satin_alan_uye=(select id from uyeler where email='" + Session["user"].ToString() + "') and sepet.sepet_urun=(" + sepetekle + ")", conn);
                            sqlurunarttir.ExecuteNonQuery();

                        }


                    }
                    conn.Dispose();
                    conn.Close();
                }
                rbtaksit.Visible = false;
            }

            cbpesin.AutoPostBack = true;
            cbtaksit.AutoPostBack = true;

            if (cbtaksit.Checked == false)
            {
                cbpesin.Checked = true;
                rbtaksit.Visible = false;
            }

            else if(cbtaksit.Checked==true)
            {
                cbpesin.Checked = false;
                rbtaksit.Visible = true;
            }

            sepetlistele();

            islemler();
        }


        private void sepetlistele()
        {
            string sqlkod;

            if (Session["user"] != null)
            {
                SqlConnection conn = new SqlConnection();

                conn.ConnectionString = "Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true";

                conn.Open();

                sqlkod = "select  ROW_NUMBER ( ) OVER(ORDER BY sepet.id) as urunsay ,sepet.id as id ,urunler.urun_baslik as urun_adi,urun_adedi,urunler.urun_fiyat as fiyat,urunler.urun_fiyat*urun_adedi as adet_fiyati from sepet inner join urunler on sepet_urun = urunler.id where satin_alan_uye = (select id from uyeler where email = '" + Session["user"].ToString() + "')";

                SqlCommand sorgu = new SqlCommand(sqlkod, conn);

                SqlDataAdapter sda = new SqlDataAdapter(sorgu);

                DataTable dt = new DataTable();

                sda.Fill(dt);

                rpturunler.DataSource = dt;
                rpturunler.DataBind();


                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = dt.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = 3;
                int currentPage;

                if (Request.QueryString["page"] != null)
                {
                    currentPage = Int32.Parse(Request.QueryString["page"]);
                }
                else
                {
                    currentPage = 1;
                }

                pds.CurrentPageIndex = currentPage - 1;

                if (currentPage > 2)
                {
                    linkbasadon.NavigateUrl = "Sepet.aspx?page=1";
                    linkbasadon.Text = "basadön";
                }

                if (!pds.IsFirstPage)
                {
                    linkonceki.NavigateUrl = "Sepet.aspx?page=" + (currentPage - 1);
                    linkonceki.Text = (currentPage - 1).ToString();
                }

                linkgecerlisayfa.NavigateUrl = "Sepet.aspx?page=" + (currentPage);
                linkgecerlisayfa.Text = currentPage.ToString();


                if (!pds.IsLastPage)
                {
                    linksonraki.NavigateUrl = "Sepet.aspx?page=" + (currentPage + 1);
                    linksonraki.Text = (currentPage + 1).ToString();
                }

                if (currentPage < pds.PageCount - 1)
                {
                    linksonagit.NavigateUrl = "Sepet.aspx?page=" + pds.PageCount;
                    linksonagit.Text = "sonagit";
                }

                rpturunler.DataSource = pds;
                rpturunler.DataBind();

                //siparis butonunu Sepet sayısına göre gösterme yada gizleme 

                SqlCommand sepetsayi = new SqlCommand("select count(*) from sepet where sepet.satin_alan_uye=(select id from uyeler where email='" + Session["user"].ToString() + "')", conn);

                if (sepetsayi.ExecuteScalar().ToString() == "0")
                { 
                    btnsiparis.Visible = false;
                    btnadres.Visible = false;
                    pnlsayfalama.Visible = false;
                }
                else { 
                    btnsiparis.Visible = true;
                    btnadres.Visible = true;
                    pnlsayfalama.Visible = true;

                    Response.Cookies["sepetsayi"].Value = sepetsayi.ExecuteScalar().ToString();

                    Response.Cookies["sepetsayi"].Expires = DateTime.Now.AddDays(1);
                }
                conn.Dispose();
                conn.Close();

                

            }


        }

        private void islemler()
        {
            string  adet= Request.QueryString["adet"], 
                    azalt = Request.QueryString["azalt"], 
                    arttir = Request.QueryString["arttir"], 
                    iptal = Request.QueryString["iptal"];

            string totalsayi = "";

            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = "Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true";

            conn.Open();


            if (azalt != null)
            {

                totalsayi = (int.Parse(adet) - 1).ToString();

                if(int.Parse(totalsayi)<=0)
                {

                    SqlCommand sqlkod = new SqlCommand("delete from sepet where id=('" + azalt + "')", conn);

                    sqlkod.ExecuteNonQuery();
                }

                else if(int.Parse(totalsayi)>0)
                {
                    SqlCommand sqlkod = new SqlCommand("update sepet set urun_adedi = (" + totalsayi + ") where satin_alan_uye=(select id from uyeler where email='" + Session["user"].ToString() + "') and id=(" + azalt + ")", conn);

                    sqlkod.ExecuteNonQuery();

                }

                Response.Redirect("Sepet.aspx");
            }

            if (arttir != null)
            {
                totalsayi = (int.Parse(adet) + 1).ToString();

                SqlCommand sqlkod = new SqlCommand("update sepet set urun_adedi = (" + totalsayi + ") where satin_alan_uye=(select id from uyeler where email='" + Session["user"].ToString() + "') and id=(" + arttir + ")", conn);

                sqlkod.ExecuteNonQuery();

                Response.Redirect("Sepet.aspx");

            }


            if (iptal != null)
            {

                SqlCommand sqlkod = new SqlCommand("delete from sepet where id=("+iptal+")", conn);

                sqlkod.ExecuteNonQuery();


                Response.Redirect("Sepet.aspx");
            }

            conn.Dispose();
            conn.Close();

        }

        protected void btnsiparis_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = "Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true";

            conn.Open();

            SqlCommand sipariskod = new SqlCommand("select count(*) from uyeadres where uye_id=(select id from uyeler where email='" + Session["user"].ToString() + "')", conn);


            if (sipariskod.ExecuteScalar().ToString() == "0")
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Adres bilgileriniz eksik! Yönlendiriliyorsunuz...');window.location='Uyeprofil.aspx?panelno=0';", true);


            else if (sipariskod.ExecuteScalar().ToString() == "1")
            {


                //işlem : siparis kayıt ekleme ve sepetteki eşyaları silme 

                //siparisler tablosuna kayıt 
                SqlCommand siparisiekle = new SqlCommand("", conn);

                siparisiekle.ExecuteNonQuery();


                //sepetteki ürünlerin silme 
                SqlCommand sepetsil = new SqlCommand("", conn);

                sepetsil.ExecuteNonQuery();


                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Siparişiniz Eksiksiz Biçimde Alındı ');window.location='Anasayfa.aspx';", true);

            }
        }


        protected void btnfarkliadres_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = "Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true";

            conn.Open();

            SqlCommand sipariskod = new SqlCommand("select count(*) from uyeadres where uye_id=(select id from uyeler where email='" + Session["user"].ToString() + "')", conn);


            if (sipariskod.ExecuteScalar().ToString() == "0")
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Adres bilgileriniz eksik! Yönlendiriliyorsunuz...');window.location='Uyeprofil.aspx?panelno=0';", true);


            else if (sipariskod.ExecuteScalar().ToString() == "1")
            {


                //burada kaldık işlem : siparis kayat ekleme ve sepetteki eşyaları silme 

                //siparisler tablosuna kayıt 

                SqlCommand sqlkod = new SqlCommand("", conn);

                sqlkod.ExecuteNonQuery();

                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Siparişiniz Eksiksiz Biçimde Alındı ');window.location='Anasayfa.aspx';", true);

            }
        }

    }  
}