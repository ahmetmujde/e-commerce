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
    public partial class Urundetay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string urunid = Request.QueryString["urunid"];

            if (!IsPostBack) {

                urunidresim();

                if (urunid == null)
                    Response.Redirect("Anasayfa.aspx");
            }
        }


        protected void urunidresim()
        {

            string urunid, sqlkod;

            urunid = Request.QueryString["urunid"];

            if (urunid != null)
            {
                SqlConnection conn = new SqlConnection();

                conn.ConnectionString = "Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true";

                conn.Open();

                sqlkod = "SELECT urunler.id as id,urun_baslik,urun_ozelik,urun_aciklama,urun_resim,urun_stok,urunturu.urun_adi as urunturu,urunmarka.urun_adi as urunmarka,urun_fiyat,SUBSTRING(cast(eklenme_trh as varchar(24)),0,12) as tarih  FROM urunler inner join urunturu ON urunler.urun_turu=urunturu.id inner join urunmarka ON urunler.urun_marka=urunmarka.id where urunler.id=" + urunid + "";

                SqlCommand komut = new SqlCommand(sqlkod, conn);

                SqlDataAdapter sda = new SqlDataAdapter(komut);

                DataTable dt = new DataTable();
                sda.Fill(dt);
                rpturundetay.DataSource = dt;
                rpturundetay.DataBind();

                conn.Dispose();

                conn.Close();

            }
        }
    }
}