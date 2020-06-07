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
        
        input[type="radio"] {
        display: none;
        &:not(:disabled) ~ label {
        cursor: pointer;
        }
        &:disabled ~ label {
        color: hsla(150, 5%, 75%, 1);
        border-color: hsla(150, 5%, 75%, 1);
        box-shadow: none;
        cursor: not-allowed;
        }
    }

    input[type="radio"]:checked + label {
        background: hsla(150, 75%, 50%, 1);
        color: hsla(215, 0%, 100%, 1);
        box-shadow: 0px 0px 20px hsla(150, 100%, 50%, 0.75);
        &::after {
        color: hsla(215, 5%, 25%, 1);
        font-family: FontAwesome;
        border: 2px solid hsla(150, 75%, 45%, 1);
        content: "\f00c";
        font-size: 24px;
        position: absolute;
        top: -25px;
        left: 50%;
        transform: translateX(-50%);
        height: 50px;
        width: 50px;
        line-height: 50px;
        text-align: center;
        border-radius: 50%;
        background: white;
        box-shadow: 0px 2px 5px -2px hsla(0, 0%, 0%, 0.25);
        }
    }
    input[type="radio"]#control_05:checked + label {
        background: red;
        border-color: red;
    }
    p {
        font-weight: 900;
    }


    @media only screen and (max-width: 700px) {
        section {
        flex-direction: column;
        }
    }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br />
    
<%if(Session["user"] == null)
        ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Önce Giris Yapmalısınız');window.location='Anasayfa.aspx';", true);

else 
{%>

    <%  int devamet = 0;
        if (Request.QueryString["devamet"] != null)
        {
               devamet = int.Parse(Request.QueryString["devamet"]);
        }
     

        if (devamet==0){ %>
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


            <div class="d-flex justify-content-center">
                <div class="alert alert-success w-50 p-3" role="alert">
                       <p class="text-center"> ÖDENECEK TOPLAM TUTAR:<asp:Label ID="lbltoplamfiyat" runat="server" Text=""></asp:Label></p>
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
                <div class=" row justify-content-center">   
                    <asp:LinkButton ID="btndevamet" class="btn btn-success" runat="server"  OnClick="btndevamet_Click"  Font-Size="X-Large" >DEVAM ET&nbsp<i class="fas fa-angle-double-right fa-3x"></i></asp:LinkButton>
                </div>
            </div>
         <%}%>

     
        <%else{ %>

            <br />
            <br />
            
            <div class="auto-style1">
                <div class=" row justify-content-around">

                    <asp:LinkButton ID="btnadres" class="btn btn-primary" runat="server" Height="60px" OnClick="btnadres_Click" Width="240px" data-toggle="modal" data-target="#adres"><i class="fas fa-gift fa-3x"></i>&nbsp;FARKLI ADRESE GÖNDER</asp:LinkButton>        

                    <asp:LinkButton ID="btngeriyedon" class="btn btn-warning" runat="server" Font-Size="Large" OnClick="btngeriyedon_Click" Width="240px"  Height="60px"><i class="fas fa-angle-double-left fa-3x"></i>&nbsp;Geriye Dön</asp:LinkButton>
                

                    <asp:LinkButton ID="btnsiparis" class="btn btn-success" runat="server" Height="60px" OnClick="btnsiparis_Click"  Width="240px" data-toggle="modal" data-target="#siparis"><i class="fas fa-thumbs-up fa-3x"></i>&nbsp;SİPARİSİ TAMAMLA</asp:LinkButton>

                </div>
                 
            </div>

            <br /> <br />

            <div class="modal fade " id="adres" tabindex="-1" role="dialog" aria-labelledby="adres" aria-hidden="true">
                <div class="modal-dialog " role="document">
                    <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="modal-title"><i class="far fa-map"></i>Adres  Ekranı</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>              
             
                        <div class="modal-body">
                            <div class="form-group ">
                                <h3 style="text-align:center">Farklı Adresiniz</h3>             
                                <textarea id="tafarkliadres" class="form-control" placeholder="Adresinizi giriniz..."  cols="30" rows="3" runat="server"></textarea>
                            </div>                                          
                        </div>
                            
                        <h3 style="text-align:center">Şehir ve İlçeniz</h3>
                            
                        <br />
                            
                        <div class="d-flex justify-content-around">
                                <asp:DropDownList ID="ddladresil" runat="server" DataSourceID="sdsadresil" DataTextField="il_adi" DataValueField="id" OnSelectedIndexChanged="ddladresil_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="sdsadresil" runat="server" ConnectionString='<%$ ConnectionStrings:eticaretConnectionString2 %>' SelectCommand="SELECT * FROM [iller]"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddladresilce" runat="server" DataSourceID="sdsadresilce" DataTextField="ilce_adi" DataValueField="id" OnSelectedIndexChanged="ddladresil_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="sdsadresilce" runat="server" ConnectionString='<%$ ConnectionStrings:eticaretConnectionString2 %>' SelectCommand="SELECT * FROM [ilceler] WHERE ([il_kodu] = @il_kodu)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddladresil" PropertyName="SelectedValue" DefaultValue="1" Name="il_kodu" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </div>

                            <br />

                                <h3 style="text-align:center">Telefonunuz</h3>  
                            
                               <div class="form-group">
                                        <div class="d-flex justify-content-center">
                                                <div class="col-md-6 mb-3">
                                                <asp:TextBox ID="tbtel2"  class="form-control" runat="server" pattern="[0-9]{3}[0-9]{3}[0-9]{4}"></asp:TextBox>
                                            </div>
                                        </div>
                                    <h6 style="text-align:center">Format: 000-000-0000</h6>
                                </div>

                            <div class="d-flex justify-content-center">
                                <asp:LinkButton ID="btnadresonay" class="btn btn-success" runat="server" Height="60px" OnClick="btnadresonay_Click" Width="240px"><i class="fas fa-check fa-3x"></i>&nbsp;SİPARİSİ ONAYLA</asp:LinkButton>
                            </div>
            
                        <br />
                      </div>
                 </div>
            </div>


            
            <div class="modal fade " id="siparis" tabindex="-1" role="dialog" aria-labelledby="siparis" aria-hidden="true">
                <div class="modal-dialog " role="document">
                    <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="modal-title"><i class="fas fa-map-marker-alt"></i> Adres Seçimi</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="d-flex justify-content-center">
                            <div class="d-flex flex-column bd-highlight mb-3">
                                <h5>
                                 <asp:RadioButtonList ID="rdladresler" runat="server">
                                </asp:RadioButtonList>   
                                </h5>
                            </div>
                        </div>
                        <br />

                        <div class="d-flex justify-content-center">

                            <asp:LinkButton ID="btnsiparisonay" class="btn btn-success" runat="server" Height="60px" Width="240px" OnClick="btnsiparisonay_Click"><i class="fas fa-check fa-3x"></i>&nbsp;SİPARİŞİ ONAYLA</asp:LinkButton>
                        </div>
                        
                        <br />
                      </div>
                 </div>
            </div>

            
         <%}%>
<%}%>

<script src="src/js/jquery-3.4.1.min.js"></script>
<script src="src/js/popper.js"></script>
<script src="src/js/bootstrap.min.js"></script>
<script src="src/js/all.min.js"></script>


</asp:Content>
