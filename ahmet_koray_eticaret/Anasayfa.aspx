<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Anasayfa.aspx.cs" Inherits="ahmet_koray_eticaret.WebForm1" %>
   
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%  
    string onaydurum = Request.QueryString["onaydurum"];
    string guvenlik_kodu = Request.QueryString["guvenlik_kodu"];

    int sifreunuttum = 0;
    if(Request.QueryString["sifreunuttum"]!=null)
        sifreunuttum = int.Parse(Request.QueryString["sifreunuttum"]);

%>

<%if (onaydurum=="true")
    {
        ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Üyeliginiz oluşturuldu!  Şifrenizi unutma durumunda oluşturulan GÜVENLİK KODUNUZ : "+guvenlik_kodu+"');window.location='Anasayfa.aspx';", true);

    }

if (sifreunuttum == 0)
{
%>
 
<div class="container">
    <!--Slider-->
    <div id="slider" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img class="d-block w-100 slider-imgs" src="src/img/lock.jpg" alt="First slide">
          <div class="carousel-caption d-none d-md-block text-left">
            <h2>Dünyada Marka Liderliği</h2>
            <p>Çelik Marketim</p>
          </div>
        </div>

        <div class="carousel-item ">
          <img class="d-block w-100 slider-imgs" src="src/img/lock.jpg" alt="First slide">
          <div class="carousel-caption d-none d-md-block text-left">
            <h2>Güvenilir Hizmet</h2>
            <p>Çelik Marketim</p>
          </div>
        </div>

        <div class="carousel-item ">
          <img class="d-block w-100 slider-imgs" src="src/img/lock3.jpg " alt="First slide">
          <div class="carousel-caption d-none d-md-block text-left">
            <h1>Kalitede Bir Numara</h1>
            <p>Çelik Marketim</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#slider" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Önceki</span>
      </a>
      <a class="carousel-control-next" href="#slider" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Sonraki</span>
      </a>
    </div>
    <!--Slider ///-->

    <!--Sidebar-->
  <div class="container">
    <div class=" row justify-content-around">
      <div class="card-group">
      </div>
      <div class=" col-md-3 left-side">

    <article class="card-group-item mt-4">
        <header class="card-header">
        <h6 class="title">Ürün Çeşitleri</h6>
        </header>
          <div class="filter-content">
            <div class="card-body text-left">
                 <div class="custom-control custom-checkbox">


                     <asp:CheckBoxList ID="chblurunturu" runat="server" DataSourceID="sdsurun" DataTextField="urun_adi" DataValueField="id">
                     </asp:CheckBoxList>
                   
                     <asp:SqlDataSource ID="sdsurun" runat="server" ConnectionString="<%$ ConnectionStrings:eticaretConnectionString2 %>" SelectCommand="SELECT * FROM [urunturu]">
                    </asp:SqlDataSource>

                    <asp:DataList ID="dtlurunrunturu" runat="server">

                       
                        <HeaderTemplate><div class="hizala" ></HeaderTemplate>
                        
                        <ItemTemplate>
                            
                            <span >
                               <%# Eval( "toplam_urun") %>
                                
                            </span>
                            </ItemTemplate>
                        <FooterTemplate></div></FooterTemplate>
                        
                    </asp:DataList>       
                </div>
            </div>
        </div>
    </article>

        <article class="card-group-item mt-4">
          <header class="card-header">
            <h6 class="title">Markalar</h6>
          </header>
          <div class="filter-content">
            <div class="card-body text-left">
                <div class="custom-control custom-checkbox">
                   
                    <asp:CheckBoxList ID="chblmarkalar"  runat="server" class="custom-control" DataSourceID="sdsmarka" DataTextField="urun_adi" DataValueField="id"></asp:CheckBoxList>
                    <asp:SqlDataSource ID="sdsmarka" runat="server" ConnectionString="<%$ ConnectionStrings:eticaretConnectionString2 %>" SelectCommand="SELECT [id], [urun_adi] FROM [urunmarka]"></asp:SqlDataSource>
                    
                </div>
            </div>
          </div>
        </article>

        <article class="card-group-item mt-4">
          <header class="card-header">
            <h6 class="title">Listele</h6>
          </header>
          <div class="filter-content">
               <div class="card-body text-center">
                <asp:DropDownList ID="ddlurunlistele" runat="server" class="btn btn-light dropdown-toggle">            
                        <asp:ListItem  Value="order by urun_fiyat asc">FİYAT ARTAN</asp:ListItem>
                        <asp:ListItem  Value="order by urun_fiyat desc">FİYAT  AZALAN</asp:ListItem>
                        <asp:ListItem Value="order by urunmarka.urun_adi asc">MODELE GÖRE A-Z</asp:ListItem>
                        <asp:ListItem Value="order by urunmarka.urun_adi desc">MODELE GÖRE Z-A</asp:ListItem>
                </asp:DropDownList>
                </div>
          </div>
        </article>

          
        <article class="card-group-item mt-4">
          <header class="card-header">
            <h6 class="title">Fiyat Aralığı</h6>
          </header>
          <div class="filter-content">
            <div class="card-body">
              <div class="form-row">
                <div class="form-group col-md-6 text-left">
                  <label id="fiyathatasi">En az</label>                  
                    <asp:TextBox placeholder="0₺" class="form-control"  ID="numbermin" runat="server"></asp:TextBox>
                     <asp:RegularExpressionValidator ID="revnumbermin"
                        ControlToValidate="numbermin" runat="server"
                        ErrorMessage="Yalnızca Tam Sayılar"
                        ValidationExpression="\d+" >
                    </asp:RegularExpressionValidator>
                </div>
                <div class="form-group col-md-6 text-left">
                  <label>En çok</label>
                    <asp:TextBox placeholder="1000₺" class="form-control"  ID="numbermax" runat="server"></asp:TextBox> 
                    <asp:RegularExpressionValidator ID="revnumbermax"
                        ControlToValidate="numbermax" runat="server"
                        ErrorMessage="Yalnızca Tam Sayılar"
                        ValidationExpression="\d+" >
                    </asp:RegularExpressionValidator>
                </div>
              </div>
            </div>
          </div>
          <div>
     </div>
</article>

  <div  class="card-group-item mt-4">
      <div class="card-group-item col-12">
          <asp:Button ID="btnuygula" class="btn btn-outline-primary btn-lg btn-block " runat="server" Text="Uygula" OnClick="btnuygula_Click" />
      </div>
  </div>

</div>
<!--Sidebar ///-->

<!--Cards-->
<asp:Repeater ID="rpturunler" runat="server">
    <HeaderTemplate>
       <div class="col-md-9 "> 
          <div class="row">
    </HeaderTemplate>
    <ItemTemplate>
        <div class="col-md-4">
             <div class="card">
                <img class="card-img-top" src='<%# Eval("urun_resim") %>'>
            
                 <div class="card-body card-ba">
                    <span class="card-h"><asp:Label ID="lblurunmarka" runat="server" Text='<%# Eval("urunadi") %>'></asp:Label></span>
                        <p class="card-text"  ><asp:Label ID="lblurunbaslik" runat="server" Text='<%# Eval("urun_baslik") %>'></asp:Label></p>
                    <h5 class="card-title"><asp:Label ID="lblfiyat" runat="server" Text='<%# Eval("urun_fiyat")%> '></asp:Label><span>₺ / 1 Adet</span></h5>
                </div>

                <div class="card-body basket">
                    <div class="basket" role="group"> 
                 
                        <a href='Urundetay.aspx?urunid=<%# Eval("id")%>' class=" btn btn-outline-dark">Ürüne Git</a> 

                        <a href='Sepet.aspx?sepetekle=<%# Eval("id") %>' class=" btn btn-primary btn-lg" type="button">Sepete Ekle</a>

                    </div>
                </div>
            </div>
        </div>
    </ItemTemplate>
    <FooterTemplate>
           </div>
        </div>
    </FooterTemplate>
</asp:Repeater>
    </div>
  </div>
</div>

<div class="ortala">
    <ul class="u1 sayfala">
        <li class="l1"> <asp:HyperLink ID="linkbasadon" runat="server"></asp:HyperLink></li>
        <li class="l1 sayfano"> <asp:HyperLink ID="linkonceki" runat="server"></asp:HyperLink></li>
        <li class="l1 sayfano active"><asp:HyperLink ID="linkgecerlisayfa" runat="server"></asp:HyperLink></li>
        <li class="l1 sayfano "> <asp:HyperLink ID="linksonraki" runat="server"></asp:HyperLink></li>
        <li class="l1"> <asp:HyperLink ID="linksonagit"  runat="server"></asp:HyperLink></li>
    </ul>
</div>
    <%}

else if (sifreunuttum == 1)
{%>
    <br /> <br />

    <div class="d-flex justify-content-center">
        <div class="card">
            <div class="card-header">
               <i class="fas fa-question-circle"></i>ŞİFRE UNUTTUM 
            </div>
            <div class="card-body">
            <blockquote class="blockquote mb-0">

                <div class="d-flex flex-column bd-highlight mb-3">
                    <span>
                    <label>E-MAİL</label>

                    <asp:TextBox ID="tbemail"  class="form-control" runat="server"  placeholder=" E-Posta adresinizi giriniz.." ></asp:TextBox>
                
                    </span>
                    
                    <br />

                    <span>
                        <label>GÜVENLİK SİFRESİ</label>

                        <asp:TextBox  ID="tbguvenliksifresi"  class="form-control" runat="server"  placeholder=" Guvenlik sifresi..."  TextMode="Password" ></asp:TextBox>
                
                    </span>

                </div>

                 <asp:Button ID="btnsifreunuttum" runat="server" class="btn btn-primary btn-block " Text="Sifre Unuttum" OnClick="btnsifreunuttum_Click" />

                <footer class="blockquote-footer">Lütfen üye olurken size verilen <cite title="Source Title">Güvenlik Sifresini Giriniz...</cite></footer>
            </blockquote>
            </div>
        </div>
    </div>

    <br /> <br />

<%}

else if (sifreunuttum == 2)
{%>
        <br /> <br />

    <div class="d-flex justify-content-center">
        <div class="card">
            <div class="card-header">
               <i class="fas fa-question-circle"></i>ŞİFRE UNUTTUM 
            </div>
            <div class="card-body">
            <blockquote class="blockquote mb-0">

                <div class="d-flex flex-column bd-highlight mb-3">
                    <span>
                      <label for="password">Şifre</label>

                      <asp:TextBox ID="tbsifre" runat="server" TextMode="Password" class="form-control" placeholder="şifrenizi giriniz.."></asp:TextBox>
                        
                    </span>
                    
                    <br />

                    <span>
                      <label for="password">Şifre Tekrar</label>

                      <asp:TextBox ID="tbsifre2" runat="server" TextMode="Password" class="form-control" placeholder="şifrenizi tekrar giriniz.."></asp:TextBox>
                        
                    </span>

                </div>

                 <asp:Button ID="btnsifreguncelle" runat="server" class="btn btn-success btn-block " Text="Sifre Güncelle" OnClick="btnsifreguncelle_Click" />

                <footer class="blockquote-footer">Lütfen sifrenizi belirlerken <cite title="Source Title">güçlü ve hatırlayacagınız nitelikte  olmasına dikkat ediniz</cite></footer>
            </blockquote>
            </div>
        </div>
    </div>

    <br /> <br />
<%} %>

<script src="src/js/jquery-3.4.1.min.js"></script>
<script src="src/js/popper.js"></script>
<script src="src/js/bootstrap.min.js"></script>
<script src="src/js/all.min.js"></script>

<script type="text/javascript" >
    $(document).ready(function(){
        $('.sonraki').click(funciton(){
            $('.sayfala').find('.sayfano.active').sonraki().
                addClass('active');
            $('.sayfala').find('.sayfano.active').onceki().
                removeClass('active');
        })
    
        $('.onceki').click(funciton(){
            $('.sayfala').find('.sayfano.active').onceki().
                addClass('active');
            $('.sayfala').find('.sayfano.active').sonraki().
                removeClass('active');
         })
</script>
</asp:Content>
