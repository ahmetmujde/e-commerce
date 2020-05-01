using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ahmet_koray_eticaret
{
    public partial class Urunler : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            string urun = Request.QueryString["urun"];

            string markaindex = Request.QueryString["markaindex"];

            if (!IsPostBack)
            {
                urunler();

                //sadece urunler sayfasına giris olursa
                if (urun == null)
                    Response.Redirect("Anasayfa.aspx");

               
                /*
                if (markaindex != null)
                {

                    
                    string[] markaindexleri = markaindex.Split(',');

                    foreach (string i in markaindexleri)
                    {
                        chblmarkalar.Items[int.Parse(i)].Selected = true;

                    }
                   
                 
                }
                 */

            }
        }

        private void urunler()
        {
            string urun = Request.QueryString["urun"];

            string minfiyat = Request.QueryString["minfiyat"];

            string maxfiyat = Request.QueryString["maxfiyat"];

            string markasec = Request.QueryString["markasec"];

            string sqlkod = "";


            if (maxfiyat != null && minfiyat != null)
            {
                numbermin.Text = minfiyat;
                numbermax.Text = maxfiyat;

            }


            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = "Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true";

            conn.Open();

            if((markasec==null) && (minfiyat==null) && (maxfiyat==null))
            { 
                sqlkod = "select urunler.id as id ,urun_adi as urunadi,urun_baslik,urun_fiyat,urun_resim from  urunler inner join urunmarka on urunler.urun_marka=urunmarka.id where urunler.urun_turu='"+ urun +"'";

                SqlCommand cmd = new SqlCommand(sqlkod, conn);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rpturunler.DataSource = dt;
                rpturunler.DataBind();
                conn.Dispose();
                conn.Close();


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
                    linkbasadon.NavigateUrl = "Urunler.aspx?urun="+urun+"";
                    linkbasadon.Text = "basadön";
                }

                if (!pds.IsFirstPage)
                {
                    linkonceki.NavigateUrl = "Urunler.aspx?urun=" + urun + "&page=" + (currentPage - 1);
                    linkonceki.Text = (currentPage - 1).ToString();
                }

                linkgecerlisayfa.NavigateUrl = "Urunler.aspx?urun=" + urun + "&page=" + (currentPage);
                linkgecerlisayfa.Text = currentPage.ToString();


                if (!pds.IsLastPage)
                {
                    linksonraki.NavigateUrl = "Urunler.aspx?urun=" + urun + "&page=" + (currentPage + 1);
                    linksonraki.Text = (currentPage + 1).ToString();
                }

                if (currentPage < pds.PageCount - 1)
                {
                    linksonagit.NavigateUrl = "Urunler.aspx?urun=" + urun + "&page=" + pds.PageCount;
                    linksonagit.Text = "sonagit";
                }

                rpturunler.DataSource = pds;
                rpturunler.DataBind();
            }
            else if(markasec!=null)
            {
                sqlkod = "select urunler.id as id ,urun_adi as urunadi,urun_baslik,urun_fiyat,urun_resim from  urunler inner join urunmarka on urunler.urun_marka=urunmarka.id where urunler.urun_turu='" + urun + "' and  urunler.urun_marka IN ("+ markasec + ") and urun_fiyat between " + minfiyat + " and " + maxfiyat + "";

                SqlCommand cmd = new SqlCommand(sqlkod, conn);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rpturunler.DataSource = dt;
                rpturunler.DataBind();
                conn.Dispose();
                conn.Close();


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
                    linkbasadon.NavigateUrl = "Urunler.aspx?urun=" + urun + "&markasec=" + markasec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "";
                    linkbasadon.Text = "basadön";
                }

                if (!pds.IsFirstPage)
                {
                    linkonceki.NavigateUrl = "Urunler.aspx?urun=" + urun + "&page=" + (currentPage - 1) + "&markasec=" + markasec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "";
                    linkonceki.Text = (currentPage - 1).ToString();
                }

                linkgecerlisayfa.NavigateUrl = "Urunler.aspx?urun=" + urun + "&page=" + (currentPage) + "&markasec=" + markasec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "";
                linkgecerlisayfa.Text = currentPage.ToString();


                if (!pds.IsLastPage)
                {
                    linksonraki.NavigateUrl = "Urunler.aspx?urun=" + urun + "&page=" + (currentPage + 1) + "&markasec=" + markasec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "";
                    linksonraki.Text = (currentPage + 1).ToString();
                }

                if (currentPage < pds.PageCount - 1)
                {
                    linksonagit.NavigateUrl = "Urunler.aspx?urun=" + urun + "&page=" + pds.PageCount + "&markasec=" + markasec + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "";
                    linksonagit.Text = "sonagit";
                }

                rpturunler.DataSource = pds;
                rpturunler.DataBind();


            }

            else
            {
                sqlkod = "SELECT urunler.id as id,urunmarka.urun_adi as urunadi ,urun_baslik,urun_fiyat,urun_resim FROM urunler inner join urunturu ON urunler.urun_turu = urunturu.id inner join urunmarka ON urunler.urun_marka = urunmarka.id WHERE urunler.urun_turu='" + urun + "' and urun_fiyat between " + minfiyat + " and " + maxfiyat + "";

                SqlCommand cmd = new SqlCommand(sqlkod, conn);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rpturunler.DataSource = dt;
                rpturunler.DataBind();
                conn.Dispose();
                conn.Close();


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
                    linkbasadon.NavigateUrl = "Urunler.aspx?urun=" + urun + "&minfiyat="+ minfiyat + "&maxfiyat="+ maxfiyat +"";
                    linkbasadon.Text = "basadön";
                }

                if (!pds.IsFirstPage)
                {
                    linkonceki.NavigateUrl = "Urunler.aspx?urun=" + urun + "&page=" + (currentPage - 1) + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "";
                    linkonceki.Text = (currentPage - 1).ToString();
                }

                linkgecerlisayfa.NavigateUrl = "Urunler.aspx?urun=" + urun + "&page=" + (currentPage) + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "";
                linkgecerlisayfa.Text = currentPage.ToString();


                if (!pds.IsLastPage)
                {
                    linksonraki.NavigateUrl = "Urunler.aspx?urun=" + urun + "&page=" + (currentPage + 1) + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "";
                    linksonraki.Text = (currentPage + 1).ToString();
                }

                if (currentPage < pds.PageCount - 1)
                {
                    linksonagit.NavigateUrl = "Urunler.aspx?urun=" + urun + "&page=" + pds.PageCount + "&minfiyat=" + minfiyat + "&maxfiyat=" + maxfiyat + "";
                    linksonagit.Text = "sonagit";
                }

                rpturunler.DataSource = pds;
                rpturunler.DataBind();

            }

        }


        protected void btnuygula_Click(object sender, EventArgs e)
        {
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

            string urun = Request.QueryString["urun"];

            string markasec = "", markaindex = "";

            if(chblmarkalar.SelectedIndex > -1)
            { 
                for (int i = 0; i < chblmarkalar.Items.Count; i++)
                {
                    if (chblmarkalar.Items[i].Selected)
                    {
                        markasec += chblmarkalar.Items[i].Value + ",";
                        markaindex += i + ",";
                    }
                }
                markasec = markasec.Substring(0, markasec.Length - 1);

                markaindex = markaindex.Substring(0, markaindex.Length - 1);
            }

            if ((numbermin.Text != null) && (numbermax.Text != null) && (chblmarkalar.SelectedIndex > -1))
            {
                Response.Redirect("Urunler.aspx?urun=" + urun + "&markasec=" + markasec + "&markaindex="+ markaindex + "&minfiyat=" + numbermin.Text + "&maxfiyat=" + numbermax.Text+"");
            }

            else if((numbermin.Text != null) && (numbermax.Text != null) && (chblmarkalar.SelectedIndex ==-1))
            {
                Response.Redirect("Urunler.aspx?urun=" + urun + "&minfiyat=" + numbermin.Text + "&maxfiyat=" + numbermax.Text + "");
            }

         
        }
    }
}