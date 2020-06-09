<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminlogin.aspx.cs" Inherits="ahmet_koray_eticaret.adminlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>E-Ticaret</title>
    <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
	<link type="text/css" href="css/theme.css" rel="stylesheet" />
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet" />
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet' />
</head>
<body>

<div class="container">
	<div class="row">
		<div class="module module-login span4 offset4">
			<form id="form1" runat="server">
				<div class="module-head">
					<h3>Admin Giris</h3>
				</div>
				<div class="module-body">
					<div class="control-group">
						<div class="controls row-fluid">
							<asp:TextBox ID="tbmail" runat="server"  class="form-control" placeholder="E-mail Adresinizi Giriniz..."></asp:TextBox>   
						</div>
					</div>
					<div class="control-group">
						<div class="controls row-fluid">
							 <asp:TextBox ID="tbsifre" runat="server" TextMode="Password" class="form-control" placeholder="Sifrenizi Giriniz.."></asp:TextBox>   

						</div>
					</div>
				</div>
				<div class="module-foot">
					    <div class="control-group">
						    <div class="controls clearfix">
                                <asp:Button ID="btngiris" class="btn btn-primary pull-right" runat="server" Text="GİRİS" OnClick="btngiris_Click" />
						</div>
                    </div>
				</div>
			</div>
		</form>
	</div>
</div>
   


<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

</body>

</html>
