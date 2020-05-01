<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sepet.aspx.cs" Inherits="ahmet_koray_eticaret.Sepet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        input[type="checkbox"]{

            position:relative;
            width:80px;
            height:40px;
            -webkit-appearance:none;
            background:#c6c6c6;
            outline:none;
            border-radius:20px;
            box-shadow:inset 0 0 5px rgba(0,0,0,.2);
            transition:.5s;
        }

       input[type="checkbox"]:checked{
            background:#03a9f4;
        }

        input[type="checkbox"]:before{
            content:'';
            position:absolute;
            width:40px;
            height:40px;
            border-radius:20px;
            top:0;
            left:0;
            background:#fff;
            transform:scale(1.1);
            box-shadow:0 2px 5px rgba(0,0,0,.2);
            transition:.5s;
        }

        input[type="checkbox"]:checked:before {
            left: 40px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br />
    
<%if(Session["user"] == null)
        ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Önce Giris Yapmalısınız');window.location='Anasayfa.aspx';", true);

else 
{%>
   
<div class="container">
    <div class=" row justify-content-around">
    <asp:Repeater ID="rpturunler" runat="server">
        <HeaderTemplate>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th scope="col">Sepet No</th>
                  <th scope="col">Ürün Adı</th>
                  <th scope="col">Adet</th>
                  <th scope="col">Etiket Fiyat</th>
                    <th scope="col">AdetxFiyat</th>
                  <th scope="col">İşlem Yap</th>
                </tr>
              </thead>
            </HeaderTemplate>
                <ItemTemplate>
                  <tbody>
                    <tr>
                          <th scope="row"><h5><%# Eval("urunsay") %></h5></th>
                          <td><h5><%# Eval("urun_adi") %></h5></td>
                          <td><h5><%# Eval("urun_adedi") %></h5></td>
                          <td><h5><%# Eval("fiyat") %></h5></td>
                          <td><h5><%# Eval("adet_fiyati") %></h5></td>

                      <td>
                          <a class="btn btn-link" href='Sepet.aspx?azalt=<%# Eval("id") %>&adet=<%# Eval("urun_adedi") %>'><i class="fas fa-minus fa-2x"></i></a>
                          <a class="btn btn-link text-success" href='Sepet.aspx?arttir=<%# Eval("id") %>&adet=<%# Eval("urun_adedi") %>'><i class="fas fa-plus fa-2x"></i></a>
                          <a class="btn btn-link text-danger" href='Sepet.aspx?iptal=<%# Eval("id") %>'><i class="fas fa-times fa-2x"></i></a>
                      </td>
                    </tr>
                  </tbody>
                </ItemTemplate>
            <FooterTemplate>   
        </table>
        </FooterTemplate>
    </asp:Repeater>
        
       
    </div>
</div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eticaretConnectionString2 %>" SelectCommand="SELECT * FROM [sepet]"></asp:SqlDataSource>


<asp:Panel ID="pnlsayfalama" runat="server">
<div class="container">
    <div class=" row justify-content-center">
        
        <ul class="u1 sayfala">
            <li class="l1"> <asp:HyperLink ID="linkbasadon" runat="server"></asp:HyperLink></li>
            <li class="l1 sayfano"> <asp:HyperLink ID="linkonceki" runat="server"></asp:HyperLink></li>
            <li class="l1 sayfano active"><asp:HyperLink ID="linkgecerlisayfa" runat="server"></asp:HyperLink></li>
            <li class="l1 sayfano "> <asp:HyperLink ID="linksonraki" runat="server"></asp:HyperLink></li>
            <li class="l1"> <asp:HyperLink ID="linksonagit"  runat="server"></asp:HyperLink></li>
        </ul>

    </div>
</div>


<div class="container">
    <div class=" row justify-content-around">

       <span><h4>PEŞİN</h4>
               <asp:CheckBox ID="cbpesin" runat="server" />
       </span>

        <span><h4>TAKSİT</h4>
                <asp:CheckBox ID="cbtaksit" runat="server" />
            <div class="d-flex flex-column">
                 <asp:RadioButtonList ID="rbtaksit" runat="server">
                    <asp:ListItem Value="6">6 AY</asp:ListItem>
                    <asp:ListItem Value="12">12 AY</asp:ListItem>
                    <asp:ListItem Value="24">24 AY</asp:ListItem>
                </asp:RadioButtonList>

            </div>
        </span>


    </div>
</div>

</asp:Panel>
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
    <br />





<div class="container">
    <div class=" row justify-content-around">
        <asp:LinkButton ID="btnadres" class="btn btn-primary" runat="server" Height="60px" OnClick="btnfarkliadres_Click" Width="240px"><i class="fas fa-gift fa-3x"></i>&nbsp;FARKLI ADRESE GÖNDER</asp:LinkButton>
        <asp:LinkButton ID="btnsiparis" class="btn btn-success" runat="server" Height="60px" OnClick="btnsiparis_Click" Width="240px"><i class="fas fa-thumbs-up fa-3x"></i>&nbsp;SİPARİSİ TAMAMLA</asp:LinkButton>

    </div>
</div>
<%}%>

    

</asp:Content>
