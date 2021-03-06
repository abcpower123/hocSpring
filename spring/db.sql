USE [master]
GO
/****** Object:  Database [MusicStore]    Script Date: 5/26/2018 3:41:27 AM ******/
CREATE DATABASE [MusicStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'murach', FILENAME = N'E:\SQLSever\MSSQL12.HAOSV\MSSQL\DATA\murach.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'murach_log', FILENAME = N'E:\SQLSever\MSSQL12.HAOSV\MSSQL\DATA\murach_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MusicStore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MusicStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MusicStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MusicStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MusicStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MusicStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MusicStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [MusicStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MusicStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MusicStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MusicStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MusicStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MusicStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MusicStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MusicStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MusicStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MusicStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MusicStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MusicStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MusicStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MusicStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MusicStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MusicStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MusicStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MusicStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MusicStore] SET  MULTI_USER 
GO
ALTER DATABASE [MusicStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MusicStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MusicStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MusicStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MusicStore] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MusicStore]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/26/2018 3:41:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[UsersName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[Permission] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[UsersName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Download]    Script Date: 5/26/2018 3:41:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Download](
	[DownloadID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[DownloadDate] [datetime] NOT NULL,
	[ProductCode] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DownloadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 5/26/2018 3:41:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK__Invoice__D796AAD520883BFA] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/26/2018 3:41:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[ProductDescription] [nvarchar](100) NULL CONSTRAINT [DF__Product__Product__36B12243]  DEFAULT (''),
	[ProductPrice] [decimal](7, 2) NULL CONSTRAINT [DF__Product__Product__37A5467C]  DEFAULT ('0.00'),
	[ProductURL] [nvarchar](max) NULL,
	[ImageURL] [nvarchar](max) NULL,
 CONSTRAINT [PK__Product__B40CC6EDB79BE31B] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SongExample]    Script Date: 5/26/2018 3:41:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongExample](
	[ProductID] [int] NOT NULL,
	[ExampleSongName] [nvarchar](50) NOT NULL,
	[ExampleSongURL] [nvarchar](max) NULL,
	[IsExample] [int] NULL,
 CONSTRAINT [PK_SongExample] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[ExampleSongName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/26/2018 3:41:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](50) NULL,
	[CreditCardType] [nvarchar](50) NULL,
	[CreditCardNumber] [varchar](50) NULL,
	[CreditCardExpirationDate] [varchar](50) NULL,
	[UserAccount] [varchar](50) NULL,
	[Subcribes] [int] NULL,
 CONSTRAINT [PK__Users__1788CCAC4C419BBB] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([UsersName], [Password], [Permission]) VALUES (N'abcpower123', N'suhao123', 0)
INSERT [dbo].[Account] ([UsersName], [Password], [Permission]) VALUES (N'ao', NULL, 0)
INSERT [dbo].[Account] ([UsersName], [Password], [Permission]) VALUES (N'hao', N'123', 1)
INSERT [dbo].[Account] ([UsersName], [Password], [Permission]) VALUES (N'taikhoan1', N'matkhau1', 0)
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [ProductID]) VALUES (2, 1, 2)
INSERT [dbo].[Invoice] ([InvoiceID], [UserID], [ProductID]) VALUES (3, 1, 1)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [ProductURL], [ImageURL]) VALUES (1, N'Nhạc không lời-giai điệu cuộc sống', N'Tuyển tập các bản nhạc không lời hay nhất', CAST(50000.00 AS Decimal(7, 2)), N'/product/giaidieucuocsong.rar', N'/images/album/giaidieucuocsong.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [ProductURL], [ImageURL]) VALUES (2, N'Tuổi học trò', N'Tuyển tập các bài hát về thời học sinh đầy kỉ niệm', CAST(30000.00 AS Decimal(7, 2)), N'/product/tuoihoctro.rar', N'/images/album/tuoihoctro.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [ProductURL], [ImageURL]) VALUES (3, N'Nơi này có anh', N'Album mới phát hành của ca sĩ ST MTP', CAST(40000.00 AS Decimal(7, 2)), N'/product/noinaycoanh.rar', N'/images/album/noinaycoanh.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductPrice], [ProductURL], [ImageURL]) VALUES (4, N'Nhạc trẻ 2018', N'Các các khúc được khán giả bình chọn nhiều nhất trên zing mp3 1/2018', CAST(40000.00 AS Decimal(7, 2)), N'/product/nhactre2018.rar', N'/images/album/nhactre2018.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (1, N'Forever', NULL, 0)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (1, N'Hope you', N'/music/hope u.MP3', 1)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (1, N'In love', N'/music/in love.MP3', 1)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (1, N'Nothing gonna change my love for you', NULL, 0)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (1, N'Shining The Morning', N'/music/Shining The Morning.MP3', 1)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (2, N'Mong ước kỉ niệm xưa', NULL, 0)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (2, N'Ngày ấy bạn và tôi', N'/music/ngayaybanvatoi.MP3', 1)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (2, N'Như ngày hôm qua', N'/music/nhungayhomqua.MP3', 1)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (2, N'Tiết học cuối cùng', N'/music/tiethoccuoicung.MP3', 1)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (3, N'Âm thầm bên em', N'/music/amthambenem.MP3', 1)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (3, N'Chắc ai đó sẽ về', N'/music/chacaidoseve.MP3', 1)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (3, N'Cơn mưa ngang qua', NULL, 0)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (3, N'Lạc trôi', NULL, 0)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (3, N'Nơi này có anh', N'/music/noinaycoanh.MP3', 1)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (4, N'Đừng như thói quen', N'/music/dungnhuthoiquen.mp3', 1)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (4, N'Phút ban đầu', N'/music/phutbandau.mp3', 1)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (4, N'Shape of you', NULL, 0)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (4, N'Trong trí nhớ của anh', N'/music/trongtrinhocuaanh.mp3', 1)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (4, N'Túy âm', NULL, 0)
INSERT [dbo].[SongExample] ([ProductID], [ExampleSongName], [ExampleSongURL], [IsExample]) VALUES (4, N'Việt Nam, đi, hôn và yêu...', NULL, 0)
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Name], [Email], [CompanyName], [Address], [City], [CreditCardType], [CreditCardNumber], [CreditCardExpirationDate], [UserAccount], [Subcribes]) VALUES (1, N'Đặng Thanh Hào', N'aszqsc@gmail.com', N'Đại học SP', N'Liên Chiểu, Đà Nẵng', N'Đà Nẵng', N'VISA', N'123654', N'2020/1/1', N'hao', 1)
INSERT [dbo].[Users] ([UserID], [Name], [Email], [CompanyName], [Address], [City], [CreditCardType], [CreditCardNumber], [CreditCardExpirationDate], [UserAccount], [Subcribes]) VALUES (2, N'dang thanh', N'aszqsc@gmail.com', N'asd', N'diachi', N'danang', N'student', N'123', N'2/2/2100.', NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Name], [Email], [CompanyName], [Address], [City], [CreditCardType], [CreditCardNumber], [CreditCardExpirationDate], [UserAccount], [Subcribes]) VALUES (3, N'hovaten1', N'email1@gmail.com', N'noilamviec1', N'diachi1', N'thanhpho1', N'the1', N'123', N'1/1/1', N'taikhoan1', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Download]  WITH CHECK ADD  CONSTRAINT [FK__Download__UserID__3A81B327] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Download] CHECK CONSTRAINT [FK__Download__UserID__3A81B327]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK__Invoice__UserID__2B3F6F97] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK__Invoice__UserID__2B3F6F97]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Product]
GO
ALTER TABLE [dbo].[SongExample]  WITH CHECK ADD  CONSTRAINT [FK_SongExample_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SongExample] CHECK CONSTRAINT [FK_SongExample_Product]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Account] FOREIGN KEY([UserAccount])
REFERENCES [dbo].[Account] ([UsersName])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Account]
GO
USE [master]
GO
ALTER DATABASE [MusicStore] SET  READ_WRITE 
GO
