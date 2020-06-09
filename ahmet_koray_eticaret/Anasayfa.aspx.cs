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
using System.Security;
using System.Web.Security;

namespace ahmet_koray_eticaret
{
    public partial class WebForm1 : System.Web.UI.Page
    {



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
               urunlerilistele();

            }
        }

        static string email = "";

        protected void btnsifreunuttum_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = "Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true";

            conn.Open();

            email = tbemail.Text;

            if ((email != "") && (tbguvenliksifresi.Text != "")) { 

                SqlCommand sifreunuttum = new SqlCommand("select count(*) from uyeler where email='" + email + "' and  guvenlik_kodu='" + tbguvenliksifresi.Text + "'", conn);

                if (int.Parse(sifreunuttum.ExecuteScalar().ToString())==1)
                {
                    Response.Redirect("Anasayfa.aspx?sifreunuttum=2");
                }
                else
                {
                    Response.Write("<script> alert('Girmiş Olduğunuz Değerler İle Herhangi Bir Veriye Ulaşılamadı!') </script>");
                }
            }

            else
            {
                Response.Write("<script> alert('Lütfen Herhangi Boş Alan Bırakmayınız!') </script>");
            }

            conn.Dispose();

            conn.Close();


        }

        [Obsolete]
        protected void btnsifreguncelle_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = "Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true";

            conn.Open();

            

            if ((tbsifre.Text != "") && (tbsifre2.Text != ""))
            {
                if ((tbsifre.Text.Length > 7) && (tbsifre2.Text.Length > 7))
                { 
                    if (tbsifre.Text == tbsifre2.Text)
                    {

                        string md5_sifre = FormsAuthentication.HashPasswordForStoringInConfigFile(tbsifre.Text, "MD5");

                        SqlCommand sifreguncelle = new SqlCommand("update uyeler set sifre='"+md5_sifre+"' where email='"+ email + "'", conn);

                        sifreguncelle.ExecuteNonQuery();

                        ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Şifreniz Başarıyla Değiştirildi');window.location='Anasayfa.aspx';", true);
                    }

                    else
                    {
                        Response.Write("<script> alert('Girilen Şifreler Birbirleri İle Eşleşmemektedir Lütfen Kontrol Ediniz') </script>");
                    }

                }

                else
                {
                    Response.Write("<script> alert('Şifreniz En az 8 basamak uzunlugunda olmalıdır') </script>");
                }
            }

            else
            {
                Response.Write("<script> alert('Lütfen Herhangi Boş Alan Bırakmayınız!') </script>");
            }

            conn.Dispose();

            conn.Close();

        }


        private void urunlerilistele()
        {
            string minfiyat = Request.QueryString["minfiyat"];

            string maxfiyat = Request.QueryString["maxfiyat"];

            string urunturusec = Request.QueryString["urunturusec"];

            string markasec = Request.QueryString["markasec"];

            string urunsirala = Request.QueryString["urunsirala"];

            string ddlindex = Request.QueryString["ddlindex"];


            if (maxfiyat!=null && minfiyat != null)
            {
                numbermin.Text = minfiyat;
                numbermax.Text = maxfiyat;

            }
            
            //dropdownlist secimi tutma
            if(ddlindex!=null)
                ddlurunlistele.Items[int.Parse(ddlindex)].Selected = true;



            string sqlkod = "";

            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = "Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true";

            conn.Open();

            //ANASAYFA GİRİS SIRALAMA

            if((markasec==null) && (urunturusec == null) && (minfiyat == null) && (maxfiyat == null))
            {

                sqlkod = "select urunler.id as id,urun_adi as urunadi ,urun_baslik,urun_fiyat,urun_resim from urunler inner join urunmarka on urunler.urun_marka=urunmarka.id  WHERE urun_durum=2 and urun_stok>0 and urun_fiyat between 0 and 1000 ";

                SqlCommand cmd = new SqlCommand(sqlkod, conn);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rpturunler.DataSource = dt;
                rpturunler.DataBind();

                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = dt.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = 9;
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

                if (currentPage > 2) { 
                    linkbasadon.NavigateUrl = "Anasayfa.aspx?page=1";
                    linkbasadon.Text = "basadön";
                }

                if (!pds.IsFirstPage)
                {
                    linkonceki.NavigateUrl = "Anasayfa.aspx?page=" + (currentPage - 1);
                    linkonceki.Text = (currentPage - 1).ToString();
                }

                linkgecerlisayfa.NavigateUrl = "Anasayfa.aspx?page=" + (currentPage);
                linkgecerlisayfa.Text = currentPage.ToString();

               
                if (!pds.IsLastPage)
                {
                    linksonraki.NavigateUrl = "Anasayfa.aspx?page=" + (currentPage + 1);
                    linksonraki.Text = (currentPage + 1).ToString();
                }

                if (currentPage < pds.PageCount-1)
                {
                    linksonagit.NavigateUrl = "Anasayfa.aspx?page="+ pds.PageCount;
                    linksonagit.Text = "sonagit";
                }

                rpturunler.DataSource = pds;
                rpturunler.DataBind();

                conn.Dispose();
                conn.Close();
            }
            
            //TÜR MARKA VE FİYATA GÖRE SIRALAMA 

            else if ((markasec != null) && (urunturusec != null) && (minfiyat != null) && (maxfiyat != null))
            {

                sqlkod = "SELECT urunler.id as id,urunmarka.urun_adi as urunadi,urun_baslik,urun_fiyat,urun_resim FROM urunler inner join urunturu ON urunler.urun_turu=urunturu.id inner join urunmarka ON urunler.urun_marka=urunmarka.id WHERE urun_durum=2 and urun_stok>0 and urunler.urun_turu IN (" + urunturusec + ") and  urunler.urun_marka IN (" + markasec + ") and urun_fiyat between " + minfiyat + " and " +maxfiyat + urunsirala + "";

                SqlCommand cmd = new SqlCommand(sqlkod, conn);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();
                sda.Fill(dt);
                rpturunler.DataSource = dt;
                rpturunler.DataBind();

                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = dt.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = 9;
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
                    linkbasadon.NavigateUrl = "Anasayfa.aspx?urunturusec"+ urunturusec + "&markasec=" + markasec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";
                    linkbasadon.Text = "basadön";
                }

                if (!pds.IsFirstPage)
                {
                    linkonceki.NavigateUrl = "Anasayfa.aspx?page=" + (currentPage - 1)+ "&urunturusec" + urunturusec + "&markasec=" + markasec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";
                    linkonceki.Text = (currentPage - 1).ToString();
                }

                linkgecerlisayfa.NavigateUrl = "Anasayfa.aspx?page=" + (currentPage)+ "&urunturusec" + urunturusec + "&markasec=" + markasec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";
                linkgecerlisayfa.Text = currentPage.ToString();


                if (!pds.IsLastPage)
                {
                    linksonraki.NavigateUrl = "Anasayfa.aspx?page=" + (currentPage + 1)+ "&urunturusec" + urunturusec + "&markasec=" + markasec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";
                    linksonraki.Text = (currentPage + 1).ToString();
                }

                if (currentPage < pds.PageCount - 1)
                {
                    linksonagit.NavigateUrl = "Anasayfa.aspx?page=" + pds.PageCount+"&urunturusec"+ urunturusec + " & markasec = " + markasec + " & minfiyat = " + minfiyat + " & maxfiyat = " + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";
                    linksonagit.Text = "sonagit";
                }

                rpturunler.DataSource = pds;
                rpturunler.DataBind();

                conn.Dispose();
                conn.Close();
            }

            //URUN TURU VE FİYATA GÖRE FİLTRE 
            else if ((markasec == null) && (urunturusec != null) && (minfiyat != null) && (maxfiyat != null))
            {

                sqlkod = "SELECT urunler.id as id,urunmarka.urun_adi as urunadi ,urun_baslik,urun_fiyat,urun_resim FROM urunler inner join urunturu ON urunler.urun_turu=urunturu.id inner join urunmarka ON urunler.urun_marka=urunmarka.id WHERE urun_durum=2 and urun_stok>0 and urunler.urun_turu IN (" + urunturusec + ") and urun_fiyat between " + minfiyat + " and " +maxfiyat + urunsirala + "";

                SqlCommand cmd = new SqlCommand(sqlkod, conn);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();
                sda.Fill(dt);
                rpturunler.DataSource = dt;
                rpturunler.DataBind();

                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = dt.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = 9;
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
                    linkbasadon.NavigateUrl = "Anasayfa.aspx?urunturusec" + urunturusec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";
                    linkbasadon.Text = "basadön";
                }

                if (!pds.IsFirstPage)
                {
                    linkonceki.NavigateUrl = "Anasayfa.aspx?page=" + (currentPage - 1)+ "&urunturusec" + urunturusec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";
                    linkonceki.Text = (currentPage - 1).ToString();
                }

                linkgecerlisayfa.NavigateUrl = "Anasayfa.aspx?page=" + (currentPage)+ "&urunturusec" + urunturusec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";
                linkgecerlisayfa.Text = currentPage.ToString();


                if (!pds.IsLastPage)
                {
                    linksonraki.NavigateUrl = "Anasayfa.aspx?page=" + (currentPage + 1)+ "&urunturusec" + urunturusec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";
                    linksonraki.Text = (currentPage + 1).ToString();
                }

                if (currentPage < pds.PageCount - 1)
                {
                    linksonagit.NavigateUrl = "Anasayfa.aspx?page=" + pds.PageCount+ "&urunturusec" + urunturusec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";
                    linksonagit.Text = "sonagit";
                }

                rpturunler.DataSource = pds;
                rpturunler.DataBind();

                conn.Dispose();
                conn.Close();
            }

            //MARKA VE FİYATA GÖRE FİLTRE 
            else if ((markasec != null) && (urunturusec == null) && (minfiyat != null) && (maxfiyat != null))
            {

                sqlkod = "SELECT urunler.id as id,urunmarka.urun_adi as urunadi ,urun_baslik,urun_fiyat,urun_resim FROM urunler inner join urunturu ON urunler.urun_turu=urunturu.id inner join urunmarka ON urunler.urun_marka=urunmarka.id WHERE urun_durum=2 and urun_stok>0 and urunler.urun_marka IN (" + markasec + ") and urun_fiyat between " + minfiyat + " and " +maxfiyat + urunsirala + "";

                SqlCommand cmd = new SqlCommand(sqlkod, conn);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();
                sda.Fill(dt);
                rpturunler.DataSource = dt;
                rpturunler.DataBind();

                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = dt.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = 9;
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
                    linkbasadon.NavigateUrl = "Anasayfa.aspx?&markasec=" + markasec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";
                    linkbasadon.Text = "basadön";
                }

                if (!pds.IsFirstPage)
                {
                    linkonceki.NavigateUrl = "Anasayfa.aspx?page=" + (currentPage - 1)+ "&markasec=" + markasec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";

                    linkonceki.Text = (currentPage - 1).ToString();
                }

                linkgecerlisayfa.NavigateUrl = "Anasayfa.aspx?page=" + (currentPage)+ "&markasec=" + markasec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";

                linkgecerlisayfa.Text = currentPage.ToString();


                if (!pds.IsLastPage)
                {
                    linksonraki.NavigateUrl = "Anasayfa.aspx?page=" + (currentPage + 1)+ "&markasec=" + markasec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";

                    linksonraki.Text = (currentPage + 1).ToString();
                }

                if (currentPage < pds.PageCount - 1)
                {
                    linksonagit.NavigateUrl = "Anasayfa.aspx?page=" + pds.PageCount+ "&markasec=" + markasec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";

                    linksonagit.Text = "sonagit";
                }

                rpturunler.DataSource = pds;
                rpturunler.DataBind();

                conn.Dispose();
                conn.Close();
            }

            //FİYATA GÖRE FİLTRE
            else if ((markasec == null) && (urunturusec == null) && (minfiyat != null) && (maxfiyat != null))
            {

                sqlkod = "SELECT urunler.id as id,urunmarka.urun_adi as urunadi,urun_baslik,urun_fiyat,urun_resim FROM urunler inner join urunturu ON urunler.urun_turu=urunturu.id inner join urunmarka ON urunler.urun_marka=urunmarka.id WHERE urun_durum=2 and urun_stok>0 and urun_fiyat between " + minfiyat + " and " + maxfiyat + urunsirala + "";

                SqlCommand cmd = new SqlCommand(sqlkod, conn);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();
                sda.Fill(dt);
                rpturunler.DataSource = dt;
                rpturunler.DataBind();

                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = dt.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = 9;
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
                    linkbasadon.NavigateUrl = "Anasayfa.aspx?minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";
                    linkbasadon.Text = "basadön";
                }

                if (!pds.IsFirstPage)
                {
                    linkonceki.NavigateUrl = "Anasayfa.aspx?page=" + (currentPage - 1)+ "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";
                    linkonceki.Text = (currentPage - 1).ToString();
                }

                linkgecerlisayfa.NavigateUrl = "Anasayfa.aspx?page=" + (currentPage)+ "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";
                linkgecerlisayfa.Text = currentPage.ToString();


                if (!pds.IsLastPage)
                {
                    linksonraki.NavigateUrl = "Anasayfa.aspx?page=" + (currentPage + 1)+ "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";
                    linksonraki.Text = (currentPage + 1).ToString();
                }

                if (currentPage < pds.PageCount - 1)
                {
                    linksonagit.NavigateUrl = "Anasayfa.aspx?page=" + pds.PageCount+ "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "";
                    linksonagit.Text = "sonagit";
                }

                rpturunler.DataSource = pds;
                rpturunler.DataBind();

                conn.Dispose();
                conn.Close();
            }
            
        }


        protected void btnuygula_Click(object sender, EventArgs e)
        {

            string urunturusec = "", markasec = "",urunsirala="",ddlindex="";

            if (numbermax.Text == "" || numbermin.Text == "")
            {
                numbermin.Text = "0";
                numbermax.Text = "1000";

            }


            if (int.Parse(numbermax.Text) < int.Parse(numbermin.Text))
            {
                Response.Write("<script>alert('Fiyat kıyaslaması yanlış girilmiştir ')</script>");
                return;
            }


            if (chblurunturu.SelectedIndex > -1)
            {
                for (int i = 0; i < chblurunturu.Items.Count; i++)
                {
                    if (chblurunturu.Items[i].Selected)
                    {
                        urunturusec += chblurunturu.Items[i].Value + ",";        
                    }
                }
                urunturusec = urunturusec.Substring(0, urunturusec.Length - 1);
            }

            if (chblmarkalar.SelectedIndex > -1)
            {
                for (int i = 0; i < chblmarkalar.Items.Count; i++)
                {
                    if (chblmarkalar.Items[i].Selected)
                    {
                        markasec += chblmarkalar.Items[i].Value + ",";
                    }
                }
                markasec = markasec.Substring(0, markasec.Length - 1);
            }


            
            urunsirala=ddlurunlistele.SelectedValue.ToString();
            ddlindex = ddlurunlistele.SelectedIndex.ToString();

            //tur-marka-fiyat filitreleme
            if ((chblurunturu.SelectedIndex > -1) && (chblmarkalar.SelectedIndex > -1) && (numbermin.Text != null) && (numbermax.Text != null) )
            {
                Response.Redirect("Anasayfa.aspx?urunturusec=" + urunturusec + "&markasec=" + markasec + "&minfiyat=" + numbermin.Text + "&maxfiyat=" + numbermax.Text + "&urunsirala="+urunsirala+ "&ddlindex=" + ddlindex+ "");
            }

            //tur ve fiyat filitre
            else if ((chblurunturu.SelectedIndex > -1) && (numbermin.Text != null) && (numbermax.Text != null))
            {
                Response.Redirect("Anasayfa.aspx?urunturusec=" + urunturusec + "&minfiyat=" + numbermin.Text + "&maxfiyat=" + numbermax.Text + "&urunsirala=" + urunsirala + "&ddlindex="+ ddlindex +"");
            }


            //marka ve fiyat filitre
            else if ((numbermin.Text != null) && (numbermax.Text != null) && (chblmarkalar.SelectedIndex > -1))
            {
                Response.Redirect("Anasayfa.aspx?markasec="+markasec+"&minfiyat=" + numbermin.Text + "&maxfiyat=" + numbermax.Text + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex +"");
            }

            //sadece fiyat filitre
            else if ((numbermin.Text != null) && (numbermax.Text != null))
            {
                Response.Redirect("Anasayfa.aspx?minfiyat=" + numbermin.Text + "&maxfiyat=" + numbermax.Text + "&urunsirala=" + urunsirala + "&ddlindex=" + ddlindex + "");
            }

        }
    }

}
  
