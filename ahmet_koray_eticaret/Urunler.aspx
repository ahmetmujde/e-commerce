<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Urunler.aspx.cs" Inherits="ahmet_koray_eticaret.Urunler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%  
    string urun = Request.QueryString["urun"];
%>


    <!--Sidebar-->
  <div class="container">
    <div class=" row justify-content-around">
      <div class="card-group">
      </div>
      <div class=" col-md-3 left-side">

        <article class="card-group-item mt-4">
          <header class="card-header">
            <h6 class="title">Markalar</h6>
          </header>
          <div class="filter-content">
            <div class="card-body text-left">
                <div class="custom-control">
                   
                    <asp:CheckBoxList ID="chblmarkalar"  runat="server" DataSourceID="sdsmarka" DataTextField="urun_adi" DataValueField="id" ></asp:CheckBoxList>
                    
                    <asp:SqlDataSource ID="sdsmarka" runat="server" ConnectionString="<%$ ConnectionStrings:eticaretConnectionString2 %>" SelectCommand="SELECT [id], [urun_adi] FROM [urunmarka]">

                    </asp:SqlDataSource>
                
                </div>       
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
                  <label>En az</label>                  
                    <asp:TextBox placeholder="0₺" class="form-control"  ID="numbermin" runat="server"></asp:TextBox>
                     <asp:RegularExpressionValidator ID="revnumbermin"
                        ControlToValidate="numbermin" runat="server"
                        ErrorMessage="Sadece tam sayılar"
                        ValidationExpression="\d+" >
                    </asp:RegularExpressionValidator>
                </div>
                <div class="form-group col-md-6 text-left">
                  <label>En çok</label>
                    <asp:TextBox placeholder="1000₺" class="form-control"  ID="numbermax" runat="server"></asp:TextBox> 
                    <asp:RegularExpressionValidator ID="revnumbermax"
                        ControlToValidate="numbermax" runat="server"
                        ErrorMessage="Sadece tam sayılar"
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
          <div class="card-columns">
    </HeaderTemplate>
    <ItemTemplate>
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
    </ItemTemplate>
    <FooterTemplate>
           </div>
        </div>
    </FooterTemplate>
</asp:Repeater>
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

<script src="src/js/jquery-3.4.1.min.js"></script>    

<script type="text/javascript" >
    $(document).ready(function () {
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
