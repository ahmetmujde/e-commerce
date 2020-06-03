<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Urundetay.aspx.cs" Inherits="ahmet_koray_eticaret.Urundetay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        img {
            max-width: 100%;
        }

        .preview {
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -webkit-flex-direction: column;
            -ms-flex-direction: column;
            flex-direction: column;
        }

        @media screen and (max-width: 996px) {
            .preview {
                margin-bottom: 20px;
            }
        }




        .tab-content {
            overflow: hidden;
        }

        .tab-content img {
            width: 100%;
            -webkit-animation-name: opacity;
            animation-name: opacity;
            -webkit-animation-duration: .3s;
            animation-duration: .3s;
        }

        .card-product {
            margin-top: 50px;
            background: #eee;
            padding: 3em;
            line-height: 1.5em;
        }

        @media screen and (min-width: 997px) {
            .wrapper {
                display: -webkit-box;
                display: -webkit-flex;
                display: -ms-flexbox;
                display: flex;
            }
        }

        .details {

            display: flex;
            flex-direction: column;
        }




        @-webkit-keyframes opacity {
            0% {
                opacity: 0;
                -webkit-transform: scale(3);
                transform: scale(3);
            }

            100% {
                opacity: 1;
                -webkit-transform: scale(1);
                transform: scale(1);
            }
        }

        @keyframes opacity {
            0% {
                opacity: 0;
                -webkit-transform: scale(3);
                transform: scale(3);
            }

            100% {
                opacity: 1;
                -webkit-transform: scale(1);
                transform: scale(1);
            }
        }

        .sepet {
            padding: 10px 20px 10px 20px;
            font-size: 18px;
        }

        .p-count {
            font-size: 33px;
            font-weight: 600;
            color: #58a742 !important;
        }

        .p-type {
            font-size: 25px;
            color: #58a742 !important;
        }

        .p-down {
            color: #F1414D;
            font-size: 19px;
        }


        .card-white {
            margin-bottom: 15px;
        }

        .card-white .card-heading {
            color: #333;
            background-color: #fff;
            border-color: #ddd;
            border: 1px solid #dddddd;
        }

        .card-white .card-footer {
            background-color: #fff;
            border-color: #ddd;
        }

        .card-white .h5 {
            font-size: 14px;

        }

        .card-white .time {
            font-size: 12px;

        }

        .post .post-heading {
            height: 70px;
            padding: 20px 15px;
        }

        .post .post-heading .avatar {
            width: 40px;
            height: 40px;
            display: block;
            margin-right: 15px;
        }

        .post .post-heading .meta .title {
            margin-bottom: 0;
        }

        .post .post-heading .meta .title a {
            color: black;
        }

        .post .post-heading .meta .title a:hover {
            color: #aaaaaa;
        }

        .post .post-heading .meta .time {
            margin-top: 8px;
            color: #999;
        }

        .post .post-image .image {
            width: 100%;
            height: auto;
        }

        .post .post-description {
            padding: 5px 0 0 20px;
        }

        .post .post-description p {
            font-size: 17px;
        }

        .post .post-description .stats {
            margin-top: 20px;
        }

        .post .post-description .stats .stat-item {
            display: inline-block;
            margin-right: 15px;
        }

        .post .post-description .stats .stat-item .icon {
            margin-right: 8px;
        }

        .post .post-footer {
            border-top: 1px solid #ddd;
            padding: 15px;
        }

        .post .post-footer .input-group-addon a {
            color: #454545;
        }

        .post .post-footer .comments-list {
            padding: 0;
            margin-top: 20px;
            list-style-type: none;
        }

        .post .post-footer .comments-list .comment {
            display: block;
            width: 100%;
            margin: 20px 0;
        }

        .post .post-footer .comments-list .comment .avatar {
            width: 35px;
            height: 35px;
        }

        .post .post-footer .comments-list .comment .comment-heading {
            display: block;
            width: 100%;
        }

        .post .post-footer .comments-list .comment .comment-heading .user {
            font-size: 14px;
            font-weight: bold;
            display: inline;
            margin-top: 0;
            margin-right: 10px;
        }

        .post .post-footer .comments-list .comment .comment-heading .time {
            font-size: 12px;
            color: #aaa;
            margin-top: 0;
            display: inline;
        }
        s
        .post .post-footer .comments-list .comment .comment-body {
            margin-left: 50px;
        }

        .post .post-footer .comments-list .comment>.comments-list {
            margin-left: 50px;
        }

        .comments {
            margin-top: 30px;
        }
      
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
    <div class="card-product card">
        <div class="container-fliud">
            <div class="wrapper row">
                <div class="preview col-md-6">
                    <div class="preview-pic tab-content">
                        <asp:Repeater ID="rpturundetay" runat="server">
                            <ItemTemplate>
                                <div class="tab-pane active" id="pic-1"><img src='<%# Eval("urun_resim") %>'  />
                                </div>
                            </div>
                        </div>
                    <div class="details col-md-6">
                        <h3 class="product-title"><%# Eval("urun_baslik") %></h3>
                            <p class="product-description">
                                
                                <h5>Ürün Hakkında</h5>                                
                                <ul style="float:right;">

                                    <li>
                                        <span><b>Ürün Açıklama:</b><br><%# Eval("urun_aciklama") %></span>
                                    </li>
                                </ul>

                                <ul>
                                    <li>
                                        <span><b>Id :</b><%# Eval("id") %></span></li>
                                    <li>
                                        <span><b>Tür :</b><%# Eval("urunturu") %></span></li>
                                    <li>
                                        <span><b>Marka :</b><%# Eval("urunmarka") %></span></li>
                                </ul>
                            </p>
                        <span class="price"> <span class="p-count"><%# Eval("urun_fiyat") %></span> <span class="p-type">₺ </span> 
                            <span class="p-down"> 91% indirim (kazanç 39₺)</span> 
                                    <div class="action">
                                            <a href='Sepet.aspx?sepetekle=<%# Eval("id") %>' class=" btn btn-primary btn-lg" type="button">Sepete Ekle</a>
                                            <a class="btn btn-default"href="#yorum">
                                            <i class="far fa-comments fa-2x"></i><span>Yorumlar</span></a>
                                            <h3  style="float:right;" ><i class="fas fa-box"></i> <span class=" bg-light text-dark blockquote text-right">Stok:<%# Eval("urun_stok") %></span></h3>                                                                        
                                            
                                             <br /><br />
                                            <h5> Eklenme Tarihi  </h5>
                                            <h3  style="float:left;" ><i class="far fa-calendar-alt"></i><span class="text-success blockquote text-right"><%# Eval("tarih") %></span></h3>
                                        </div>                                 
                                    </div>
                                </div>
                            </div>
                            <div class=" comments comment-space">
                                <div class="row">
                                    <div class="col-12">
                                        <h5 class="mb-4"> Ürün Özellikleri  </h5>
                                        <p><%# Eval("urun_ozelik ") %></p>
                                     
                                    </div>
                                </div>
                            </div>
                            </ItemTemplate>
                    </asp:Repeater>

                        </div>
                    </div>
              </div>
         </div>
    </div>
</div>

<div class="container comments">
    <div class="row">

        <div class="col-12">
            <h2> İade Koşulları </h2>
            <div class="card card-white p-4">
                <p><strong>İade İşlemleri</strong></p>
                <p>Satın aldığınız ürünlere ilişkin;</p>
                <ul>
                    <li>Teslimatın yapıldığı tarihten itibaren 14 gün içerisinde cayma hakkınızı kullanabilir veya,
                    </li>
                    <li>Teslimatın yapıldığı tarihten itibaren 6 ay içerisinde ayıplı mallarda iade ya da onarım
                        taleplerinizi bize iletebilirsiniz.</li>
                </ul>
                <p><strong>ADIM ADIM KOLAY İADE SÜRECİ</strong>&nbsp;</p>
                <p>1) İade sürecinin başlayabilmesi için, koctas.com.tr web sitesindeki siparişlerim bölümünden iade
                    bildirimi açmanız ve müşteri hizmetleri tarafından talebinize cevap verilmesini beklemeniz
                    gerekmektedir.</p>
                <p>2)Bildirim yaptığınız iade işlemleriniz için siparişinizi size getiren kargo firması Koçtaş
                    Müşteri Hizmetleri tarafından görevlendirilecek ve teslimat adresinizden ürünleri teslim
                    alacaktır.</p>
                <p>3)Faturanızın ASIL nüshasının ön yüzünde, en sol taraftaki İADE kolonu altında iade etmek
                    istediğiniz ürüne ait satırda iade adedini yazmanız gerekmektedir. ASIL nüshanın ön yüzünde, sol
                    alt taraftaki iade eden kişi olarak adınızı soyadınızı, irtibat telefonunuzu, adresinizi yazıp
                    imzalamanız gerekmektedir. Son olarak, faturanın 1.NÜSHA'sının arkasındaki kutu içerisine neden
                    iade istediğinizi ayrıntılı olarak yazmanızı rica ederiz.</p>
                <p>4)Kargo firması tarafından teslimat adresinizden alınıp, bize ulaştırılan ürünler iade
                    koşullarına uygunluğu değerlendirilir ve bu işlemin sonucunda e-posta aracılığıyla
                    bilgilendirilirsiniz.</p>
                <p>5) Tüzel kişiliğe sahip olan ve şirket adına düzenlenmiş olan fatura işlemlerinden doğan iade
                    taleplerinde; ilgili firmanın iade yapılacak ürünler için Koçtaş adına iade faturası düzenlemesi
                    ile işlem tamamlanabilmektedir. Tüzel kişilik e-vergi mükellefi ise düzenlenmiş olan e-iade
                    faturasının numarasını Koçtaş’ a ilgili iade dönemi içerisinde iletmesi ile
                    tamamlanabilmektedir. İade faturası düzenlenmesi kanuni bir yükümlülüktür.</p>
                <p><strong>İade Bildirimi</strong></p>
                <p>İnternet mağazamızdan veya telefonla sipariş üzerinden satın aldığınız ürünlerle ilgili iade
                    bildiriminizi aşağıdaki adımları izleyerek yapabilirsiniz:</p>
                <ul>
                    <li>İlgili sipariş numaranızın üzerine tıklayarak, siparişinizin detayını açın.</li>
                    <li>Siparişinizdeki ürünlerden iade etmek istediğiniz ürünün yanındaki İade Talebi bağlantısına
                        tıklayın.<br>Açılan pencerede iade nedeninizi belirterek açıklama kısmını doldurun ve Talep
                        Gönder butonuna tıklayın.</li>
                </ul>
                <p><strong>İade Hakkında Bilmeniz Gerekenler</strong></p>
                <ul>
                    <li>Tüketicinin Korunması Hakkında Kanuna göre, Koçtaş cayma hakkı süresi içinde malın
                        <strong>mutat kullanımı</strong> dışında meydana gelen değişiklik ve bozulmalardan sorumlu
                        değildir.</li>
                    <li>Demonte olarak satılan ürünlerde, ürünün montajı, tariflenen <strong>kurulum kılavuzuna
                            uygun</strong> olarak yapılmamış ya da eksik yapılmışsa <strong>mutat kullanım kapsamı
                            dışında tutulur</strong>.</li>
                    <li>İade etmek istediğiniz ürünü <strong>orijinal kutusuna ve ambalajına koyarak</strong>,
                        <strong>faturanın asıl nüshası</strong> ile birlikte gönderiniz.</li>
                    <li>Faturanızda yer alan ürüne ait renk, model değişikliği talebiniz için iade işlemleri
                        başlatılacaktır.</li>
                    <li>İade etmek istediğiniz ürünü kargolanabilmesine olanak sağlayacak şekilde getirerek,
                        faturasıyla birlikte <strong>orijinal kutusunu ve ambalajını da bir arada
                            gönderiniz</strong></li>
                    <li><strong>Sağlık ve hijyen</strong> açısından ve ilgili mevzuat gereği; havlu, nevresim
                        takımı, çarşaf, yastık, yastık kılıfı, yorgan, yaylı yataklar, klozet takımları, klozet
                        kapakları, klozet fırçaları, kişisel bakım ürünleri, çizme, bot, ayakkabı, eldiven, maske
                        gibi ürünlerin koşulsuz<strong> iadesi kabul edilmemektedir.</strong> Bu gibi ürünlerin
                        iadesi ancak ürünlerin ambalajının açılmamış ve/veya ürünün <strong>denenmemiş</strong>
                        olması koşuluna bağlıdır.</li>
                </ul>
                <p>Tüketicinin Korunması Kanundan kaynaklı tüm haklarınız saklı olmak üzere, hızlı değişen stok,
                    tedarik koşullarındaki değişimler nedeni ile ürün değişimi yerine iade işlemi yapılmaktadır.</p>
            </div>
        </div>
    </div>
</div>
</asp:Content>
