USE [master]
GO
/****** Object:  Database [eticaret]    Script Date: 1.05.2020 22:55:52 ******/
CREATE DATABASE [eticaret]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eticaret', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\eticaret.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'eticaret_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\eticaret_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [eticaret] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eticaret].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eticaret] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eticaret] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eticaret] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eticaret] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eticaret] SET ARITHABORT OFF 
GO
ALTER DATABASE [eticaret] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eticaret] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [eticaret] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eticaret] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eticaret] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eticaret] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eticaret] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eticaret] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eticaret] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eticaret] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eticaret] SET  ENABLE_BROKER 
GO
ALTER DATABASE [eticaret] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eticaret] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eticaret] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eticaret] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eticaret] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eticaret] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eticaret] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eticaret] SET RECOVERY FULL 
GO
ALTER DATABASE [eticaret] SET  MULTI_USER 
GO
ALTER DATABASE [eticaret] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eticaret] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eticaret] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eticaret] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'eticaret', N'ON'
GO
USE [eticaret]
GO
/****** Object:  Table [dbo].[ayar]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ayar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[admin_id] [int] NOT NULL,
	[site_logo] [nvarchar](250) NULL,
	[instagram] [nvarchar](250) NULL,
	[twiter] [nvarchar](250) NULL,
	[facebook] [nvarchar](250) NULL,
	[baslik] [nvarchar](250) NULL,
	[telefon] [nvarchar](20) NULL,
	[etiket] [varchar](250) NULL,
	[mail] [nvarchar](250) NULL,
	[guncellenme_tarihi] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ilceler]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ilceler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ilce_adi] [nvarchar](250) NOT NULL,
	[il_kodu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[iller]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iller](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[il_adi] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[indirim]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[indirim](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[indirimyuzde] [int] NOT NULL,
	[baslangic_tarihi] [datetime] NULL,
	[bitis_tarihi] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[kargodetay]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kargodetay](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[kargo_adi] [int] NOT NULL,
	[kargo_desi] [int] NOT NULL,
	[hangi_ilden] [int] NOT NULL,
	[hangi_ilceye] [int] NOT NULL,
	[fiyati] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[kargosirketleri]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kargosirketleri](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[kargo_adi] [nvarchar](250) NOT NULL,
	[anlasma_tarihi] [datetime] NOT NULL,
	[anlasma_bitis_tarihi] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[kategori]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kategori](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[urun_kod] [int] NOT NULL,
	[renk] [nvarchar](250) NULL,
	[urun_olcusu] [float] NULL,
	[indirim_degeri] [int] NULL,
	[kullanim_yeri] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sepet]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sepet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[satin_alan_uye] [int] NOT NULL,
	[sepet_urun] [int] NOT NULL,
	[urun_adedi] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[siparisdurumu]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[siparisdurumu](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[durum_adi] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[siparisler]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[siparisler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[onay_admin_adi] [nvarchar](250) NULL,
	[siparis_durumu] [int] NOT NULL,
	[siparis_urun] [int] NOT NULL,
	[satin_alan_uye] [int] NOT NULL,
	[indirim_durumu] [int] NULL,
	[taksit_durumu] [int] NULL,
	[kargo_firmasi] [int] NOT NULL,
	[gonderilen_il] [int] NOT NULL,
	[gonderilen_ilce] [int] NOT NULL,
	[satis_tarihi] [datetime] NOT NULL,
	[toplam_fiyat] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[taksitlendirme]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taksitlendirme](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[satis_turu] [nvarchar](250) NOT NULL,
	[taksit_ayi] [int] NOT NULL,
	[ay_tutari] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[urundurum]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[urundurum](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[durum_adi] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[uruniade]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uruniade](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[admin_id] [int] NOT NULL,
	[siparis_durumu] [int] NOT NULL,
	[siparis_urun] [int] NOT NULL,
	[satin_alan_uye] [int] NOT NULL,
	[iptal_tarihi] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[urunler]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[urunler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[urun_baslik] [nvarchar](250) NOT NULL,
	[urun_turu] [int] NOT NULL,
	[urun_marka] [int] NOT NULL,
	[urun_fiyat] [float] NOT NULL,
	[urun_stok] [int] NOT NULL,
	[urun_durum] [int] NOT NULL,
	[urun_aciklama] [nvarchar](250) NULL,
	[urun_ozelik] [nvarchar](250) NULL,
	[urun_resim] [nvarchar](250) NULL,
	[eklenme_trh] [datetime] NULL,
	[günc_trh] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[urunmarka]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[urunmarka](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[urun_adi] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[urunturu]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[urunturu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[urun_adi] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[uyeadres]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uyeadres](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uye_id] [int] NULL,
	[adres] [nvarchar](250) NULL,
	[il] [int] NULL,
	[ilce] [int] NULL,
	[telefon] [nvarchar](11) NULL,
	[guncellenme_tarihi] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[uyedurum]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uyedurum](
	[id] [int] NOT NULL,
	[uye_tipi] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[uyegecmis]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uyegecmis](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uye] [int] NOT NULL,
	[satis_kodu] [int] NOT NULL,
	[satilan_urun] [int] NOT NULL,
	[satis_tarihi] [datetime] NOT NULL,
	[satis_durumu] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[uyeler]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uyeler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uye_adi] [nvarchar](250) NOT NULL,
	[uye_soyadi] [nvarchar](250) NOT NULL,
	[email] [nvarchar](250) NOT NULL,
	[sifre] [nvarchar](250) NOT NULL,
	[guvenlik_kodu] [nvarchar](250) NOT NULL,
	[uyetipi] [int] NULL,
	[uye_durum] [int] NULL,
	[kayit_tarihi] [datetime] NOT NULL,
	[guncellenme_tarihi] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[uyetipi]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uyetipi](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[uye_tipi] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yorumlar]    Script Date: 1.05.2020 22:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yorumlar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uye_id] [int] NOT NULL,
	[urun_kodu] [int] NOT NULL,
	[yorumlar] [nvarchar](250) NULL,
	[puanlar] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[uyeler] ADD  DEFAULT ((0)) FOR [uyetipi]
GO
ALTER TABLE [dbo].[uyeler] ADD  DEFAULT ((1)) FOR [uye_durum]
GO
ALTER TABLE [dbo].[ayar]  WITH CHECK ADD FOREIGN KEY([admin_id])
REFERENCES [dbo].[uyeler] ([id])
GO
ALTER TABLE [dbo].[ilceler]  WITH CHECK ADD FOREIGN KEY([il_kodu])
REFERENCES [dbo].[iller] ([id])
GO
ALTER TABLE [dbo].[kargodetay]  WITH CHECK ADD FOREIGN KEY([hangi_ilden])
REFERENCES [dbo].[iller] ([id])
GO
ALTER TABLE [dbo].[kargodetay]  WITH CHECK ADD FOREIGN KEY([hangi_ilceye])
REFERENCES [dbo].[ilceler] ([id])
GO
ALTER TABLE [dbo].[kargodetay]  WITH CHECK ADD FOREIGN KEY([kargo_adi])
REFERENCES [dbo].[kargosirketleri] ([id])
GO
ALTER TABLE [dbo].[kategori]  WITH CHECK ADD FOREIGN KEY([indirim_degeri])
REFERENCES [dbo].[indirim] ([id])
GO
ALTER TABLE [dbo].[kategori]  WITH CHECK ADD FOREIGN KEY([urun_kod])
REFERENCES [dbo].[urunler] ([id])
GO
ALTER TABLE [dbo].[sepet]  WITH CHECK ADD FOREIGN KEY([satin_alan_uye])
REFERENCES [dbo].[uyeler] ([id])
GO
ALTER TABLE [dbo].[sepet]  WITH CHECK ADD FOREIGN KEY([sepet_urun])
REFERENCES [dbo].[urunler] ([id])
GO
ALTER TABLE [dbo].[siparisler]  WITH CHECK ADD FOREIGN KEY([gonderilen_il])
REFERENCES [dbo].[iller] ([id])
GO
ALTER TABLE [dbo].[siparisler]  WITH CHECK ADD FOREIGN KEY([gonderilen_ilce])
REFERENCES [dbo].[ilceler] ([id])
GO
ALTER TABLE [dbo].[siparisler]  WITH CHECK ADD FOREIGN KEY([indirim_durumu])
REFERENCES [dbo].[indirim] ([id])
GO
ALTER TABLE [dbo].[siparisler]  WITH CHECK ADD FOREIGN KEY([kargo_firmasi])
REFERENCES [dbo].[kargosirketleri] ([id])
GO
ALTER TABLE [dbo].[siparisler]  WITH CHECK ADD FOREIGN KEY([satin_alan_uye])
REFERENCES [dbo].[uyeler] ([id])
GO
ALTER TABLE [dbo].[siparisler]  WITH CHECK ADD FOREIGN KEY([siparis_durumu])
REFERENCES [dbo].[siparisdurumu] ([id])
GO
ALTER TABLE [dbo].[siparisler]  WITH CHECK ADD FOREIGN KEY([siparis_urun])
REFERENCES [dbo].[urunler] ([id])
GO
ALTER TABLE [dbo].[siparisler]  WITH CHECK ADD FOREIGN KEY([taksit_durumu])
REFERENCES [dbo].[taksitlendirme] ([id])
GO
ALTER TABLE [dbo].[uruniade]  WITH CHECK ADD FOREIGN KEY([admin_id])
REFERENCES [dbo].[uyeler] ([id])
GO
ALTER TABLE [dbo].[uruniade]  WITH CHECK ADD FOREIGN KEY([satin_alan_uye])
REFERENCES [dbo].[uyeler] ([id])
GO
ALTER TABLE [dbo].[uruniade]  WITH CHECK ADD FOREIGN KEY([siparis_durumu])
REFERENCES [dbo].[siparisdurumu] ([id])
GO
ALTER TABLE [dbo].[uruniade]  WITH CHECK ADD FOREIGN KEY([siparis_urun])
REFERENCES [dbo].[urunler] ([id])
GO
ALTER TABLE [dbo].[urunler]  WITH CHECK ADD FOREIGN KEY([urun_durum])
REFERENCES [dbo].[urundurum] ([id])
GO
ALTER TABLE [dbo].[urunler]  WITH CHECK ADD FOREIGN KEY([urun_turu])
REFERENCES [dbo].[urunturu] ([id])
GO
ALTER TABLE [dbo].[urunler]  WITH CHECK ADD  CONSTRAINT [fk_urunmarka_id] FOREIGN KEY([urun_marka])
REFERENCES [dbo].[urunmarka] ([id])
GO
ALTER TABLE [dbo].[urunler] CHECK CONSTRAINT [fk_urunmarka_id]
GO
ALTER TABLE [dbo].[uyeadres]  WITH CHECK ADD FOREIGN KEY([il])
REFERENCES [dbo].[iller] ([id])
GO
ALTER TABLE [dbo].[uyeadres]  WITH CHECK ADD FOREIGN KEY([ilce])
REFERENCES [dbo].[ilceler] ([id])
GO
ALTER TABLE [dbo].[uyeadres]  WITH CHECK ADD FOREIGN KEY([uye_id])
REFERENCES [dbo].[uyeler] ([id])
GO
ALTER TABLE [dbo].[uyegecmis]  WITH CHECK ADD FOREIGN KEY([satilan_urun])
REFERENCES [dbo].[urunler] ([id])
GO
ALTER TABLE [dbo].[uyegecmis]  WITH CHECK ADD FOREIGN KEY([uye])
REFERENCES [dbo].[uyeler] ([id])
GO
ALTER TABLE [dbo].[uyeler]  WITH CHECK ADD FOREIGN KEY([uye_durum])
REFERENCES [dbo].[uyedurum] ([id])
GO
ALTER TABLE [dbo].[uyeler]  WITH CHECK ADD FOREIGN KEY([uyetipi])
REFERENCES [dbo].[uyetipi] ([id])
GO
ALTER TABLE [dbo].[yorumlar]  WITH CHECK ADD FOREIGN KEY([urun_kodu])
REFERENCES [dbo].[urunler] ([id])
GO
ALTER TABLE [dbo].[yorumlar]  WITH CHECK ADD FOREIGN KEY([uye_id])
REFERENCES [dbo].[uyeler] ([id])
GO
USE [master]
GO
ALTER DATABASE [eticaret] SET  READ_WRITE 
GO
