<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="urunislemleri.aspx.cs" Inherits="ahmet_koray_eticaret.admin.urun_islemleri" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Yönetim Paneli | Çelik Market</title>
    <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link type="text/css" href="css/theme.css" rel="stylesheet" />
    <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet" />
    <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet' />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="paneloturum" runat="server">
            <div class="navbar navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container">
                        <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                            <i class="icon-reorder shaded"></i></a><a class="brand" href="Panel.aspx">Yönetim Paneli </a>
                        <div class="nav-collapse collapse navbar-inverse-collapse">

                            <ul class="nav pull-right">

                                <li><asp:Button CssClass="btn btn-success" ID="btncikis" runat="server" Text="Çıkış Yap" OnClick="btncikis_Click" /></li>
                            </ul>
                        </div>
                        <!-- /.nav-collapse -->
                    </div>
                </div>
        <!-- /navbar-inner -->
    </div>
    <!-- /navbar -->
    <div class="wrapper">
        <div class="container">
            <div class="row">
                    <div class="span3">
                    <div class="sidebar">
                        <ul class="widget widget-menu unstyled">
                            <li class="active">
                                <a href="Panel.aspx"><i class="menu-icon icon-dashboard"></i>Gösterge Paneli</a>
                            </li>
                            <li>
                                <a href="uyeislemler.aspx"><i class="menu-icon icon-bullhorn"></i>Üye İşlemleri</a>
                            </li>
                        </ul>
                        <!--/.widget-nav-->

                        <ul class="widget widget-menu unstyled">
                            <li><a href="urunler.aspx"><i class="icon-bar-chart icon-bold"></i> Ürünler </a></li>
                            <li><a href="urunislemleri.aspx"><i class="icon-bar-chart icon-bold"></i> Ürün İşlemleri
                                </a></li>
                            <li><a href="siparisislemleri.aspx"><i class="menu-icon icon-book"></i>Sipariş İşlemleri
                                </a></li>

                        </ul>
                        <!--/.widget-nav-->

                    </div>
                    <!--/.sidebar-->
                </div>

                <div class="span9">
                    <div class="content">
                        <div class="form-horizontal row-fluid ">

                            <!-- ürün düzenle -->
                            <div class="module">
                                <div class="module-head">
                                    <h3>Ürün Düzenle / Ekle</h3>
                                </div>
                                <div class="module-body">
                                    <div class="control-group">
                                        <label class="control-label" for="basicinput">Ürün Başlık</label>
                                        <div class="controls">
                                            <asp:TextBox ID="tburunbaslik" runat="server" placeholder="Ürün Başlığı Giriniz" class="span8" ></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="basicinput">Ürün Türü</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="ddlurunturu" runat="server" DataSourceID="sdsurunturu" DataTextField="urun_adi" DataValueField="id" class="span8"></asp:DropDownList>
                                            <asp:SqlDataSource ID="sdsurunturu" runat="server" ConnectionString="<%$ ConnectionStrings:eticaretConnectionString2 %>" SelectCommand="SELECT * FROM [urunturu]">
                                        </asp:SqlDataSource>
                                        </div>
                                    </div>


                                    <div class="control-group">
                                        <label class="control-label" for="basicinput">Ürün Markası</label>

                                        <div class="controls">
                                            <asp:DropDownList ID="ddlurunmarka" runat="server" DataSourceID="sqlurunmarka" DataTextField="urun_adi" DataValueField="id" class="span8"></asp:DropDownList>
                                            <asp:SqlDataSource ID="sqlurunmarka" runat="server" ConnectionString="<%$ ConnectionStrings:eticaretConnectionString2 %>" SelectCommand="SELECT * FROM [urunmarka]"></asp:SqlDataSource>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="basicinput">Ürün Durum</label>

                                        <div class="controls">
                                            <asp:DropDownList ID="ddldurum" runat="server" DataSourceID="sdsdurum" DataTextField="durum_adi" DataValueField="id" class="span8"></asp:DropDownList>
                                            <asp:SqlDataSource ID="sdsdurum" runat="server" ConnectionString="<%$ ConnectionStrings:eticaretConnectionString2 %>" SelectCommand="select * from [urundurum]"></asp:SqlDataSource>
                                        </div>
                                    </div>


                                    <div class="control-group">
                                        <label class="control-label" for="basicinput">Ürün Fiyatı</label>
                                        <div class="controls">
                                             <asp:TextBox ID="tbfiyat" runat="server" placeholder="Ürün Fiyatını Giriniz" class="span8" ></asp:TextBox>
                                        </div>
                                    </div>


                                    <div class="control-group">
                                        <label class="control-label" for="basicinput">Ürün Stok</label>
                                        <div class="controls">
                                              <asp:TextBox ID="tbstok" runat="server" placeholder="Ürün Stoğu Giriniz" class="span8" ></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="basicinput">Ürün Açıklama</label>
                                        <div class="controls">
                                             <asp:TextBox ID="tbaciklama" runat="server" placeholder="Ürün Açıklamasını Giriniz" class="span8" ></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="basicinput">Ürün Özellik</label>
                                        <div class="controls">
                                             <asp:TextBox ID="tbozellik" runat="server" placeholder="Ürün Özelliklerini Giriniz" class="span8" ></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="basicinput">Ürün Resim</label>
                                        <div class="controls">
                                             <asp:FileUpload ID="furesimsec" runat="server" BorderColor="White" CssClass="res" />
                                        </div>
                                    </div>



                                    <div class="control-group">
                                        <div class="controls">
                                            <asp:Button ID="btnurunekle"  class="btn btn-success" runat="server" Text="Yeni Ürün Ekle" OnClick="btnurunekle_Click" />
                                        </div>
                                    </div>
                                </div>


                            </div>

                            <!-- ürün düzenle ///-->

                            <!-- marka ekle-->

                            <div class="module">

                                <div class="module-head">
                                    <h3>Marka Ekle</h3>
                                </div>
                                <div class="module-body">
                                    <div class="control-group">
                                        <label class="control-label" for="basicinput">Marka Başlığı</label>
                                        <div class="controls">
                                            <input type="text" id="basicinput" placeholder="Yazınız.." class="span8">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <div class="controls">
                                            <button class="btn btn-success">Marka Ekle</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- marka ekle///-->

                            <!--marka sil-->

                            <div class="module">
                               <div class="module-head">
                                    <h3>Marka Sil</h3>
                                </div>
                                <div class="module-body">
                                    <div class="control-group">
                                        <label class="control-label" for="basicinput">Ürün Marka</label>

                                        <div class="controls">
                                            <select tabindex="1" data-placeholder="Select here.." class="span8">
                                                <option value="">Ürün Markayı Seçin</option>
                                                <option value="Category 1">First Row</option>
                                                <option value="Category 2">Second Row</option>
                                                <option value="Category 3">Third Row</option>
                                                <option value="Category 4">Fourth Row</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <div class="controls">
                                            <button class="btn btn-danger">Marka Sil</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--marka sil//-->
                             <!-- tür ekle-->
                             <div class="module">

                                <div class="module-head">
                                    <h3>Tür Ekle</h3>
                                </div>
                                <div class="module-body">
                                    <div class="control-group">
                                        <label class="control-label" for="basicinput">Tür Başlığı</label>
                                        <div class="controls">
                                            <input type="text" id="basicinput" placeholder="Yazınız.." class="span8">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <div class="controls">
                                            <button class="btn btn-success">Tür Ekle</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- tür ekle///-->
                              <!--tür sil-->
                              <div class="module">
                                    <div class="module-head">
                                        <h3>Tür Sil</h3>
                                    </div>
                                        <div class="module-body">
                                                <div class="control-group">
                                                    <label class="control-label" for="basicinput">Ürün Tür</label>

                                                    <div class="controls">
                                                        <select tabindex="1" data-placeholder="Select here.." class="span8">
                                                            <option value="">Ürün Tür Seçin</option>
                                                            <option value="Category 1">First Row</option>
                                                            <option value="Category 2">Second Row</option>
                                                            <option value="Category 3">Third Row</option>
                                                            <option value="Category 4">Fourth Row</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="control-group">
                                                    <div class="controls">
                                                        <button class="btn btn-danger">Tür Sil</button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    <!--tür sil//-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--/.wrapper-->

            <div class="footer">
                <div class="container">
                    <b class="copyright">&copy; 2020 ÇELİK MARKET </b>Tüm hakları saklıdır.
                </div>
            </div>

            <script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
            <script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
            <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
            <script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
            <script src="scripts/flot/jquery.flot.resize.js" type="text/javascript"></script>
            <script src="scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
            <script src="scripts/common.js" type="text/javascript"></script>
        </asp:Panel>
    </form>
</body>
</html>
