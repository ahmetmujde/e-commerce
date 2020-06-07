<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Uyeprofil.aspx.cs" Inherits="ahmet_koray_eticaret.Uyeprofil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
.solayasla{padding:20px;}

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

<%if(Session["user"] == null)
        ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('İzinsiz Giriş Lütfen Giriş Yapın');window.location='Anasayfa.aspx';", true);

else { %>
        
  <div class="container-fluid">
    <div class="d-flex justify-content-around">
      <div class="card-group">
      </div>
      <div class=" col-md-2 left-side">

        <article class="card-group-item mt-4">
          <header class="card-header">
              <div class="text-center">
                 <h6 class="title"><i class="fas fa-user fa-4x"></i></h6>
              </div>
          </header>

          <div class="filter-content">
             <div class="d-flex flex-column">
                 <div class="text-center">
                    <div class="p-2"><a href="Uyeprofil.aspx?panelno=0"><% Response.Write(Session["user"].ToString()); %></a></div>
                </div>
            </div>
          </div>
        </article>


        <article class="card-group-item mt-4">
          <header class="card-header">
              <div class="text-center">
                 <h6 class="title">ÜYE MENÜ</h6>
              </div>
          </header>

          <div class="filter-content">
             <div class="d-flex flex-column">
                 <div class="text-center">
                        <div class="p-2"><a href="Uyeprofil.aspx?panelno=1">İSİM DEĞİŞTİR</a></div>
                        <div class="p-2"><a href="Uyeprofil.aspx?panelno=2">ŞİFRE DEĞİŞTİR</a></div>
                        <div class="p-2"><a href="Uyeprofil.aspx?panelno=3">ADRES DEĞİŞTİR</a></div>
                        <div class="p-2"><a href="Uyeprofil.aspx?panelno=4">SİPARİSLERİM</a></div>
                </div>
            </div>
          </div>
        </article>
        </div>
         
        <div class="col-md-10 right">
            
        <asp:Panel ID="pnluyeadres" runat="server">
            <br />
           
            <h3 style="text-align:center">ÜYE PROFİL SAYFASINA HOŞGELDİNİZ</h3><br />
            <hr />
            
            <asp:Repeater ID="rptuyeprofil" runat="server">
                <HeaderTemplate>
                    <div class="d-flex justify-content-around">
                </HeaderTemplate>
                <ItemTemplate>                                    
                    <div class="card border-primary mb-3" style="max-width: 18rem;">
                        <div class="card-header bg-transparent border-primary" style="text-align:center"> <%# Eval( "satir")%>.ADRESİM</div>
                        <div class="card-body">
                             <h5 ><strong> <%# Eval( "il_adi") %> / <%# Eval( "ilce_adi") %></strong></h5>
                            <p class="card-text"> <%# Eval( "adres") %></p>
                        </div>
                        <div class="card-footer bg-transparent border-primary"><%# Eval( "satir")%>.TELEFONUM: <%# Eval( "telefon") %></div>
                    </div>

                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </asp:Panel>



        <asp:Panel ID="pnlisim" runat="server">
            <div  class="form-group mt-2 solayasla">
                <h2 style="text-align:center">İSİM DEĞİŞTİR</h2>
                <div class="card">
                   <div class="card-body">
                        <form>
                                <div class="form-group">
                                  <h5 for="">İsim</h5>
                                    <asp:TextBox ID="tbisim" class="form-control" runat="server" ></asp:TextBox>
                                </div>

                                 <div class="form-group">
                                  <h5 for="">Soyisim</h5>
                                     <asp:TextBox ID="tbsoyisim" class="form-control" runat="server" ></asp:TextBox>
                                </div>
                            <asp:Button ID="btnisim" class="btn btn-primary btn-block p-2" runat="server" Text="KAYDET" OnClick="btnisim_Click" />
                         </form>
                        </div>
                    </div>
               </div>
            </asp:Panel>

            <asp:Panel ID="pnlsifre" runat="server">
                <div  class="form-group mt-2 solayasla">
                    <h2 style="text-align:center">ŞİFRE DEĞİŞTİR</h2>
                    <div class="card">
                       <div class="card-body">
                            <form>
                                     <div class="form-group">
                                      <h5 for="">MEVCUT ŞİFRE</h5>
                                        <asp:TextBox class="form-control" ID="tbmevcutsfr" runat="server" ></asp:TextBox>
                                    </div>
                                
                                     <div class="form-group">
                                      <h5 for="">YENİ ŞİFRE</h5>
                                         <asp:TextBox class="form-control" ID="tbyenisfr" runat="server" ></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                      <h5 for="">ŞİFRE TEKRAR</h5>
                                        <asp:TextBox class="form-control"  ID="tbsfrtekrar" runat="server" ></asp:TextBox>
                                    </div>

                                    <asp:Button ID="btnsifre" class="btn btn-primary btn-block p-2" runat="server" Text="KAYDET" OnClick="btnsifre_Click" />
                             </form>
                            </div>
                        </div>
                   </div>
                </asp:Panel>


                
                <asp:Panel ID="pnladres" runat="server">
                    <div  class="form-group mt-2 solayasla">
                        <h2 style="text-align:center">ADRES DEĞİŞTİR</h2>


                        <div class="card">
                           <div class="card-body">
                                <form>
                                   <div class="row">                                       
                                        <div class="col-5">

                                            <h4>Adres Seçimi</h4>

                                            <br />

                                            <div class="d-flex justify-content-center">
                                                    <div class="checkboxes-and-radios">
                                                        <h5>
                                                            <asp:RadioButtonList ID="rbladres" runat="server" type="radio">                                                 
                                                            </asp:RadioButtonList>   
                                                        </h5>
                                                    </div>
                                            </div>
                                        </div>

                                        <div class="col-7">
                                            <div class="form-group">
                                            <h5 for="">ADRES</h5>
                                            <textarea id="taAdres" class="form-control" placeholder="Adresinizi giriniz..."  cols="30" rows="3" runat="server"></textarea>
                                       
                                            </div>

                                            <div class="form-group">
                                                    <div class="d-flex justify-content-around">
                                                        <h5 style="text-align:center">İL</h5>
                                                        <h5 style="text-align:center">İLCE</h5>
                                                    </div>
                                           
                                                    <div class="d-flex justify-content-around">

                                                        <asp:DropDownList ID="ddlil" class="btn btn-light dropdown-toggle"  runat="server" DataSourceID="sdsil" DataTextField="il_adi" DataValueField="id"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="sdsil" runat="server" ConnectionString="<%$ ConnectionStrings:eticaretConnectionString2 %>" SelectCommand="SELECT * FROM [iller]"></asp:SqlDataSource>
                        
                                                        <asp:DropDownList ID="ddlilce" class="btn btn-light dropdown-toggle" runat="server" DataSourceID="sdsilce" DataTextField="ilce_adi" DataValueField="id"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="sdsilce" runat="server" ConnectionString="<%$ ConnectionStrings:eticaretConnectionString2 %>" SelectCommand="SELECT * FROM [ilceler] WHERE ([il_kodu] = @il_kodu)">
                                                        <SelectParameters>
                                                        <asp:ControlParameter ControlID="ddlil" Name="il_kodu" PropertyName="SelectedValue" Type="Int32" />
                                                        </SelectParameters>
                                                        </asp:SqlDataSource>

                                                    </div>
                                             </div>

                                            <div class="form-group">
                                              <h5 for="">TELEFON</h5>
                                                <div class="d-flex justify-content-center">
                                                        <div class="col-md-6 mb-3">
                                                        <asp:TextBox ID="tbtel"  class="form-control" runat="server" pattern="[0-9]{3}[0-9]{3}[0-9]{4}"></asp:TextBox>
                                                    </div>
                                                </div>
                                                 <small>Format: 000-000-0000</small>
                                            </div>                                         
                                        </div>

                                        <asp:Button ID="btnadres" class="btn btn-primary btn-block p-2" runat="server" Text="KAYDET" OnClick="btnadres_Click" />
                                    </div>
                                 </form>
                                </div>
                            </div>
                       </div>
                    </asp:Panel>

            <asp:Panel ID="pnlsiparis" runat="server">
                <asp:Repeater ID="rptsiparis" runat="server">
                    <HeaderTemplate>
                        <table class="table table-striped">
                          <thead>
                            <tr>
                              <th scope="col">Siparis Durum</th>
                              <th scope="col">Adı</th>
                              <th scope="col">Sayısı</th>
                              <th scope="col">İl</th>
                              <th scope="col">İlçe</th>
                              <th scope="col">Adres</th>
                              <th scope="col">Toplam Fiyat</th>
                              <th scope="col">Kargo Adı</th>
                              <th scope="col">Siparis Tarihi</th>
                            </tr>
                          </thead>
                          <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>                
                        <tr>                        
                            <th scope="col"><%# Eval( "durum_adi") %></th>
                            <th scope="col"><%# Eval( "urun_baslik") %></th>
                            <th scope="col"><%# Eval( "urun_adedi") %></th>
                            <th scope="col"><%# Eval( "il_adi") %></th>
                            <th scope="col"><%# Eval( "ilce_adi") %></th>
                             <th scope="col"><%# Eval( "adres") %></th>
                            <th scope="col"><%# Eval( "toplam_fiyat") %></th>
                            <th scope="col"><%# Eval( "kargo_adi") %></th>
                            <th scope="col"><%# Eval( "tarih") %></th>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                          </tbody>
                        </table>    
                    </FooterTemplate>
                </asp:Repeater>
            </asp:Panel>
            
        
            </div>
      </div>
    </div>
<%} %>



</asp:Content>
