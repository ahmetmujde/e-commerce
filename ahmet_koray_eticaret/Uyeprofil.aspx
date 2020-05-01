<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Uyeprofil.aspx.cs" Inherits="ahmet_koray_eticaret.Uyeprofil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
.solayasla{padding:20px;}

</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<%if(Session["user"] == null)
        ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('İzinsiz Giriş Lütfen Giriş Yapın');window.location='Anasayfa.aspx';", true);

else { %>
        
  <div class="container">
    <div class=" row justify-content-around">
      <div class="card-group">
      </div>
      <div class=" col-md-3 left-side">

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
                        <div class="p-2"><a href="Uyeprofil.aspx?panelno=5">YORUMLARIM</a></div>
                </div>
            </div>
          </div>
        </article>
        </div>
         
        <div class="col-md-9 right">
            
        <asp:Panel ID="pnluyeadres" runat="server">
           
            <h3 style="text-align:center">ÜYE PROFİL SAYFASINA HOŞGELDİNİZ</h3><br />
            
            <asp:Repeater ID="rptuyeprofil" runat="server">
                <ItemTemplate>                
                    <h3 style="text-align:center">  <%# Eval( "ad") %> <%# Eval( "soyad") %></h3>
                    <div class="d-flex flex-column">
                        <div class="d-flex justify-content-around">
                        <div class="p-1">
                            <div class="card bg-light mb-3" style="max-width: 40rem;">
                                <div class="card-header">ADRESİM</div>
                                <div class="card-body">
                                <h5 class="card-title"> <%# Eval( "il_adi") %> / <%# Eval( "ilce_adi") %></h5>
                                <p class="card-text"> <%# Eval( "adres") %></p>
                                </div>
                            </div>

                             <div class="card bg-light mb-3" style="max-width: 40rem;">
                                  <div class="card-header">TELEFONUM</div>
                                  <div class="card-body">
                                    <h5 class="card-title"> <%# Eval( "telefon") %></h5>
                                  </div>
                            </div>
                         </div>
                    
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>



        <asp:Panel ID="pnlisim" runat="server">
            <div  class="form-group mt-2 solayasla">
                <h2 style="text-align:center">İSİM DEĞİŞTİR</h2>
                <div class="card">
                   <div class="card-body">
                        <form>
                                <div class="form-group">
                                  <label for="">İsim</label>
                                    <asp:TextBox ID="tbisim" class="form-control" runat="server" ></asp:TextBox>
                                </div>

                                 <div class="form-group">
                                  <label for="">Soyisim</label>
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
                                      <label for="">MEVCUT ŞİFRE</label>
                                        <asp:TextBox class="form-control" ID="tbmevcutsfr" runat="server" ></asp:TextBox>
                                    </div>
                                
                                     <div class="form-group">
                                      <label for="">YENİ ŞİFRE</label>
                                         <asp:TextBox class="form-control" ID="tbyenisfr" runat="server" ></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                      <label for="">ŞİFRE TEKRAR</label>
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
                                    <div class="form-group">
                                    <label for="">ADRES</label>
                                    <textarea id="taAdres" class="form-control" placeholder="Adresinizi giriniz..."  cols="30" rows="3" runat="server"></textarea>
                                       
                                    </div>

                                    <div class="form-group">
                                            <div class="d-flex justify-content-around">
                                                <label style="text-align:center"  for="">İL</label>
                                                <label style="text-align:center" for="">İLCE</label>
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
                                      <label for="">TELEFON</label>
                                        <div class="d-flex justify-content-center">
                                                <div class="col-md-6 mb-3">
                                                <asp:TextBox ID="tbtel"  class="form-control" runat="server" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" required=""></asp:TextBox>
                                            </div>
                                        </div>
                                         <small>Format: 000-000-0000</small>
                                    </div>
                                    <asp:Button ID="btnadres" class="btn btn-primary btn-block p-2" runat="server" Text="KAYDET" OnClick="btnadres_Click" />

                                 </form>
                                </div>
                            </div>
                       </div>
                    </asp:Panel>
            </div>
        </div>
    </div>
<%} %>



</asp:Content>
