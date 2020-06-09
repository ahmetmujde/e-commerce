<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Panel.aspx.cs" Inherits="ahmet_koray_eticaret.admin.index" %>

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
                        <!--/.span3-->
                        <div class="span9">
                            <div class="content">
                                <div class="btn-controls">
                                    <div class="btn-box-row row-fluid">
                                        <a href="#" class="btn-box big span3"><i class="icon-exchange"></i><b>15</b>
                                            <p class="text-muted">
                                                Gelen Siparişler</p>
                                        </a><a href="#" class="btn-box big span3"><i class=" icon-random"></i><b>129</b>
                                            <p class="text-muted">
                                                Onaylanan Siparişler</p>
                                        </a><a href="#" class="btn-box big span3"><i class="icon-bar-chart"></i><b>129</b>
                                            <p class="text-muted">
                                                Toplam Ürün Sayısı</p>
                                        </a>
                                        <a href="#" class="btn-box big span3"><i class="icon-money"></i><b>129</b>
                                            <p class="text-muted">
                                                Toplam Kar</p>
                                        </a>

                                    </div>


                                    <div class="btn-box-row row-fluid">

                                        <a href="#" class="btn-box big span4"><i class="icon-eye-open"></i><b>554</b>
                                            <p class="text-muted">
                                                Online Ziyaretçiler</p>
                                        </a><a href="#" class="btn-box big span4"><i class="icon-group"></i><b>112.334</b>
                                            <p class="text-muted">
                                                Toplam Ziyaretçiler</p>
                                        </a><a href="#" class="btn-box big span4"><i class="icon-save"></i><b>129</b>
                                            <p class="text-muted">
                                                Toplam Üye Sayısı</p>
                                        </a>

                                    </div>

                                    <!--/.module-->

                                    <div class="module">
                                        <div class="module-head">
                                            <h3>
                                                Son Siparişler</h3>
                                        </div>
                                        <div class="module-body table">
                                            <table cellpadding="0" cellspacing="0" border="0"
                                                class=" table table-bordered table-striped display " width="100%">
                                                <thead>
                                                    <tr>
                                                        <th>
                                                            Başlık
                                                        </th>
                                                        <th>
                                                            Başlık

                                                        </th>
                                                        <th>
                                                            Başlık

                                                        </th>
                                                        <th>
                                                            Başlık

                                                        </th>
                                                        <th>
                                                            Başlık

                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="odd">
                                                        <td>
                                                            içerik
                                                        </td>
                                                        <td>
                                                            içerik
                                                        </td>
                                                        <td>
                                                            içerik
                                                        </td>
                                                        <td class="center">
                                                            içerik
                                                        </td>
                                                        <td class="center">
                                                            içerik
                                                        </td>
                                                    </tr>
                                                    <tr class="odd">
                                                        <td>
                                                            içerik
                                                        </td>
                                                        <td>
                                                            içerik
                                                        </td>
                                                        <td>
                                                            içerik
                                                        </td>
                                                        <td class="center">
                                                            içerik
                                                        </td>
                                                        <td class="center">
                                                            içerik
                                                        </td>
                                                    </tr>

                                                </tbody>

                                            </table>
                                        </div>
                                    </div>

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
        </asp:Panel>
    </form>

        <script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
        <script src="scripts/flot/jquery.flot.resize.js" type="text/javascript"></script>
        <script src="scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="scripts/common.js" type="text/javascript"></script>

</body>
</html>