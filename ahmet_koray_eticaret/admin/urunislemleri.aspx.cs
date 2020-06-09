using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace ahmet_koray_eticaret.admin
{
    public partial class urun_islemleri : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-OR597H6; Initial Catalog=eticaret; Integrated Security=true");

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

        protected void btnurunekle_Click(object sender, EventArgs e)
        {
            

            if (tbaciklama.Text == String.Empty || tbfiyat.Text == String.Empty || tbozellik.Text == String.Empty || tbstok.Text == String.Empty || tburunbaslik.Text == String.Empty || ddlurunmarka.SelectedValue == "-1" || ddlurunturu.SelectedValue == "-1")
            {
                Response.Write("<script> alert('Lütfen Boş Alan Bırakmayınız ') </script>");
            }

            else
            {

                if (furesimsec.HasFile)
                {
              
                    conn.Open();

                    furesimsec.SaveAs(Server.MapPath("../src/img/" + furesimsec.FileName));
                    SqlCommand s1 = new SqlCommand("insert into urunler(urun_baslik,urun_turu,urun_marka,urun_fiyat,urun_stok,urun_durum,urun_aciklama,urun_ozelik,urun_resim,eklenme_trh) values(@urunbaslik,@tur,@marka,@fiyat,@stok,@durum,@aciklama,@ozellik,@resim,@tarih)", conn);
                    s1.Parameters.AddWithValue("@urunbaslik", tburunbaslik.Text);
                    s1.Parameters.AddWithValue("@tur", ddlurunturu.SelectedValue);
                    s1.Parameters.AddWithValue("@marka", ddlurunmarka.SelectedValue);
                    s1.Parameters.AddWithValue("@fiyat", tbfiyat.Text);
                    s1.Parameters.AddWithValue("@stok", tbstok.Text);
                    s1.Parameters.AddWithValue("@durum", ddldurum.SelectedValue);
                    s1.Parameters.AddWithValue("@aciklama", tbaciklama.Text);
                    s1.Parameters.AddWithValue("@ozellik", tbozellik.Text);
                    s1.Parameters.AddWithValue("@resim", "../src/img/" + furesimsec.FileName);
                    s1.Parameters.AddWithValue("@tarih", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));
                    int durum = s1.ExecuteNonQuery();


                    if (durum > 0)
                    {


                        Response.Write("<script> alert('Ürün Eksiksiz Bir Şekilde Eklendi') </script>");
                        tbaciklama.Text = "";
                        tbfiyat.Text = "";
                        tbozellik.Text = "";
                        tbstok.Text = "";
                        tburunbaslik.Text = "";
                        tburunbaslik.Focus();
                    }

                    else
                    {
                        tburunbaslik.Focus();
                        Response.Write("<script> alert('Ürün Eklenemedi') </script>");

                    }

                    s1.Dispose();
                    conn.Dispose();
                    conn.Close();

                }
                
                else
                {
                    Response.Write("<script> alert(' Lütfen Resim Seçtiğinize Dikkat Ediniz') </script>");

                }
            }
        }

    }
}