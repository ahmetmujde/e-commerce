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
    public partial class Site1 : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
               
                if (Request.Cookies["user"] != null)
                {
                    checker.Checked = true;
                }

            }

            if (Request.Cookies["user"] != null)
            {
                tbemail.Text = Request.Cookies["user"]["username"];

            }


        }


        


        [Obsolete]
        protected void btgiris_Click(object sender, EventArgs e)
        {
            string user, uyedurum;

            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = "Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true";

            conn.Open();

            string veritabani_sifre = FormsAuthentication.HashPasswordForStoringInConfigFile(tbpassword.Text, "MD5");

            SqlCommand comm = new SqlCommand("select count(*)  from uyeler where email='" + tbemail.Text + "' and sifre='" + veritabani_sifre + "'", conn);

            user = comm.ExecuteScalar().ToString();

            if (tbemail.Text == string.Empty || tbpassword.Text == string.Empty)
                Response.Write("<script>alert(' LÜTFEN BİLGİLERİNİZİ EKSİKSİZ GİRİNİZ!')</script>");

            else if (int.Parse(user) != 1)
                Response.Write("<script>alert('E-POSTA VEYA SİFRENİZ YANLIŞ!')</script>");


            else if (int.Parse(user) == 1)
            {
                
                SqlCommand uyedurumsorgu = new SqlCommand("select uyeler.uye_durum from uyeler where email='" + tbemail.Text + "' and sifre='" + veritabani_sifre + "'", conn);

                uyedurum = uyedurumsorgu.ExecuteScalar().ToString();

                if (int.Parse(uyedurum) == 1)
                { 
                    //admin  paneli eklendiginde uyeturude eklenecek 

                    if (checker.Checked == true)
                    {
                        HttpCookie cerez = new HttpCookie("user");

                        cerez["username"] = tbemail.Text;

                        cerez.Expires = DateTime.Now.AddDays(1);

                        Response.Cookies.Add(cerez);
                    }

                    else
                    {
                        Response.Cookies["user"].Expires = DateTime.Now.AddDays(-1);
                    }



                    Session.Add("user", tbemail.Text);

                    //sepetteki toplam sayi 

                    if (Session["user"] != null)
                    {
                        SqlCommand sepetsorgu = new SqlCommand("select count(*)  from sepet where satin_alan_uye=(select id from uyeler where email='" + Session["user"].ToString() + "')", conn);

                        Response.Cookies["sepetsayi"].Value = sepetsorgu.ExecuteScalar().ToString();

                        Response.Cookies["sepetsayi"].Expires = DateTime.Now.AddDays(1);

                    }


                    Response.Redirect("Anasayfa.aspx");
                }

                else
                {
                    Response.Write("<script>alert('Üyeliğiniz bir süreliğine askıya alındı! Daha fazla bilgi için ilgili birime başvurunuz ')</script>");

                }

            }


            conn.Close();

            conn.Dispose();
        }


        protected void btnuyeprofil_Click(object sender,EventArgs e)
        {
           
            Response.Redirect("Uyeprofil.aspx?panelno=0");

        }

        [Obsolete]
        protected void btkayit_Click(object sender, EventArgs e)
        {
         
            DateTime tarih = DateTime.Now;

            string email_sayisi;

            int randomsayi;

            Random r = new Random();

            randomsayi = r.Next(1000, 9999);

            string guvenlik_kodu = tarih.ToString("yyyyMMddHHmmss") + randomsayi.ToString();

            guvenlik_kodu = guvenlik_kodu.Substring(2, 15);

            if (!Page.IsValid) //eposta kontrolü
                return;

            if ((tbpassword2.Text.Length < 8) || (tbpassword3.Text.Length < 8))
            {

                Response.Write("<script>alert(' Sifreniz en az 8 karakter uzunlugunda olmalıdır!')</script>");

                tbpassword2.Text = "";

                tbpassword2.Text = "";

                return;


            }

            SqlConnection conn = new SqlConnection("Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true");

            conn.Open();

            SqlCommand sorgu_eposta = new SqlCommand("select count(*) from uyeler where email='"+tbemail2.Text+"'", conn);

            email_sayisi = (sorgu_eposta.ExecuteScalar()).ToString();


            if (tbad.Text == string.Empty || tbsoyad.Text == string.Empty || tbemail2.Text == string.Empty || tbpassword2.Text == string.Empty || tbpassword3.Text == string.Empty)
                Response.Write("<script> alert(' LÜTFEN BİLGİLERİNİZİ EKSİKSİZ GİRİNİZ!')</script>");

            else if (0==int.Parse(email_sayisi))
            {

                 if ((tbpassword2.Text.ToString()) == (tbpassword3.Text.ToString()))
                {

                    SqlConnection conn2 = new SqlConnection("Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true");

                    conn2.Open();

                    string md5_sifre = FormsAuthentication.HashPasswordForStoringInConfigFile(tbpassword2.Text, "MD5");
 

                    SqlCommand sorgu_kayit = new SqlCommand("insert into uyeler (uye_adi,uye_soyadi,email,sifre,guvenlik_kodu,kayit_tarihi) values (@ad,@soyad,@email,@sifre,@guvkodu,@kyt_tarih) ", conn);

                    sorgu_kayit.Parameters.AddWithValue("@ad", tbad.Text);
                    sorgu_kayit.Parameters.AddWithValue("@soyad", tbsoyad.Text);
                    sorgu_kayit.Parameters.AddWithValue("@email", tbemail2.Text);
                    sorgu_kayit.Parameters.AddWithValue("@sifre", md5_sifre);
                    sorgu_kayit.Parameters.AddWithValue("@guvkodu", guvenlik_kodu.ToString());
                    sorgu_kayit.Parameters.AddWithValue("@kyt_tarih", tarih);

                    int durum = sorgu_kayit.ExecuteNonQuery();

                    if (durum > 0)
                    {
                        Response.Redirect("Anasayfa.aspx?onaydurum=true&guvenlik_kodu=" + guvenlik_kodu.ToString());
                    }

                    conn2.Close();

                    conn2.Dispose();


                    conn.Close();

                    conn.Dispose();

                }

                else {
                    Response.Write("<script>alert('Girilen sifreler hatalı ')</script>");
                    return;
                }

            }

            else{
                Response.Write("<script>alert('Girdiginiz eposta daha önceden kayıt yaptırmış... lütfen farklı bir eposta deyiniz  ')</script>");
                tbemail2.Text = "";
                return;
            }

        }

        protected void btcikis_Click(object sender, EventArgs e)
        {
            Session.Remove("user");
            Response.Cookies["sepetsayi"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("Anasayfa.aspx");     
        }


        protected void btnsifreunuttum_Click(object sender, EventArgs e)
        {
            Response.Redirect("Anasayfa.aspx?sifreunuttum=1");

        }

        protected void btarama_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = "Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true";

            conn.Open();

            SqlCommand arama = new SqlCommand("select id from urunmarka  where urun_adi like '%"+ tbarama.Text + "%'", conn);

            SqlDataReader sdrara = arama.ExecuteReader();

            string markasec = "";

            while (sdrara.Read())
            {
      
                markasec += sdrara["id"] + ",";
            }

            markasec = markasec.Substring(0, markasec.Length - 1);

            Response.Redirect("Anasayfa.aspx?markasec=" + markasec + "&minfiyat=0&maxfiyat=1000&urunsirala=0&ddlindex=0&urunturuindex=0");

            //for ile saydırıp yönlerime yapıp yansıtma olacak 
        }
    }
}
 