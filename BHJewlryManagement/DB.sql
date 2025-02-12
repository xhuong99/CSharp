USE [master]
GO
/****** Object:  Database [BHJewlryDB]    Script Date: 12/17/2019 11:22:01 PM ******/
CREATE DATABASE [BHJewlryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BHJewlryDB', FILENAME = N'D:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BHJewlryDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BHJewlryDB_log', FILENAME = N'D:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BHJewlryDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BHJewlryDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BHJewlryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BHJewlryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BHJewlryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BHJewlryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BHJewlryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BHJewlryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BHJewlryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BHJewlryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BHJewlryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BHJewlryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BHJewlryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BHJewlryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BHJewlryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BHJewlryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BHJewlryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BHJewlryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BHJewlryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BHJewlryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BHJewlryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BHJewlryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BHJewlryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BHJewlryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BHJewlryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BHJewlryDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BHJewlryDB] SET  MULTI_USER 
GO
ALTER DATABASE [BHJewlryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BHJewlryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BHJewlryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BHJewlryDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BHJewlryDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BHJewlryDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/17/2019 11:22:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[IDAcc] [varchar](20) NOT NULL,
	[PassAcc] [varchar](20) NOT NULL,
	[EmailAcc] [varchar](50) NULL,
	[NameAcc] [varchar](30) NULL,
	[PhoneAcc] [varchar](14) NULL,
	[AddrAcc] [varchar](50) NULL,
	[GenAcc] [bit] NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK__Account__93262410B96545B9] PRIMARY KEY CLUSTERED 
(
	[IDAcc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/17/2019 11:22:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[IDCate] [int] NOT NULL,
	[NameCate] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Color]    Script Date: 12/17/2019 11:22:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Color](
	[IDCol] [int] NOT NULL,
	[NameCol] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/17/2019 11:22:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[IDOrd] [int] IDENTITY(1,1) NOT NULL,
	[DateOrd] [varchar](10) NOT NULL,
	[IDAcc] [varchar](20) NOT NULL,
	[TotalPrice] [float] NULL,
 CONSTRAINT [PK__Order__A6C3525D49CD2228] PRIMARY KEY CLUSTERED 
(
	[IDOrd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/17/2019 11:22:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[IDOrdD] [int] NOT NULL,
	[IDPro] [int] NOT NULL,
	[QuanOrdD] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDOrdD] ASC,
	[IDPro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/17/2019 11:22:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[IDPro] [int] NOT NULL,
	[IDCate] [int] NOT NULL,
	[IDCol] [int] NOT NULL,
	[NamePro] [nvarchar](50) NOT NULL,
	[PricePro] [float] NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK__Product__98F92859384A5E94] PRIMARY KEY CLUSTERED 
(
	[IDPro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[Account] ([IDAcc], [PassAcc], [EmailAcc], [NameAcc], [PhoneAcc], [AddrAcc], [GenAcc], [IsAdmin]) VALUES (N'dat123', N'123', N'datdang@gmail.com', N'Dang Dat', N'036234631', N'Q12', 1, 0)
INSERT [dbo].[Account] ([IDAcc], [PassAcc], [EmailAcc], [NameAcc], [PhoneAcc], [AddrAcc], [GenAcc], [IsAdmin]) VALUES (N'nguyen123', N'123', N'nguyenthinu@gmail.com', N'Thi Nu', N'0123123121', N'Q3', 0, 1)
INSERT [dbo].[Account] ([IDAcc], [PassAcc], [EmailAcc], [NameAcc], [PhoneAcc], [AddrAcc], [GenAcc], [IsAdmin]) VALUES (N'sa', N'123', N'sa1234@fpt.edu.vn', N'SAA', N'0909247125', N'123 HH Q7', 1, 0)
INSERT [dbo].[Account] ([IDAcc], [PassAcc], [EmailAcc], [NameAcc], [PhoneAcc], [AddrAcc], [GenAcc], [IsAdmin]) VALUES (N'test123', N'123', N'test001@gmail.com', N'Tester name', N'0987432123', N'Q1', 1, 1)
INSERT [dbo].[Account] ([IDAcc], [PassAcc], [EmailAcc], [NameAcc], [PhoneAcc], [AddrAcc], [GenAcc], [IsAdmin]) VALUES (N'tram123', N'123', N'tramanh@gmail.com', N'Tram Anh', N'039123456', N'Q9', 0, 0)
INSERT [dbo].[Category] ([IDCate], [NameCate]) VALUES (1, N'Ring')
INSERT [dbo].[Category] ([IDCate], [NameCate]) VALUES (2, N'Necklace')
INSERT [dbo].[Category] ([IDCate], [NameCate]) VALUES (3, N'Bracelet')
INSERT [dbo].[Category] ([IDCate], [NameCate]) VALUES (4, N'Earrings')
INSERT [dbo].[Color] ([IDCol], [NameCol]) VALUES (1, N'Platinium')
INSERT [dbo].[Color] ([IDCol], [NameCol]) VALUES (2, N'Golden')
INSERT [dbo].[Color] ([IDCol], [NameCol]) VALUES (3, N'Silver')
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([IDOrd], [DateOrd], [IDAcc], [TotalPrice]) VALUES (14, N'12/16/2019', N'sa', 3001)
INSERT [dbo].[Order] ([IDOrd], [DateOrd], [IDAcc], [TotalPrice]) VALUES (15, N'12/16/2019', N'sa', 2421.199951171875)
INSERT [dbo].[Order] ([IDOrd], [DateOrd], [IDAcc], [TotalPrice]) VALUES (1010, N'12/17/2019', N'sa', 7282)
INSERT [dbo].[Order] ([IDOrd], [DateOrd], [IDAcc], [TotalPrice]) VALUES (1011, N'12/17/2019', N'sa', 4530)
INSERT [dbo].[Order] ([IDOrd], [DateOrd], [IDAcc], [TotalPrice]) VALUES (1012, N'12/17/2019', N'sa', 1450.5)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetails] ([IDOrdD], [IDPro], [QuanOrdD]) VALUES (14, 7, 1)
INSERT [dbo].[OrderDetails] ([IDOrdD], [IDPro], [QuanOrdD]) VALUES (14, 9, 2)
INSERT [dbo].[OrderDetails] ([IDOrdD], [IDPro], [QuanOrdD]) VALUES (15, 5, 4)
INSERT [dbo].[OrderDetails] ([IDOrdD], [IDPro], [QuanOrdD]) VALUES (15, 15, 2)
INSERT [dbo].[OrderDetails] ([IDOrdD], [IDPro], [QuanOrdD]) VALUES (1010, 10, 2)
INSERT [dbo].[OrderDetails] ([IDOrdD], [IDPro], [QuanOrdD]) VALUES (1010, 14, 4)
INSERT [dbo].[OrderDetails] ([IDOrdD], [IDPro], [QuanOrdD]) VALUES (1011, 1, 3)
INSERT [dbo].[OrderDetails] ([IDOrdD], [IDPro], [QuanOrdD]) VALUES (1011, 5, 3)
INSERT [dbo].[OrderDetails] ([IDOrdD], [IDPro], [QuanOrdD]) VALUES (1012, 4, 2)
INSERT [dbo].[OrderDetails] ([IDOrdD], [IDPro], [QuanOrdD]) VALUES (1012, 14, 1)
INSERT [dbo].[Product] ([IDPro], [IDCate], [IDCol], [NamePro], [PricePro], [Image]) VALUES (1, 1, 1, N'Queen Ring', 1300, N'/Img/s-l300.jpg')
INSERT [dbo].[Product] ([IDPro], [IDCate], [IDCol], [NamePro], [PricePro], [Image]) VALUES (4, 2, 2, N'Golden Necklace', 440, N'/Img/il_fullxfull.2079914688_6z8w-300x300.jpg')
INSERT [dbo].[Product] ([IDPro], [IDCate], [IDCol], [NamePro], [PricePro], [Image]) VALUES (5, 2, 3, N'Silver Necklace', 210, N'/Img/day-chuyen-khoa-truong-an2-min-1-300x300.jpg')
INSERT [dbo].[Product] ([IDPro], [IDCate], [IDCol], [NamePro], [PricePro], [Image]) VALUES (6, 2, 3, N'Shiny Necklace', 790, N'/Img/necklace-with-pendant-round-clear-zircon-and-shiny-wave.jpg')
INSERT [dbo].[Product] ([IDPro], [IDCate], [IDCol], [NamePro], [PricePro], [Image]) VALUES (7, 3, 1, N'Dream Land', 600, N'/Img/c890b18772151378801df657bb0f5e40.jpg')
INSERT [dbo].[Product] ([IDPro], [IDCate], [IDCol], [NamePro], [PricePro], [Image]) VALUES (9, 3, 2, N'Best Memories For You', 1200.5, N'/Img/9a09f05437bc58bf99a453ea73ce331f.jpg')
INSERT [dbo].[Product] ([IDPro], [IDCate], [IDCol], [NamePro], [PricePro], [Image]) VALUES (10, 2, 3, N'Heart of the Ocean', 2500, N'/Img/s-l300 (1).jpg')
INSERT [dbo].[Product] ([IDPro], [IDCate], [IDCol], [NamePro], [PricePro], [Image]) VALUES (11, 1, 1, N'Moissanite Engagement', 145, N'/Img/GTJ3867-round-w-6mm-3-300x300.jpg')
INSERT [dbo].[Product] ([IDPro], [IDCate], [IDCol], [NamePro], [PricePro], [Image]) VALUES (13, 1, 2, N'The Aaradh Band', 124.56999969482422, N'/Img/GNSG010BG-300x300.jpg')
INSERT [dbo].[Product] ([IDPro], [IDCate], [IDCol], [NamePro], [PricePro], [Image]) VALUES (14, 4, 1, N'Double Hanging Claddagh', 570.5, N'/Img/ES01132-300x300-1.jpg')
INSERT [dbo].[Product] ([IDPro], [IDCate], [IDCol], [NamePro], [PricePro], [Image]) VALUES (15, 4, 2, N'Hot Blue Sapphire Gem', 790.6, N'/Img/s-l300 (2).jpg')
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__IDAcc__5CD6CB2B] FOREIGN KEY([IDAcc])
REFERENCES [dbo].[Account] ([IDAcc])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__IDAcc__5CD6CB2B]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([IDOrdD])
REFERENCES [dbo].[Order] ([IDOrd])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([IDPro])
REFERENCES [dbo].[Product] ([IDPro])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__IDCate__4316F928] FOREIGN KEY([IDCate])
REFERENCES [dbo].[Category] ([IDCate])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__IDCate__4316F928]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__IDCol__440B1D61] FOREIGN KEY([IDCol])
REFERENCES [dbo].[Color] ([IDCol])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__IDCol__440B1D61]
GO
USE [master]
GO
ALTER DATABASE [BHJewlryDB] SET  READ_WRITE 
GO
