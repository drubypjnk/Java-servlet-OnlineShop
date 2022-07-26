USE [master]
GO
/****** Object:  Database [SWP391]    Script Date: 6/29/2022 5:43:46 PM ******/
CREATE DATABASE [SWP391]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP391', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SWP391.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP391_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SWP391_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SWP391] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWP391] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP391] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP391] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP391] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP391] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP391] SET QUERY_STORE = OFF
GO
USE [SWP391]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[full_name] [nvarchar](255) NULL,
	[role_id] [int] NULL,
	[gender] [bit] NULL,
	[email] [varchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[country] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[phone] [varchar](15) NULL,
	[image_url] [varchar](255) NULL,
	[featured] [bit] NULL,
	[hash] [varchar](255) NULL,
	[active] [int] NULL,
	[registered_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[general_feedbacks]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[general_feedbacks](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[star] [float] NULL,
	[feedbacks_content] [ntext] NULL,
	[full_name] [nvarchar](255) NULL,
	[phone] [varchar](15) NULL,
	[gender] [bit] NULL,
	[email] [varchar](255) NULL,
	[image_url] [varchar](255) NULL,
	[feedback_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_status]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](51) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[order_date] [datetime] NULL,
	[require_date] [datetime] NULL,
	[shipped_date] [datetime] NULL,
	[ship_via] [int] NULL,
	[freight] [money] NULL,
	[ship_name] [nvarchar](255) NULL,
	[ship_address] [nvarchar](255) NULL,
	[ship_gender] [bit] NULL,
	[ship_mobile] [varchar](15) NULL,
	[ship_email] [varchar](255) NULL,
	[ship_city] [nvarchar](255) NULL,
	[status] [int] NULL,
	[note] [ntext] NULL,
	[total_price] [money] NOT NULL,
	[payment] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders_management]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders_management](
	[order_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_Order_Sale] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permissions]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permissions](
	[role_id] [int] NULL,
	[screen_id] [int] NULL,
	[activity_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post_categories]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post_categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](255) NULL,
	[description] [ntext] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post_sub_categories]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post_sub_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[name] [ntext] NULL,
	[description] [ntext] NULL,
	[feature] [bit] NULL,
 CONSTRAINT [PK__post_sub__3213E83F8434223E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[posts]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posts](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[title] [nvarchar](511) NULL,
	[thumbnail] [text] NULL,
	[updated_date] [datetime] NULL,
	[post_details] [ntext] NULL,
	[featured] [bit] NULL,
	[sub_title] [ntext] NULL,
	[publication_date] [datetime] NULL,
	[post_subcategories_id] [int] NULL,
 CONSTRAINT [PK__posts__3ED78766A39437E4] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_categories]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](100) NULL,
	[description] [varchar](255) NULL,
	[featured] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_feedbacks]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_feedbacks](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[star] [float] NULL,
	[feedbacks_content] [ntext] NULL,
	[full_name] [nvarchar](255) NULL,
	[phone] [varchar](15) NULL,
	[gender] [bit] NULL,
	[email] [varchar](255) NULL,
	[image_url] [varchar](255) NULL,
	[feedback_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_images]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_images](
	[image_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[url] [ntext] NULL,
	[description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_sub_categories]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_sub_categories](
	[sub_category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](100) NULL,
	[description] [varchar](255) NULL,
	[status] [int] NULL,
	[category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[sub_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[sub_category_id] [int] NULL,
	[unit_in_stock] [int] NULL,
	[updated_date] [datetime] NULL,
	[original_price] [money] NULL,
	[sale_price] [money] NULL,
	[product_details] [ntext] NULL,
	[featured] [bit] NULL,
	[status] [int] NULL,
	[brief_infor] [nvarchar](255) NULL,
	[thumbnail] [ntext] NULL,
	[model] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[screens]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[screens](
	[screen_id] [int] NOT NULL,
	[screen_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[screen_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[settings]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[settings](
	[setting_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](31) NULL,
	[description] [ntext] NULL,
	[type] [varchar](50) NULL,
	[value] [varchar](50) NULL,
	[order] [varchar](50) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[setting_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sliders]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sliders](
	[slider_id] [int] IDENTITY(1,1) NOT NULL,
	[slider_image] [text] NULL,
	[title] [nvarchar](250) NULL,
	[slider_link] [text] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[slider_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tag_post]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tag_post](
	[tag_id] [int] NULL,
	[post_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tags]    Script Date: 6/29/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tags](
	[tag_id] [int] IDENTITY(1,1) NOT NULL,
	[tag_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[accounts] ON 

INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (1, N'phuong', N'a10bb50010e0d2bc501fd7a70ba65779', N'Nguyễn Lý Duy Phương', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-06-10T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (2, N'phuong2', N'a10bb50010e0d2bc501fd7a70ba65779', N'Duy Phuong', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-06-10T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3, N'quangtv', N'1bbd886460827015e5d605ed44252251', N'Quang', 2, 0, N'qtran9587@gmail.com', N'Vĩnh Phúc', N'Việt Nam', N'Bá Hiến, Bình Xuyên', N'0395073662', N'images\account-images\70059505_p0_master1200.jpg', 1, N'1', 1, CAST(N'2022-06-13T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (4, N'dungba', N'96e79218965eb72c92a549dd5a330112', N'Bùi Anh Dũng', 1, 1, N'dungbahe150633@fpt.edu.vn', N'Hải Phòng', N'Việt Nam', N'Đại học FPT Hà Nội', N'0783332391', NULL, 1, N'1', NULL, CAST(N'2022-06-13T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (5, N'toanpv', N'96e79218965eb72c92a549dd5a330112', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3021, N'toanpv1', N'1bbd886460827015e5d605ed44252251', N'Phạm Văn Toàn', 2, 1, N'toanpv224@gmail.com', NULL, NULL, N'Lưu Xá - Đức Giang - Hoài Đức - Hà Nội', N'0978415744', NULL, 1, N'1', 1, CAST(N'2022-06-15T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3022, N'abc2', N'1bbd886460827015e5d605ed44252251', N'Phạm Toàn', 3, 1, N'tretrau224@gmail.com', NULL, NULL, N'Lưu Xá - Đức Giang - Hoài Đức - Hà Nội', N'0978415744', NULL, 0, N'1', 1, CAST(N'2022-06-16T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3023, N'sale', N'96e79218965eb72c92a549dd5a330112', N'Trần Văn Quang', 3, 1, N'quang@gmail.com', N'Vĩnh Phúc', N'Việt Nam', N'Bá Hiến, Bình Xuyên', N'0395073662', N'images/account-images/acc.png', 1, N'1', 1, CAST(N'2022-06-15T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3024, N'sale1', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3025, N'sale2', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang2@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3026, N'sale3', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang3@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-16T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3027, N'sale4', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang4@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-15T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3028, N'sale5', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang5@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-16T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3029, N'sale6', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang6@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-15T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3030, N'sale7', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang7@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-15T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3031, N'sale8', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang8@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-16T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3032, N'sale9', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang9@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-15T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3033, N'sale10', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang10@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-15T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3034, N'sale11', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang11@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3035, N'sale12', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang12@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-13T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3036, N'sale13', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang13@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-15T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3037, N'sale14', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang14@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-13T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3038, N'sale15', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang15@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-13T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3039, N'sale16', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang16@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-15T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3040, N'sale17', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang17@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-12T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3041, N'sale18', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang18@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-15T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3042, N'sale19', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang19@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-12T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3043, N'sale20', N'9131a94c91f691579a253c38ccdd7216', N'Trần Văn Quang', 3, 1, N'quang20@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-15T11:04:18.790' AS DateTime))
INSERT [dbo].[accounts] ([user_id], [username], [password], [full_name], [role_id], [gender], [email], [city], [country], [address], [phone], [image_url], [featured], [hash], [active], [registered_date]) VALUES (3044, N'sale21', N'25d55ad283aa400af464c76d713c07ad', N'Bùi Anh Dũng', 3, 1, N'drubypjnk@gmail.com', N'(Nah)', N'(Nah)', N'An Dương', N'0128 333 2391', N'images\account-images\acc.png', 0, N'4150b2f0aa6dc1676d40a7f8896dc5d1', 1, CAST(N'2022-06-28T13:57:48.040' AS DateTime))
SET IDENTITY_INSERT [dbo].[accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[general_feedbacks] ON 

INSERT [dbo].[general_feedbacks] ([feedback_id], [star], [feedbacks_content], [full_name], [phone], [gender], [email], [image_url], [feedback_date]) VALUES (1, 4, N'ttt', N'Pháº¡m VÄn ToÃ n', N'0978415744', 0, N'tretrau224@gmail.com', N'', CAST(N'2022-06-12T18:20:20.190' AS DateTime))
SET IDENTITY_INSERT [dbo].[general_feedbacks] OFF
GO
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (1, 7, 1, 28990000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (2, 7, 1, 28990000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (3, 7, 1, 28990000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (4, 7, 1, 28990000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (5, 7, 1, 28990000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (6, 5, 1, 31490000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (6, 12, 1, 344000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (7, 22, 1, 480000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (8, 6, 1, 18990000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (8, 7, 10, 28990000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (9, 3, 1, 13390000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (10, 4, 1, 36990000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (11, 11, 1, 344000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (11, 16, 1, 220000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (12, 9, 1, 39990000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (12, 21, 1, 5900000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (12, 24, 1, 500000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (13, 8, 1, 72990000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (14, 6, 10, 18990000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (15, 13, 1, 290000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (16, 6, 1, 18990000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (17, 6, 1, 18990000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (17, 10, 1, 42890000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (18, 11, 1, 344000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (19, 13, 1, 290000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (20, 3, 1, 13390000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (20, 14, 1, 555000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (21, 3, 2, 13390000.0000)
INSERT [dbo].[order_details] ([order_id], [product_id], [quantity], [price]) VALUES (21, 12, 2, 344000.0000)
GO
SET IDENTITY_INSERT [dbo].[order_status] ON 

INSERT [dbo].[order_status] ([id], [description]) VALUES (1, N'Submitted')
INSERT [dbo].[order_status] ([id], [description]) VALUES (2, N'Order information confirmation')
INSERT [dbo].[order_status] ([id], [description]) VALUES (3, N'Active')
INSERT [dbo].[order_status] ([id], [description]) VALUES (4, N'Transporting')
INSERT [dbo].[order_status] ([id], [description]) VALUES (5, N'Finished')
INSERT [dbo].[order_status] ([id], [description]) VALUES (6, N'Cancel')
SET IDENTITY_INSERT [dbo].[order_status] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (1, 1, CAST(N'2022-06-28T15:30:02.443' AS DateTime), NULL, NULL, NULL, 20000.0000, NULL, N'Đ?i H?c FPT-Hà N?i', NULL, N'0783332391', N'phuong@gmail.com', NULL, 5, NULL, 28990000.0000, N'VN PAY')
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (2, 2, CAST(N'2022-06-22T15:30:02.443' AS DateTime), NULL, NULL, NULL, 20000.0000, NULL, N'Đ?i H?c FPT-Hà N?i', NULL, N'0783332391', N'phuong2@gmail.com', NULL, 5, NULL, 28990000.0000, N'Ship COD')
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (3, 3, CAST(N'2022-06-23T15:30:02.443' AS DateTime), NULL, NULL, NULL, 20000.0000, NULL, N'Đ?i H?c FPT-Hà N?i', NULL, N'0783332391', N'quang@gmail.com', NULL, 5, NULL, 28990000.0000, N'Ship COD')
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (4, 4, CAST(N'2022-06-23T15:30:02.443' AS DateTime), NULL, NULL, NULL, 20000.0000, NULL, N'Đ?i H?c FPT-Hà N?i', NULL, N'0783332391', N'dung@gmail.com', NULL, 5, NULL, 28990000.0000, N'BANK TRANSFER')
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (5, 5, CAST(N'2022-06-24T15:30:02.443' AS DateTime), NULL, NULL, NULL, 20000.0000, NULL, N'Đ?i H?c FPT-Hà N?i', NULL, N'0783332391', N'toan@gmail.com', NULL, 5, NULL, 28990000.0000, N'BANK TRANSFER')
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (6, 3, CAST(N'2022-06-24T15:30:02.443' AS DateTime), NULL, NULL, NULL, 0.0000, N'Trần Văn Quang', N'Bá Hiến, Bình Xuyên', 1, N'0395073662', N'qtran9587@gmail.com', N'Vĩnh Phúc', 5, NULL, 31834000.0000, N'Ship COD')
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (7, 3, CAST(N'2022-06-24T15:30:02.443' AS DateTime), NULL, NULL, NULL, 100000.0000, N'quannggggggggg', N'Bá Hiến, Bình Xuyên', 1, N'0395073662', N'qtran9587@gmail.com', N'Vĩnh Phúc', 6, N'', 580000.0000, N'VN PAY')
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (8, 3, CAST(N'2022-06-26T15:30:02.443' AS DateTime), NULL, NULL, NULL, 0.0000, N'Trần Văn Quang', N'Bá Hiến, Bình Xuyên', 1, N'0395073662', N'qtran9587@gmail.com', N'Vĩnh Phúc', 5, NULL, 308890000.0000, N'Ship COD')
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (9, 3, CAST(N'2022-06-26T15:30:02.443' AS DateTime), NULL, NULL, NULL, 0.0000, N'Trần Văn Quang', N'Bá Hiến, Bình Xuyên', 1, N'0395073662', N'qtran9587@gmail.com', N'Vĩnh Phúc', 4, N'', 13390000.0000, N'BANK TRANSFER')
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (10, 3, CAST(N'2022-06-26T15:30:02.443' AS DateTime), NULL, NULL, NULL, 0.0000, N'Trần Văn Quang', N'Bá Hiến, Bình Xuyên', 1, N'0395073662', N'qtran9587@gmail.com', N'Vĩnh Phúc', 4, N'', 36990000.0000, N'BANK TRANSFER')
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (11, 3, CAST(N'2022-06-26T15:30:02.443' AS DateTime), NULL, NULL, NULL, 100000.0000, N'Trần Văn Quang', N'Bá Hiến, Bình Xuyên', 1, N'0395073662', N'qtran9587@gmail.com', N'Vĩnh Phúc', 4, N'', 664000.0000, N'Ship COD')
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (12, 3, CAST(N'2022-06-27T15:30:02.443' AS DateTime), NULL, NULL, NULL, 0.0000, N'Trần Văn Quang', N'Bá Hiến, Bình Xuyên', 1, N'0395073662', N'qtran9587@gmail.com', N'Vĩnh Phúc', 3, N'', 46390000.0000, N'Ship COD')
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (13, 3, CAST(N'2022-06-26T15:30:02.443' AS DateTime), NULL, NULL, NULL, 0.0000, N'Trần Văn Quang', N'Bá Hiến, Bình Xuyên', 1, N'0395073662', N'qtran9587@gmail.com', N'Vĩnh Phúc', 2, N'', 72990000.0000, N'Ship COD')
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (14, 3, CAST(N'2022-06-25T15:30:02.443' AS DateTime), NULL, NULL, NULL, 0.0000, N'Trần Văn Quang', N'Bá Hiến, Bình Xuyên', 1, N'0395073662', N'qtran9587@gmail.com', N'Vĩnh Phúc', 4, N'', 189900000.0000, N'VN PAY')
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (15, 3, CAST(N'2022-06-26T15:30:02.443' AS DateTime), NULL, NULL, NULL, 100000.0000, N'Trần Văn Quang', N'Bá Hiến, Bình Xuyên', 1, N'0395073662', N'qtran9587@gmail.com', N'Vĩnh Phúc', 5, N'', 390000.0000, N'VN PAY')
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (16, 3, CAST(N'2022-06-26T15:30:02.443' AS DateTime), NULL, NULL, NULL, 0.0000, N'Trần Văn Quang', N'Bá Hiến, Bình Xuyên', 1, N'0395073662', N'qtran9587@gmail.com', N'Vĩnh Phúc', 6, N'', 18990000.0000, N'VN PAY')
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (17, 3, CAST(N'2022-06-26T15:30:02.443' AS DateTime), NULL, NULL, NULL, 0.0000, N'trần văn quang', N'hà nội', 0, N'0395073662', N'qtran9587@gmail.com', N'Vĩnh Phúc', 6, N'', 61880000.0000, N'BANK TRANSFER')
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (18, 3, CAST(N'2022-06-27T15:30:02.443' AS DateTime), NULL, NULL, NULL, 100000.0000, N'Quang', N'ha noi', 0, N'0395073662', N'qtran9587@gmail.com', N'Vĩnh Phúc', 2, N'18', 444000.0000, N'Ship COD')
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (19, 3, CAST(N'2022-06-27T15:30:02.443' AS DateTime), NULL, NULL, NULL, 100000.0000, N'Quang', N'Bá Hiến, Bình Xuyên', 0, N'0395073662', N'qtran9587@gmail.com', N'Vĩnh Phúc', 3, N'19', 390000.0000, NULL)
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (20, 3, CAST(N'2022-06-27T15:30:02.443' AS DateTime), NULL, NULL, NULL, 0.0000, N'Quang', N'Bá Hiến, Bình Xuyên', 0, N'0395073662', N'qtran9587@gmail.com', N'Vĩnh Phúc', 4, N'', 13945000.0000, NULL)
INSERT [dbo].[orders] ([order_id], [user_id], [order_date], [require_date], [shipped_date], [ship_via], [freight], [ship_name], [ship_address], [ship_gender], [ship_mobile], [ship_email], [ship_city], [status], [note], [total_price], [payment]) VALUES (21, 3, CAST(N'2022-06-28T15:30:02.443' AS DateTime), NULL, NULL, NULL, 0.0000, N'Quang', N'Bá Hiến, Bình Xuyên', 0, N'0395073662', N'qtran9587@gmail.com', N'Vĩnh Phúc', 5, N'123
                                    ', 27468000.0000, N'BANK TRANSFER')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (1, 3024)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (2, 3025)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (3, 3026)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (4, 3027)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (5, 3028)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (6, 3024)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (7, 3024)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (8, 3024)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (9, 3024)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (10, 3024)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (11, 3025)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (12, 3025)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (13, 3025)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (14, 3025)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (15, 3026)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (16, 3026)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (17, 3026)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (18, 3027)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (19, 3028)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (20, 3029)
INSERT [dbo].[orders_management] ([order_id], [user_id]) VALUES (21, 3024)
GO
SET IDENTITY_INSERT [dbo].[post_categories] ON 

INSERT [dbo].[post_categories] ([category_id], [category_name], [description], [status]) VALUES (1, N'Review', N'this is news about technology', 1)
INSERT [dbo].[post_categories] ([category_id], [category_name], [description], [status]) VALUES (2, N'News', N'this is news', 1)
INSERT [dbo].[post_categories] ([category_id], [category_name], [description], [status]) VALUES (3, N'Choose Laptop', NULL, 1)
INSERT [dbo].[post_categories] ([category_id], [category_name], [description], [status]) VALUES (4, N'cat', N'ok', NULL)
SET IDENTITY_INSERT [dbo].[post_categories] OFF
GO
SET IDENTITY_INSERT [dbo].[post_sub_categories] ON 

INSERT [dbo].[post_sub_categories] ([id], [category_id], [name], [description], [feature]) VALUES (1, 1, N'Review', N'Review product', 1)
INSERT [dbo].[post_sub_categories] ([id], [category_id], [name], [description], [feature]) VALUES (2, 1, N'Event', N'Event for product technology', 1)
INSERT [dbo].[post_sub_categories] ([id], [category_id], [name], [description], [feature]) VALUES (3, 2, N'Event ', N'Event for sience', 1)
INSERT [dbo].[post_sub_categories] ([id], [category_id], [name], [description], [feature]) VALUES (4, 2, N'Stories', N'Stories around sience', 1)
SET IDENTITY_INSERT [dbo].[post_sub_categories] OFF
GO
SET IDENTITY_INSERT [dbo].[posts] ON 

INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (1, 1, N'Đánh giá chi tiết ASUS ZenBook Q409ZA: Rất đáng trông đợi, dù chưa hoàn hảo', N'https://media-api-beta.thinkpro.vn/media/social/articles/2022/6/16/danh-gia-zenbook-q409za-thinkpro.jpg', CAST(N'2022-05-25T01:19:24.863' AS DateTime), N'<p>Với việc có được những sản phẩm chất lượng tốt trong thời gian gần đây, ZenBook dòng Q đang là một trong những series được tìm mua nhiều nhất của ASUS ở phân khúc văn phòng giá rẻ - tầm trung. Với ngoại hình có giá trị vượt thời gian, màn hình ổn, cấu hình có card rời cùng thời lượng sử dụng lâu dài; thật khó để người dùng tìm ra lý do để từ chối - nhất là khi mức giá của chúng chỉ rơi vào khoảng 20 triệu Đồng. Thông qua ASUS ZenBook Q409ZA, rõ ràng thương hiệu Đài Loan sẽ muốn nối dài thành công đang có, và ngay từ cái nhìn đầu tiên với sản phẩm này thì có thể thấy rằng: Hãng đang muốn làm điều đó một cách tốt nhất.</p><p>Được lột xác mạnh mẽ ở nhiều mặt, sản phẩm này thực sự khá khó để chối từ - đặc biệt khi giá bán chính thức của nó gần như không thay đổi so với Q408IQ đi trước. Mặc dù vẫn còn những điểm rất cần được khắc phục nhưng về tổng thể, đây vẫn là một mẫu máy hấp dẫn, là bước ngoặt cần thiết mà ZenBook dòng Q nên có để trở thành dòng ultrabook phù hợp với nhu cầu thời đại.</p><h5 class="paragraph-heading">Thiết kế - “Đặc biệt thế này thì chỉ có ZenBook thôi.”</h5><p>Còn nhớ cách đây vài năm, cụ thể là 2019 nếu người viết không nhầm, ASUS đã cho ra mắt một phiên bản ZenBook đặc biệt kỉ niệm 50 năm với vẻ ngoài độc đáo. Giờ đây, thiết kế ấy đã được đem lên Q409ZA, khiến cho sản phẩm này trở nên cực kỳ khác biệt với các thế hệ đi trước. Toàn thân máy được phủ một lớp sơn Xanh Đen nhám nhẹ - theo ASUS thì tên gọi của nó là Ponder Blue, đi kèm với họa tiết chữ A cách điệu giống ba cánh của ngôi sao - có điều không được mạ vàng như bản đặc biệt.</p><p>Dòng chữ ASUS nay đã được đưa xuống góc trái dưới của nắp máy nếu nhìn trực diện, và nay đã đi kèm cả chữ ZenBook - như một lời khẳng định rằng “Đặc biệt thế này thì chỉ có ZenBook mà thôi.” Gần đó, chúng ta còn có họa tiết vòng tròn đồng tâm tinh tế ở đầu bản lề, gợi nhớ một chút tới các đời máy trước là Q407 và Q408.</p><p>Khám phá sâu hơn thì người viết nhận ra, thiết kế này cũng là để đánh dấu cho nhiều điều đặc biệt sau đó trên ASUS ZenBook Q409ZA. Tuy nhiên hãy cứ để chúng sang phần sau bài viết đã nhé, còn nhiều điều để nói về bộ vỏ này lắm.</p><p>Về phần nhìn, ASUS đã làm rất tốt với Q409ZA, nhưng độ hoàn thiện thì lại chưa đạt tới mức độ tương tự. Vỏ máy khi cầm nắm hay đóng mở phát ra khá nhiều tiếng cọt kẹt, tương tự như trên đời máy đi trước là Q407. Đồng ý là với mức giá chỉ khoảng 21 - 22 triệu Đồng, có những thứ mà người dùng sẽ cần đánh đổi, nhưng riêng điểm này thì người viết thì thấy “hẫng” và hơi khó để chấp nhận.</p><p>Mặc dù vậy, khá là may mắn khi hiện tượng này không mấy ảnh hưởng tới sản phẩm trong quá trình thao tác. Khi gõ phím, dùng bàn di thì người viết ít thấy hơn tiếng cọt kẹt, bề mặt chiếu nghỉ cũng không bị võng xuống hay gặp vấn đề gì tương tự.</p><p>Một điểm đáng chú ý khác ở phần vỏ của Q409ZA đó là vị trí đặt khe thoát nhiệt, khi nó đã được dịch sang cạnh trái thay vì để thổi thẳng vào màn hình. Đây cũng là điều chỉnh dễ hiểu vì màn hình của máy nay đã là màn OLED, để nhiệt được phả thẳng vào sẽ dẫn đến tuổi thọ giảm sút, đi kèm nguy cơ hỏng cũng tăng lên.</p><p>Bản lề của máy thì vẫn sẽ được làm dạng ErgoLift - mở ra sẽ đẩy nhẹ thân máy nghiêng một góc để tối ưu trải nghiệm gõ phím. Tuy nhiên có vẻ góc nâng của ASUS ZenBook Q409ZA không còn cao như trước, nên là ảnh hưởng của nó tới quá trình sử dụng thực tế cũng tỏ ra không nhiều.</p><p>Tổng thể phần vỏ này vẫn giữ được đặc trưng mỏng nhẹ vốn có với độ dày 16.9mm và cân năng vỏn vẹn 1.3kg. Cảm giác mang vác máy trên tay hay trong balo với người viết là vẫn ổn, nhẹ nhàng, chỉ là những tiếng cọt kẹt như đã nói thỉnh thoảng khiến mọi thứ hơi “gợn” mà thôi.</p><p>Nhìn chung về thiết kế, việc được thay đổi mạnh mẽ đã khiến ASUS ZenBook Q409ZA để lại nhiều ấn tượng. Tuy nhiên với người viết, hãng vẫn nên khiến những yếu tố khác của nó như độ bền có chất lượng tương xứng hơn.</p><h5 class="paragraph-heading">Cổng kết nối - Không quá nhiều</h5><p>Về cổng kết nối, ASUS ZenBook Q409ZA sẽ có duy nhất một cổng USB-A 3.2 Gen2 ở cạnh trái, còn lại thì đó sẽ là 2 cổng Thunderbolt™ 4 hỗ trợ xuất hình và sạc, cổng HDMI 2.0b, khe thẻ microSD và jack tai nghe 3.5mm combo ở cạnh phải - nhìn chung là không quá nhiều, đúng với đặc trưng của các sản phẩm ZenBook.</p><p>Việc được đặt về tay phải đôi lúc sẽ khiến các cổng này hơi khó dùng và vướng víu, nhất là khi cần cắm sạc cho máy còn bạn thì đang cần dùng chuột rời. Tuy nhiên thì ít nhất, cảm giác này cũng đỡ bất tiện hơn so với việc bị phả hơi nóng từ khe tản nhiệt - thứ đã được rời sang bên cạnh trái.</p><h5 class="paragraph-heading">Màn hình - Đã mắt với OLED tần số quét cao</h5><p>Màn hình sẽ là một trong những điểm đáng chú ý nhất trên ASUS ZenBook Q409ZA, với sự xuất hiện của tấm nền OLED, độ phân giải lên tới 2.8K (2880 x 1800) cùng tỉ lệ 16:10 tối ưu trải nghiệm nhìn theo chiều dọc. Dường như một năm vừa qua là thời điểm ASUS quyết tâm biến OLED trở thành điểm mạnh đặc trưng, khi từ VivoBook, VivoBook Pro,... và giờ là ZenBook dòng Q cũng đã được trang bị tấm nền này.</p><p>Về trải nghiệm thị giác thì tương tự nhiều sản phẩm có ASUS OLED, hình ảnh hiện ra trên Q409ZA vẫn rực rỡ, sống động nhờ tương phản màu sắc rất cao. Ngoài ra thì độ phân giải 2.8K cũng khiến mọi thứ sắc nét, phù hợp với nhu cầu giải trí chất lượng cao - với việc các nội dung như phim ảnh, video,... giờ đang dần được sản xuất thường xuyên hơn ở 4K.</p><p>Về chất lượng màu sắc, người viết có sử dụng công cụ SpyderX Elite để đo thì ngay từ chế độ mặc định, chúng ta đã có được dải màu rất ấn tượng với 100% sRGB, 95% AdobeRGB, 100% DCI-P3 cùng độ sai lệch màu DeltaE là 1.41. Bên trong phần mềm MyASUS cũng có vài chế độ màu khác để người dùng thay đổi tùy theo nội dung đang xem, nhưng cá nhân người viết thì chế độ có sẵn đã là rất đủ - xem phim hay chỉnh ảnh cũng đều tốt, nếu muốn ổn hơn nữa thì có thể cân lại màu bằng thiết bị chuyên dụng.</p><p>Một điểm nhỏ đáng nói nữa ở màn hình này sẽ là về tần số quét, khi nó đã được ASUS nâng cấp lên 90Hz thay vì 60 như thường lệ. Điều này khiến cho trải nghiệm di chuột, cuộn trang hay thậm chí là chơi game của trên máy được mượt mà hơn; đồng thời cũng giúp nó đuổi kịp xu thế 90Hz của ultrabook tầm trung hiện nay.</p><p>Viền màn hình của Q409ZA gần như vẫn vậy, mỏng nhất ở hai cạnh bên và hơi dày hơn chút ở trên dưới. Với việc góc nâng của bản lề ErgoLift không còn cao như trước, viền dưới của máy đã bị hở ra nhiều hơn, không còn được che bớt một cách khéo léo nữa. Mặc dù vậy, những điểm tích cực của màn hình này vẫn là đủ để người viết bỏ qua điểm trừ này.</p><p>Phía viền trên của máy, chúng ta sẽ có được cụm webcam với độ phân giải HD để phục vụ đàm thoại online. Cảm biến nhận diện khuôn mặt Windows Hello sẽ không còn xuất hiện - một điều tương đối đáng tiếc vì người viết vẫn thấy nó rất tiện. Thay vào đó, người dùng sẽ sử dụng cảm biến vân tay được đặt dưới bàn phím để mở khóa máy.</p><h5 class="paragraph-heading">Bàn phím và touchpad - Rộng rãi, đủ dùng</h5><p>ASUS ZenBook Q409ZA vẫn sẽ có cụm phím với keycap to, font chữ mảnh nhưng lớn đặc trưng của hãng, được đi kèm đèn nền để tiện sử dụng khi thiếu sáng. Cảm giác gõ không có gì nổi trội nhưng đủ thoải mái với nhiều tác vụ, riêng các phím điều hướng thì làm khá nhỏ nên ngón tay to như của người viết sẽ hơi dễ ấn nhầm. Hiện tượng ọp ẹp như đã nói lại diễn ra rất ít ở đây, khiến việc sử dụng của người viết cũng được thuận tiện hơn. Tuy nhiên hơi tiếc, chiếu nghỉ của máy lại không được như vậy khi đặt tay lên.</p><p>Điểm đáng chú ý nhất ở cụm phím này sẽ là việc nút nguồn kiêm cảm biến vân tay đã được đặt lùi vào trong một chút, đồng thời được viền lại màu bạc xung quanh để dễ nhận biết. Tốc độ nhận diện của cảm biến này khá nhanh, cảm giác nhấn và bề mặt cũng khác so với những phím cùng hàng nên người viết làm quen rất nhanh.</p><p>Touchpad của Q409ZA có kích thước khá lớn về chiều ngang, thuận tiện để sử dụng đặc biệt là với những thao tác vuốt nhiều ngón. Bề mặt của nó vẫn được phủ kính để cho ra cảm giác chạm tuyệt vời. Tương tự như các sản phẩm ZenBook dòng Q trước đó, chúng ta cũng sẽ có ở đây cụm phím số ảo tích hợp - hay NumberPad.</p><p>Việc sử dụng đến nó hay không cũng còn tuỳ người, tuy nhiên vấn đề của người viết lại nằm ở nút bật tính năng này - chưa cần ấn mà chạm nhẹ ức tay thôi là đã bật lên rồi. Để tránh hiện tượng kể trên, bạn đọc có thể tắt hẳn NumberPad đi ở trong phần mềm MyASUS.</p><h5 class="paragraph-heading">Hiệu năng - Không cần card NVIDIA để tỏa sáng</h5><p>Hiệu năng cũng là một điểm đáng bàn trên ASUS ZenBook Q409ZA, khi sản phẩm này đã được nâng cấp về cấu hình với những linh kiện mới nhất hiện nay. Tâm điểm của hệ thống trên Q409ZA sẽ là vi xử lý Intel Alder Lake Core i5-1240P 12 nhân 16 luồng, đi kèm với đó là 8GB RAM LPDDR5 chạy Quad-channel, 256GB SSD NVMe cùng card đồ hoạ Intel Iris Xe Graphics - không có card rời của NVIDIA như trên Q408 hay Q407.</p><p>Với con chip được cải tiến từ kiến trúc nhân, tiến trình, giới hạn điện và cơ chế hoạt động so với thế hệ tiền nhiệm; i5-1240P thậm chí còn có thể mạnh hơn cả một số con chip Tiger Lake-H hiệu năng cao. Cụ thể hơn thì với người viết, đó sẽ là những tuỳ chọn mà chúng ta từng gọi với cái tên “Intel-H35”: i5-11300H, i7-11370H hay i7-11375H.</p><p>Với những cái tên kể trên, chúng đêu thua xa i5-1240P ở những yếu tố quyết định tới sức mạnh như nhân luồng (4/8 so với 12/16) hay điện năng tiêu thụ (28-35W so với 20-64W). Chính vì vậy nên nếu cần làm các tác vụ nặng hay chơi những tựa game thiên về CPU, con chip này hứa hẹn vẫn sẽ hoàn thành một cách tương đối trơn tru.</p><p>Quá trình sử dụng máy của người viết gần như không gặp phải nhiều vấn đề. Q409ZA giải quyết ổn nhu cầu chỉnh sửa và render ảnh RAW bằng Lightroom Classic, ngoài ra còn hoạt động tạm ổn khi phải chạy một vài tựa game thiên về CPU như VALORANT.</p><p>Về card đồ hoạ Intel Iris Xe Graphics trên i5-1240P, nó vẫn sẽ có số đơn vị xử lý và xung nhịp tương tự như trên CPU thế hệ trước. Sức mạnh của nó đúng là khó thể so bì với NVIDIA MX, nhưng với những gì mà chúng ta nên làm trên một chiếc máy mỏng nhẹ như Q409ZA (Chỉnh sửa hình ảnh, video, chơi game Esports nếu cần, v.v.) thì nó vẫn có thể đảm đương ở mức ổn.</p><p>Nhìn chung, với những tác vụ mà các sản phẩm ZenBook Q đi trước thường được người dùng thực hiện, cấu hình thế hệ mới của Q409ZA sẽ còn làm tốt và tối ưu hơn. Có điều nếu chạy nặng thì máy sẽ nóng lên nhanh chóng, với CPU có thể lên tới 90 - 95 độ C và bề mặt máy cũng phả chút nhiệt, người dùng nên lưu ý để tránh lạm dụng dẫn tới giảm tuổi thọ sản phẩm.</p><p>Ngoài ra RAM của Q409ZA cũng là RAM hàn chết, vậy nên chúng ta sẽ chỉ có dung lượng tối đa là 8GB và không thể nâng cấp. Với việc con chip trên máy đã là chip thế hệ 12, đây cũng là một điểm trừ vì phần cứng thế hệ mới hoạt động rất ngốn RAM, có thể ảnh hưởng tới hiệu năng ở một số tác vụ.</p><p>Dưới đây là những thông số mà người viết thu thập được từ ASUS ZenBook Q409ZA. Bạn đọc có thể sử dụng để đối chiếu hoặc so sánh nếu cần.</p><h5 class="paragraph-heading">Âm thanh - Đáng đồng tiền</h5><p>Thông thường, người viết rất ít khi dành riêng một phần để đánh giá loa laptop, nhưng hệ thống âm thanh trên ASUS ZenBook Q409ZA sẽ là trường hợp ngoại lệ vì chất lượng tương đối thuyết phục. Với hai loa lớn ở đáy và được tinh chỉnh bởi Harman Kardon như thường lệ, máy cho ra âm lượng tối đa rất lớn khi nghe nhạc, xem phim,... có thể lấp đầy một phòng làm việc cỡ vừa.</p><p>Điểm đặc biệt là âm thanh lúc này gần như không bị vỡ vụn, bass vẫn hơi tròn và mid vẫn cảm thấy được. So với phần đông laptop cùng tầm giá 20 triệu Đồng thì chất lượng thế này đã là rất tốt rồi.</p><h5 class="paragraph-heading">Pin - Thỏa mãn nguyên ngày là có thể</h5><p>Về thời lượng pin thì người viết cũng đã kỳ vọng nhiều ở ASUS ZenBook Q409ZA, với việc máy sở hữu viên pin lên đến 75Wh và đạt chuẩn Intel EVO - đảm bảo thời lượng pin cực kỳ lâu bền. Và khi được thử nghiệm thực tế thì máy bước đầu đã không khiến mình thất vọng, khi có tới 6.5h on-screen với độ sáng màn hình tối đa, chế độ Balanced và được dùng để xem livestream, gõ bài, chat qua Discord, v.v.</p><p>Dựa vào kết quả trên thì chúng ta có thể suy ra hơn, máy hoàn toàn có thể trụ được lâu hơn nếu được can thiệp ở một vài yếu tố khác nữa (Giảm độ sáng màn hình, chỉnh chế độ pin xuống Best Battery Life, v.v.) Nhìn chung thì tiếp tục “truyền thống” của ZenBook dòng Q, Q409ZA vẫn sẽ là một lựa chọn tốt nếu bạn đang tìm kiếm một sản phẩm đủ dùng cho cả ngày dài.</p>', 0, N'Thông qua ASUS ZenBook Q409ZA, rõ ràng thương hiệu Đài Loan sẽ muốn nối dài thành công đang có, và ngay từ cái nhìn đầu tiên với sản phẩm này thì có thể thấy rằng: Hãng đang muốn làm điều đó một cách tốt nhất.', CAST(N'2022-05-25T01:19:24.863' AS DateTime), 1)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (2, 2, N'Giải mã sức mạnh của ASUS ROG Flow X13: Xứng danh Ultrabook 13-inch mạnh nhất thế giới?', N'https://media-api-beta.thinkpro.vn/media/social/articles/2022/6/13/h732%20(3).png', CAST(N'2022-05-25T01:20:51.563' AS DateTime), N'<p>Kể từ ngày đầu ra mắt tới nay, ASUS ROG Flow X13 vẫn được mệnh danh là một trong những mẫu laptop 13-inch mạnh mẽ nhất thế giới. Cũng dễ hiểu thôi vì khi đã hướng tới tập khách hàng “đói” hiệu năng (Game thủ, người dùng multimedia chuyên sâu, v.v.) - một điều rất hiếm thấy ở ultrabook, sản phẩm này sẽ càn phải có những trang bị tốt nhất để đáp ứng nhu cầu. Vậy rốt cuộc, cội nguồn sức mạnh của ASUS ROG Flow X13 tới từ đâu, có đáng để bạn chi tiền? Hãy cùng tìm hiểu với ThinkPro qua bài viết dưới đây nhé.</p><h5 class="paragraph-heading">Phần cứng mạnh mẽ hàng đầu trên ultrabook</h5><p>Nếu chúng ta định nghĩa ultrabook đúng như Intel đã làm (Laptop cao cấp, siêu mỏng nhẹ), thì không sai khi nói rằng ASUS ROG Flow X13 là chiếc ultrabook với cấu hình mạnh mẽ nhất. Với thế hệ thứ hai của sản phẩm được bán chính hãng tại Việt Nam, chúng ta sẽ có APU AMD Ryzen 7 6800HS 8 nhân 16 luồng, card đồ họa rời NVIDIA GeForce RTX 3050 4GB, 8GB RAM LPDDR5 chạy kênh đôi cùng 512GB SSD PCIe 4.0.</p><p>Trên thực tế, máy vẫn còn một tùy chọn khác mạnh hơn với APU Ryzen 9 6900HS và RTX 3050Ti, tuy nhiên chưa có thông tin về việc nó sẽ được phân phối tại thị trường nước ta. Tuy nhiên, nhiêu đó phần cứng bên trên cũng đã rất mạnh rồi, xét tới việc chúng đã hỗ trợ nhiều công nghệ hơn và được xây dựng trên các nền tảng mới nhất.</p><h5 class="paragraph-heading">CPU AMD Ryzen 7 5800HS</h5><p>So với thế hệ tiền nhiệm là AMD Ryzen 7 5800HS, AMD Ryzen 7 6800HS có thể được xem là một phiên bản tăng xung và có tiến trình mới hơn. Sự cải thiện song song này hứa hẹn sẽ gúp ASUS ROG Flow X13 tốt hơn về thời lượng pin, trong khi vẫn đem lại hiệu năng đáng nể ở các tác vụ nặng thiên về CPU (Render ảnh, video, chơi game FPS, v.v.)</p><p>Kiến trúc nhân Zen 3+ có thể sẽ chưa đem lại khác biệt quá lớn so với Zen 3 tiền nhiệm, nhưng kết hợp cùng tiến trình 6nm TSMC thì cũng có thể giúp AMD Ryzen 7 6800HS sử dụng năng lượng hiệu quả hơn, dẫn tới kéo dài tuổi thọ pin - điều tối quan trọng với sản phẩm xoay gập 2-trong-1 như ASUS ROG Flow X13.</p><p>Tuy nhiên, điều mà người viết cảm thấy thú vị hơn ở những APU như 6800HS sẽ là kiến trúc nhân đồ họa RDNA 2, giúp iGPU đi kèm (ở đây là Radeon 680M) có được sức mạnh dẫn đầu thị trường. Nhờ vậy nên ngay cả khi phải dùng tới tính năng Optimus (để iGPU hoạt động thay), Flow X13 vẫn sẽ có được hiệu năng không hề tệ ở nhiều tác vụ.</p><h5 class="paragraph-heading">Card rời RTX 3050 4GB</h5><p>Về card đồ họa rời, NVIDIA GeForce RTX 3050 4GB cũng không còn là cái tên quá xa lạ. Mặc dù TGP của nó chỉ dừng ở 40W (35W + 5W), tuy nhiên hiệu năng cho ra vẫn sẽ vượt xa các mẫu card rời thường thấy trên ultrabook cùng kích thước. Về RTX 3050 4GB 40W, ThinkPro cũng đã có thử nghiệm trên một sản phẩm gần với Flow X13 là Flow Z13. Chi tiết hơn, mời bạn đọc tham khảo bài viết phía dưới.</p><p>So với thế hệ Flow X13 đầu tiên sử dụng GTX 1650, việc nâng cấp card rời lên RTX 3050 đã là bước tiến lớn. Không chỉ giúp máy xử lý đồ họa tốt hơn, card RTX còn giúp người chơi trải nghiệm các tính năng hiện đại như Ray Tracing - miễn là game được chơi kèm với các thuật toán như DLSS 2.0 và FSR để đảm bảo mức khung hình ổn định.</p><h5 class="paragraph-heading">Bứt phá giới hạn với XG Mobile</h5><p>Với cấu hình mặc định, ASUS ROG Flow X13 hoàn toàn đã có thể mang danh ultrabook 13-inch mạnh mẽ nhất. Tuy nhiên, đừng vì thế mà ngừng khám phá con “quái thú” này, vì nó còn có thể được mở khóa bằng eGPU XG Mobile sử dụng AMD Radeon RX 6850 XT 12GB - một trong những mẫu card di động mạnh nhất của đội Đỏ trên thị trường.</p><p>Tuy so với RTX 3080 của XG Mobile thế hệ trước RX 6850 XT có thể sẽ dưới cơ một chút, nhưng với việc được cấp nguồn tổng lên tới 330W thì nó vẫn sẽ đủ mạnh để giúp người dùng chinh phục mọi tựa game. Việc kết nối XG Mobile tới Flow X13 cũng là thông qua giao thức PCIe 3.0 x8 mạnh mẽ.</p><p>Sự “mở khóa” ở đây còn tới từ việc, XG Mobile có thể cung cấp thêm rất nhiều cổng kết nối cho Flow X13 như tới 4 cổng USB-A, khe thẻ SD, HDMI 2.1, DisplayPort 1.4 và cổng 2.5G Gigabit Ethernet. Nhờ vậy, bạn có thể ứng dụng sản phẩm vào rất, rất nhiều công việc (Chơi game, làm đồ họa 2D, 3D,...) với trải nghiệm sử dụng tốt nhất.</p><h5 class="paragraph-heading">Màn hình toàn diện, phù hợp nhiều mục đích sử dụng</h5><p>Để sức mạnh của một cỗ máy chuyên game thể hiện ra ngoài, không thể thiếu được đó là một chiếc màn hình chất lượng. Và với bộ thông số chất lượng ngay từ tuỳ chọn tối thiểu như tấn số quét 120Hz, hỗ trợ Adaptive Sync hay độ phân giải 1920 x 1200, trải nghiệm hình ảnh của game thủ trên ASUS ROG Flow X13 sẽ đảm bảo mượt mà, sắc nét - ít nhất là với một thiết bị có tính di động rất cao.</p><p>Kết hợp với dài màu ấn tượng với 100% sRGB, 75% AdobeRGB cùng độ sai lệch màu DeltaE dưới 2.0, sản phẩm cũng sẽ tỏ ra phù hợp với nhu cầu làm việc đồ hoạ, chỉnh sửa ảnh,.. cần có độ chuẩn màu.</p><p>Cuối cùng, khả năng cảm ứng và xoay gập cũng là những yếu tố không thể bỏ qua, khi chúng là nguồn “sức mạnh” để biến Flow X13 trở thành một cỗ máy siêu đa dụng. Đặt ở nhiều vị trí thuận lợi để xem phim, chơi game,... hay dùng kèm bút stylus để viết vẽ; có rất nhiều khả năng mà sản phẩm có thể đem tới cho bạn.</p>', 1, N'Kể từ ngày đầu ra mắt tới nay, ASUS ROG Flow X13 vẫn được mệnh danh là một trong những mẫu laptop 13-inch mạnh mẽ nhất thế giới.', CAST(N'2022-05-25T01:20:51.563' AS DateTime), 1)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (3, 1, N'This is third post', N'images/post-thumbnails/def.jpg', CAST(N'2022-05-25T01:21:06.420' AS DateTime), N'This is third post details', 0, NULL, NULL, 1)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (4, 1, N'This is fourth post', N'images/post-thumbnails/unnamed.jpg', CAST(N'2022-05-25T01:21:18.750' AS DateTime), N'This is fourth post details', 1, NULL, NULL, 1)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (5, 1, N'test', N'images/post-image/images/post-thumbnail/2016-11-18 8.36.00 .JPG', CAST(N'2022-05-25T01:21:18.750' AS DateTime), N'<p><!-- x-tinymce/html --></p>

<h1>Phone 14 Pro c&oacute; thể d&ugrave;ng chip c&ocirc;ng nghệ cũ</h1>

<ul>
	<li><a href="https://zingnews.vn/Ph%C3%BAc-Th%E1%BB%8Bnh-tim-kiem.html?type=3">Ph&uacute;c Thịnh</a>&nbsp;

	<p>Theo 9to5Mac</p>
	</li>
	<li>&nbsp;</li>
	<li>Thứ ba, 31/5/2022 11:30 (GMT+7)</li>
</ul>

<p>Apple A16 c&oacute; thể l&agrave; chip xử l&yacute; thứ 3 li&ecirc;n tiếp sử dụng tiến tr&igrave;nh sản xuất 5 nm do nh&agrave; m&aacute;y của TSMC chưa ho&agrave;n thiện c&ocirc;ng nghệ mới hơn.</p>

<p>Ng&agrave;y 29/5, nh&agrave; ph&acirc;n t&iacute;ch Ming-Chi Kuo từ TF International Secutiries cho biết dựa theo lộ tr&igrave;nh của TSMC, d&acirc;y chuyền sản xuất chip 3 nm v&agrave; 4 nm sẽ kh&ocirc;ng hoạt động h&agrave;ng loạt trước năm 2023.</p>

<p>Theo&nbsp;<em>9to5Mac</em>, điều đ&oacute; đồng nghĩa chip xử l&yacute; A16 tr&ecirc;n iPhone 14 nhiều khả năng vẫn d&ugrave;ng tiến tr&igrave;nh 5 nm, tương tự A15 Bionic tr&ecirc;n iPhone 13 v&agrave; A14 Bionic của iPhone 12.</p>

<p>D&ograve;ng iPhone 14 dự kiến ra mắt v&agrave;o th&aacute;ng 9 với 2 k&iacute;ch thước m&agrave;n h&igrave;nh gồm 6,1 inch (iPhone 14, 14 Pro) v&agrave; 6,7 inch (iPhone 14 Max, 14 Pro Max).</p>

<p>Kuo cho biết iPhone 14 v&agrave; 14 Max dựa tr&ecirc;n chip xử l&yacute; A15 Bionic tương tự iPhone 13. Trong khi đ&oacute;, iPhone 14 Pro v&agrave; 14 Pro Max sẽ trang bị chip thế hệ mới, nhiều khả năng c&oacute; t&ecirc;n A16 Bionic.</p>

<p>&nbsp;</p>

<p>Ảnh dựng iPhone 14 Pro dựa tr&ecirc;n tin đồn. Ảnh: Jon Prosser.</p>

<ul>
	<li>&nbsp;</li>
	<li>&nbsp;</li>
</ul>

<p><img alt="iPhone 14 Pro co the dung chip cong nghe cu anh 1" src="https://znews-photo.zingcdn.me/w1920/Uploaded/yqdlcqrwq/2022_05_30/21031052022_copy.jpg" style="height:1802px; width:3243px" /></p>

<table align="center">
	<tbody>
		<tr>
			<td><img alt="iPhone 14 Pro co the dung chip cong nghe cu anh 1" src="https://znews-photo.zingcdn.me/w860/Uploaded/yqdlcqrwq/2022_05_30/21031052022_copy.jpg" style="height:1802px; width:3243px" title="iPhone 14 Pro c&amp;oacute; thể d&amp;ugrave;ng chip c&amp;ocirc;ng nghệ cũ ảnh 1" /></td>
		</tr>
		<tr>
			<td>
			<p>Ảnh dựng iPhone 14 Pro dựa tr&ecirc;n tin đồn. Ảnh:&nbsp;<em>Jon Prosser</em>.</p>
			</td>
		</tr>
	</tbody>
</table>

<p>C&aacute;c loại chip sử dụng chung tiến tr&igrave;nh sản xuất thường c&oacute; hiệu năng v&agrave; mức ti&ecirc;u thụ năng lượng như nhau. Tuy nhi&ecirc;n, chip A15 vẫn cho hiệu năng cao hơn 10% v&agrave; tối ưu năng lượng tốt hơn A14 Bionic tr&ecirc;n iPhone 12, d&ugrave; 2 chip n&agrave;y c&oacute; chung tiến tr&igrave;nh 5 nm.</p>

<p>Thời gian gần đ&acirc;y, Kuo tỏ ra kh&ocirc;ng lạc quan về lộ tr&igrave;nh n&acirc;ng cấp chip của Apple. V&agrave;o th&aacute;ng 3, &ocirc;ng dự đo&aacute;n MacBook Air 2022, mẫu laptop sắp ra mắt của h&atilde;ng vẫn d&ugrave;ng chip M1 như thế hệ trước. Trong khi đ&oacute;, thế hệ chip M2 c&oacute; thể xuất hiện v&agrave;o năm 2023.</p>

<p>Tất nhi&ecirc;n, T&aacute;o khuyết vẫn c&oacute; thể chỉnh sửa một số chi tiết nhỏ tr&ecirc;n chip M1 rồi đặt t&ecirc;n th&agrave;nh M2 để quảng b&aacute; tốt hơn.</p>

<p>Việc chip xử l&yacute; tr&ecirc;n iPhone d&ugrave;ng chung tiến tr&igrave;nh trong 3 năm li&ecirc;n tiếp kh&ocirc;ng thường xảy ra. Apple thường đi ti&ecirc;n phong sử dụng tiến tr&igrave;nh mới cho chip di động để gi&agrave;nh lợi thế hiệu năng. Tuy nhi&ecirc;n, nhiều l&yacute; do khiến TSMC, đối t&aacute;c sản xuất chip cho Apple kh&ocirc;ng thể đẩy nhanh tiến độ ph&aacute;t triển quy tr&igrave;nh chip trong năm nay.</p>

<p>Về những chi tiết kh&aacute;c, Kuo tiết lộ iPhone 14 Pro v&agrave; 14 Pro Max sở hữu cụm camera lớn hơn do cảm biến ch&iacute;nh c&oacute; độ ph&acirc;n giải tăng từ 12 MP l&ecirc;n 48 MP, gi&uacute;p thiết bị quay video 8K thay v&igrave; tối đa 4K như thế hệ trước. K&iacute;ch thước lớn của cụm camera được thể hiện r&otilde; nhất tr&ecirc;n phi&ecirc;n bản iPhone 14 Pro với m&agrave;n h&igrave;nh 6,1 inch.</p>

<p>Theo trang&nbsp;<em>iDropNews</em>, c&aacute;c nguồn tin nội bộ cho thấy Apple sẽ tổ chức sự kiện v&agrave;o tuần thứ 37, tức iPhone 14 c&oacute; thể ra mắt v&agrave;o ng&agrave;y 13/9. Tin đồn dự đo&aacute;n gi&aacute; của iPhone 14 Pro sẽ cao hơn&nbsp;100 USD&nbsp;so với phi&ecirc;n bản trước, lần lượt&nbsp;1.100 USD&nbsp;cho bản 6,1 inch v&agrave;&nbsp;1.200 USD&nbsp;cho bản 6,7 inch.</p>

<p>&nbsp;</p>

<p><strong><a href="https://zingnews.vn/video-ly-do-macbook-khong-co-man-hinh-cam-ung-post1320691.html" rel="noopener" target="_blank">L&yacute; do MacBook kh&ocirc;ng c&oacute; m&agrave;n h&igrave;nh cảm ứng</a></strong>&nbsp;C&aacute;c quản l&yacute; cấp cao của Apple cho rằng việc MacBook sở hữu m&agrave;n h&igrave;nh cảm ứng v&agrave; Face ID l&agrave; kh&ocirc;ng cần thiết.</p>
', 1, NULL, CAST(N'2022-06-28T13:33:15.963' AS DateTime), 1)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (6, 1, N'Dòng iPhone ''Plus'' sắp được Apple hồi sinh
', N'https://znews-photo.zingcdn.me/w860/Uploaded/natmtj/2022_06_28/iphone_14_molds.jpeg', CAST(N'2022-05-23T01:21:18.750' AS DateTime), N'Apple có thể hồi sinh cái tên iPhone "Plus" cho thế hệ iPhone mới, ra mắt vào mùa thu năm nay.
Theo Lanzuk, người chuyên rò rỉ tin đồn uy tín về chuỗi cung ứng của Apple và Samsung, Apple sẽ hồi sinh cái tên “Plus” cho thế hệ iPhone 2022.

Cụ thể, iPhone 14 “Plus” được cho là sẽ có màn hình to tương tự iPhone 14 Pro Max (6,7 inch) với cấu hình của dòng iPhone 14 thông thường. Trước đó, tin đồn cho thấy mẫu máy này được đặt tên iPhone 14 Max.', 1, N'Thứ ba, 28/6/2022 10:11 (GMT+7)', CAST(N'2022-06-28T13:33:15.963' AS DateTime), 2)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (9, 1, N'Mark Zuckerberg khoe dàn ‘vũ khí’ hiện thực hoá tham vọng metaverse', N'https://static-images.vnncdn.net/files/publish/2022/6/22/maxresdefault-90.jpeg', CAST(N'2022-05-22T01:21:18.750' AS DateTime), N'<p><!-- x-tinymce/html --></p>

<p>Mới đ&acirc;y, CEO Mark Zuckerberg đ&atilde; h&eacute; lộ nhiều nguy&ecirc;n mẫu (prototype) thiết bị đeo m&agrave; c&ocirc;ng ty n&agrave;y ph&aacute;t triển trong c&aacute;c ph&ograve;ng th&iacute; nghiệm. Người s&aacute;ng lập Facebook đang đặt cược &ldquo;tất tay&rdquo; với VR, c&ocirc;ng nghệ đưa người d&ugrave;ng v&agrave;o thế giới ảo v&agrave; AR, c&ocirc;ng nghệ cho ph&eacute;p con người trải nghiệm yếu tố ảo trong kh&ocirc;ng gian vật l&yacute; thực tế.</p>

<p>Nếu Zuckerberg th&agrave;nh c&ocirc;ng, Meta sẽ c&oacute; th&ecirc;m một nguồn thu mới từ việc kinh doanh phần cứng trong bối cảnh nền tảng mạng x&atilde; hội n&agrave;y đ&atilde; đạt tới điểm b&atilde;o ho&agrave; về tăng trưởng người d&ugrave;ng, cũng như bị thu hẹp doanh thu do sự thay đổi về ch&iacute;nh s&aacute;ch quảng c&aacute;o của c&aacute;c c&ocirc;ng ty kh&aacute;c.</p>

<p><img src="https://static-images.vnncdn.net/files/publish/2022/6/22/maxresdefault-90.jpeg" /></p>

<p><a href="https://vietnamnet.vn/meta-tag7345915075887240827.html">Meta</a>&nbsp;hiện đang thống trị doanh số b&aacute;n h&agrave;ng thiết bị đeo VR, thị trường vốn vẫn c&ograve;n tương đối nhỏ. Mẫu thiết bị đeo Quest 2, c&oacute; gi&aacute; 299 USD chiếm 78% tổng doanh số thiết bị đeo của h&atilde;ng trong năm 2021. D&ugrave; vậy, con số 11,2 triệu thiết bị VR được b&aacute;n ra trong năm vẫn nhỏ hơn nhiều so với doanh số của smartphone hay PC.</p>

<p>Theo CEO Meta, c&ocirc;ng ty đang tập trung n&acirc;ng cao độ sống động của h&igrave;nh ảnh t&aacute;i hiện, cũng như cải thiện sự tiện nghi để người d&ugrave;ng c&oacute; thể đeo thiết bị trong một thời gian d&agrave;i.</p>

<p>&ldquo;Sẽ kh&ocirc;ng l&acirc;u nữa trước khi ch&uacute;ng t&ocirc;i c&oacute; thể tạo ra c&aacute;c khung cảnh c&oacute; độ trung thực ho&agrave;n hảo. Thay v&igrave; cảm gi&aacute;c chỉ nh&igrave;n qua m&agrave;n h&igrave;nh, người d&ugrave;ng sẽ cảm thấy như đang c&oacute; mặt ở đ&oacute; vậy&rdquo;, Zuckerberg cho biết.</p>

<p>Dưới đ&acirc;y l&agrave; một số prototype m&agrave; Meta đ&atilde; v&agrave; đang ph&aacute;t triển:</p>

<p><strong>Butterscotch</strong>: Được thiết kế với m&agrave;n h&igrave;nh độ ph&acirc;n giải cao với c&aacute;c pixel đủ nhỏ m&agrave; mắt người kh&ocirc;ng thể ph&acirc;n biệt. Thiết bị sử dụng thấu k&iacute;nh mới do Meta ph&aacute;t triển, gi&uacute;p hiển thị văn bản r&otilde; r&agrave;ng hơn v&agrave; c&aacute;c chi tiết ch&acirc;n thực hơn. Tuy nhi&ecirc;n, c&ocirc;ng ty cho biết nguy&ecirc;n mẫu n&agrave;y kh&oacute; c&oacute; thể thương mại ho&aacute; do trọng lượng nặng v&agrave; cồng kềnh, chưa kể bảng mạch vẫn &ldquo;lộ thi&ecirc;n&rdquo;.</p>

<p><img src="https://static-images.vnncdn.net/files/publish/2022/6/22/butterscotch-prototype-reality-labs-research-92.jpeg" /></p>

<p><strong>Half Dome 3</strong>: Thiết bị được ph&aacute;t triển từ năm 2017 nhằm thử nghiệm thay đổi khoảng c&aacute;ch lấy n&eacute;t quang học. Meta cho biết với c&ocirc;ng nghệ Half Dome, độ ph&acirc;n giải v&agrave; chất lượng h&igrave;nh ảnh đủ để người d&ugrave;ng trải nghiệm một m&agrave;n h&igrave;nh m&aacute;y t&iacute;nh khổng lồ trong thiết bị. Phi&ecirc;n bản thế hệ thứ 3 n&agrave;y l&agrave; mới nhất, được trang bị thấu k&iacute;nh tinh thể lỏng.</p>

<p><strong>Holocake 2</strong>: Thiết bị VR mỏng v&agrave; nhẹ nhất từng được Meta tạo ra, tương th&iacute;ch mọi phần mềm VR khi kết nối với PC. Tuy nhi&ecirc;n, thiết bị n&agrave;y đ&ograve;i hỏi c&aacute;c loại laser chuy&ecirc;n dụng qu&aacute; đắt so với người ti&ecirc;u d&ugrave;ng, cũng như phải bổ sung th&ecirc;m biện ph&aacute;p an to&agrave;n. B&ecirc;n trong Holocake 2, Meta sử dụng thấu k&iacute;nh phẳng 3 chiều để giảm khối lượng n&oacute;i chung.</p>

<p><strong>Starburst</strong>: Nguy&ecirc;n mẫu được ph&aacute;t triển để nghi&ecirc;n cứu khả năng &aacute;p dụng dải tương phản động cao (HDR), đem tới độ ch&acirc;n thực v&agrave; tăng th&ecirc;m chiều s&acirc;u cho h&igrave;nh ảnh.</p>

<p><img src="https://static-images.vnncdn.net/files/publish/2022/6/22/85b91bf3-copy-93.jpg" /></p>

<p><strong>Mirror Lake</strong>: Mẫu thiết bị tr&ocirc;ng giống như k&iacute;nh đeo trượt tuyết, kết hợp mọi c&ocirc;ng nghệ đeo m&agrave; Meta đang ph&aacute;t triển trong một m&agrave;n h&igrave;nh đơn duy nhất. &ldquo;Đ&acirc;y l&agrave; thiết bị đầy hứa hẹn, nhưng hiện tại n&oacute; vẫn chưa được ph&aacute;t triển đầy đủ c&aacute;c chức năng để kiểm nghiệm đầy đủ. Nếu th&agrave;nh c&ocirc;ng, Mirror Lake sẽ l&agrave; thiết bị tạo ra bước ngoặt cho trải nghiệm h&igrave;nh ảnh VR&rdquo;, Michael Abrash, chuy&ecirc;n gia khoa học tại Meta Reality Labs cho biết.</p>
', 1, NULL, NULL, 2)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (10, 2, N'iPhone 15 Pro đẹp hút hồn, có camera tiềm vọng', N'https://static-images.vnncdn.net/files/publish/2022/6/21/iphone-14-37.jpg', CAST(N'2022-05-19T01:21:18.750' AS DateTime), N'Khi loạt iPhone 14 còn chưa ra mắt, một video concept iPhone 15 Pro vừa xuất hiện khiến các fan hâm mộ Apple thêm háo hức.
Video mẫu iPhone 15 Pro được giới thiệu bởi nhà thiết kế Technizo Concept, dựa trên những thông tin rò rỉ về mẫu iPhone cao cấp mới của Apple ra mắt năm sau.

Theo đó, loạt iPhone 15 được dự kiến ra mắt vào tháng 9/2023. Đây sẽ là mẫu iPhone đầu tiên sử dụng cổng USB-C.

Một tính năng "hot" mà các tin đồn nhắc tới là iPhone 15 Pro và iPhone 15 Pro Max sẽ được trang bị camera tiềm vọng. Apple được cho là đã chọn Jahwa Electronics của Hàn Quốc để cung cấp mô-đun chống rung OIS, theo The Elec.', 1, NULL, NULL, 2)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (11, 1, N'Asus ra Zenbook 14 OLED giá từ 25 triệu đồng', N'https://i1-sohoa.vnecdn.net/2022/06/28/DSCF1651-1656389851.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=WoXmTzMI0FLtP8gpcc4_tQ', CAST(N'2022-05-19T01:21:18.750' AS DateTime), N'Ngày 28/6, Asus ra mắt dòng laptop mỏng nhẹ gồm Zenbook 14 OLED mã UX3402 (xanh) và bản đặc biệt Zenbook 14X OLED Space Edition (xám). Sản phẩm đánh dấu lần thay đổi triết lý thiết kế lớn đầu tiên từ Zen (họa tiết vòng tròn hướng tâm) sang kiểu mới Kintsugi. Hãng máy tính Đài Loan cũng không còn theo đuổi xu hướng siêu mỏng nhẹ mà cân đối giữa hiệu năng, thời lượng sử dụng lâu hơn khi dùng chip Intel Core i dòng P, tăng dung lượng pin.


Zenbook 14 OLED có hai màu là xanh lam và xanh ngọc bích. Mặt trước chuyển từ họa tiết vòng tròn hướng tâm sang bề mặt trơn với chữ A cách điệu. Thiết kế mới đơn giản, hiện đại hơn và cũng dễ vệ sinh hơn trước đáng kể. Máy sử dụng khung kim loại, vỏ nhôm sần và chỉ có chi tiết nhựa ở xung quanh viền màn hình.

Asus tăng nhẹ trọng lượng và độ mỏng của Zenbook 14 OLED so với thế hệ trước lên 1,39 kg và 16,9 mm tương ứng. Tuy nhiên, các thông số này vẫn nổi bật khi so với HP Pavillion 14 (1,45 kg) hay MacBook Air M1 13,6 inch (1,35 kg).


Trang bị nổi bật trên máy là màn hình OLED 14 inch, độ phân giải 2,8 K, tỷ lệ 16:10 và hiển thị 100% gam màu DCI-P3. Tần số quét là 90 Hz, đủ dùng khi hướng đến người làm việc văn phòng, thời gian đáp ứng tốt là 0,2 ms. Trong thử nghiệm thực tế của một số trang công nghệ quốc tế, độ sai màu Delta-E đo được trên màn hình là 1,6 - mức không thể quan sát sai lệch bằng mắt thường. Tuy nhiên, để sử dụng cho các công việc in ấn, người dùng vẫn cần các thiết bị căn chỉnh bên ngoài.

So với thế hệ cũ, màn hình máy có thể mở góc 180 độ nhờ bản lề ErgoLift, nhưng việc không hỗ trợ cảm ứng khiến tính năng này không phát huy nhiều tác dụng. Viền màn hình được làm mỏng đều ba cạnh và vẫn đủ chỗ cho camera phía trên.', 1, NULL, NULL, 2)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (12, 1, N'Facebook gặp lỗi hiển thị tài khoản đã ''unfollow', N'https://i1-sohoa.vnecdn.net/2022/06/28/facebook-unfollow-9525-1656392005.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=4g05R2CcH7IdQJjiZN2iGQ', CAST(N'2022-04-19T01:21:18.750' AS DateTime), N'Bảng tin của nhiều người dùng Facebook tại Việt Nam bỗng xuất hiện các bài đăng từ những tài khoản mà họ đã bỏ theo dõi từ lâu.

Tình trạng trên diễn ra từ sáng 28/6 với cả ứng dụng và bản web của Facebook nhưng hiện vẫn chưa được khắc phục.

Khánh Phương (Cầu Giấy, Hà Nội) cho biết cô giật mình khi đang lướt bảng tin Facebook trên điện thoại thì thấy bài đăng từ người mà cô đã bỏ theo dõi trước đó. "Tôi từng unfollow một số bạn bè vì không hợp quan điểm, nhưng sáng nay lại đọc được bài viết của họ trên bảng tin", Phương kể. Khi hỏi trong một nhóm chat, cô mới biết không chỉ tài khoản của mình bị như vậy.

Vũ Hưng (TP HCM) cũng gặp tình trạng tương tự: "Có nhiều người tôi bỏ theo dõi vài năm, nay lại hiện lên News Feed. Khi vào kiểm tra thì thấy tài khoản của tôi vẫn đang unfollow họ".

Trên một số hội nhóm Facebook sáng 28/6, nhiều người cho biết các hoạt động khác trên mạng xã hội vẫn diễn ra bình thường, nhưng trải nghiệm lướt bảng tin tạo cảm giác khó chịu vì phải thấy những thông tin không mong muốn.

"Tôi từng bỏ theo dõi một số bạn bè vì họ bán hàng online, đăng tin nhảm hoặc đưa ra những bình luận cực đoan. Sáng nay, những nội dung như thế lại ngập tràn trên bảng tin của tôi", Phương nói.

Người dùng Facebook có thể bỏ theo dõi để các bài viết của một người không hiện trên bảng tin. Ảnh: Lưu Quý
Người dùng Facebook có thể bỏ theo dõi để các bài viết của một người không hiện trên bảng tin. Ảnh: Lưu Quý

Unfollow là tính năng của Facebook cho phép người dùng chặn hiển thị các bài viết của một người nhưng vẫn giữ quan hệ bạn bè. Tính năng này được áp dụng cho cả fanpage và group. Để sử dụng, người dùng vào trang cá nhân của người kia, bấm vào nút "Bạn bè", và chọn "Bỏ theo dõi".

Ngoài vấn đề hiển thị lại thông tin của người đã unfollow, một số người cho biết phần thông báo của Facebook cũng chỉ toàn nội dung từ 3-4 ngày trước, không hiện thông báo mới.

Tình trạng này không chỉ xảy ra ở Việt Nam, mà còn được người dùng ở một số khu vực tại châu Mỹ báo cáo. "Có vẻ tính năng thông báo và bỏ theo dõi của Facebook đang lỗi. Bảng tin của tôi giống như hồi năm 2009 khi chưa được dọn dẹp vậy", người dùng tên D. Jones phản ánh trên DownDetector - công cụ chuyên theo dõi tình trạng hoạt động của các dịch vụ trực tuyến.

Meta, công ty mẹ của Facebook, hiện chưa đưa ra giải thích nào về vấn đề trên. Hồi tháng 4, mạng xã hội này cũng gặp lỗi hiển thị thông tin cũ, khiến thành viên trong các group chỉ xem được bài viết từ khi nhóm mới thành lập. Lỗi này được khắc phục sau khoảng nửa ngày.', 1, NULL, NULL, 2)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (39, 1, N'Galaxy Z Fold3 và Flip3 giảm giá chục triệu đồng', N'https://i1-sohoa.vnecdn.net/2022/06/26/zfold3-1656243258-8706-1656243555.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=DkBX9X_JJloDjrM3BYfeKg', CAST(N'2009-01-01T00:00:00.000' AS DateTime), N'<p>Hai mẫu smartphone gập của Samsung được nhiều cửa h&agrave;ng trong nước giảm từ 7 đến 11 triệu đồng, chuẩn bị cho thế hệ mới sắp ra mắt.</p>

<p>Việc giảm gi&aacute; được c&aacute;c cửa h&agrave;ng dần thực hiện từ tuần trước, cho hầu hết c&aacute;c phi&ecirc;n bản m&agrave;u sắc v&agrave; bộ nhớ của&nbsp;<a href="https://vnexpress.net/chu-de/galaxy-z-fold3-3653" rel="dofollow">Galaxy Z Fold3</a>&nbsp;v&agrave;&nbsp;<a href="https://vnexpress.net/chu-de/galaxy-z-flip3-3654" rel="dofollow">Z Flip3</a>.</p>

<p>V&iacute; dụ tại FPT Shop, Z Fold3 được b&aacute;n với gi&aacute; lần lượt 33 v&agrave; 36 triệu đồng cho phi&ecirc;n bản 256 v&agrave; 512 GB, thấp hơn 4 triệu đồng so với hồi th&aacute;ng 3 v&agrave; rẻ hơn 9 triệu đồng so với gi&aacute; ni&ecirc;m yết. Khi ra mắt v&agrave;o th&aacute;ng 8/2021, m&aacute;y được b&aacute;n từ 42 đến 45 triệu đồng.</p>

<p>Tại một số hệ thống kh&aacute;c như CellphoneS, Ho&agrave;ng H&agrave; Mobile hay Sam Center, mẫu m&aacute;y n&agrave;y thậm ch&iacute; được giảm xuống c&ograve;n từ 30,9 đến 31,2 triệu đồng cho bản 256 GB v&agrave; 34 triệu đồng cho bản 512 GB. Như vậy chỉ sau khoảng 10 th&aacute;ng c&oacute; mặt tr&ecirc;n thị trường, người d&ugrave;ng hiện c&oacute; thể mua điện thoại gập cao cấp nhất của Samsung với gi&aacute; thấp hơn 10-11 triệu đồng.</p>

<p>Việc điều chỉnh gi&aacute; cũng diễn ra tương tự với Galaxy Z Flip3. Từ gi&aacute; ni&ecirc;m yết lần lượt l&agrave; 25 v&agrave; 27 triệu đồng cho bản bộ nhớ 128 v&agrave; 256 GB, m&aacute;y từng được hạ xuống mức 20-22 triệu đồng v&agrave;o qu&yacute; 1/2022, trước khi tiếp tục giảm c&ograve;n 17-19 triệu đồng như hiện nay.</p>

<p>triệu đồngThay đổi gi&aacute; Galaxy Z Fold3 v&agrave; Z Flip3nửa đầu năm 2022252520201717272722221919424235353131454538383434Z Flip3 128GBZ Flip3 256GBZ Fold3 256GBZ Fold3 512GB00.250.50.7511.251.51.7521020304050VnExpressTh&aacute;ng 12/2021●&nbsp;Z Flip3 128GB:&nbsp;25</p>

<p>C&aacute;c sản phẩm của Samsung giảm gi&aacute; trong bối cảnh thị trường v&agrave;o giai đoạn thấp điểm, đồng thời nhiều mẫu m&aacute;y cao cấp kh&aacute;c chuẩn bị ra mắt.</p>

<p>Theo đại diện hệ thống Sam Center, c&oacute; hai nguy&ecirc;n nh&acirc;n dẫn đến đợt điều chỉnh n&agrave;y. Đầu ti&ecirc;n, Z Flip3 v&agrave; Z Fold3 đ&atilde; được b&aacute;n gần một năm v&agrave; sắp đến v&ograve;ng sản phẩm mới ra đời. Ngo&agrave;i ra, việc hạ gi&aacute; l&agrave; xu hướng chung của thị trường điện thoại cao cấp trong giai đoạn n&agrave;y, tương tự c&aacute;c mẫu iPhone của Apple.</p>

<p>Trước Samsung,&nbsp;<a href="https://vnexpress.net/hang-loat-iphone-tai-viet-nam-sap-giam-gia-4477740.html" rel="dofollow">h&agrave;ng loạt iPhone</a>&nbsp;từ 11 đến 13 cũng được giảm h&agrave;ng triệu đồng. Sau đợt thay đổi gi&aacute; n&agrave;y, Galaxy Z Fold3 hiện cũng ph&acirc;n kh&uacute;c với iPhone 13 Pro Max, Galaxy S22 Ultra, Oppo Find X5 Pro v&agrave; Vivo X80 Pro, trong khi Z Flip3 c&ugrave;ng ph&acirc;n kh&uacute;c với Xiaomi 12, iPhone 12, 13 mini, Galaxy S22.</p>

<p>&quot;B&ecirc;n cạnh đ&oacute;, việc đưa mẫu Galaxy Z Flip3 xuống mức dưới 20 triệu đồng c&oacute; thể c&ograve;n l&agrave; c&aacute;ch để h&atilde;ng phổ cập điện thoại m&agrave;n h&igrave;nh gập&quot;, đại diện SamCenter n&oacute;i, đồng thời dự đo&aacute;n mẫu m&aacute;y n&agrave;y c&oacute; thể vẫn được duy tr&igrave; ngay cả khi thế hệ mới ra mắt.</p>

<p>Đơn vị b&aacute;n lẻ ủy quyền của Samsung cũng cho biết, smartphone m&agrave;n h&igrave;nh gập đang ng&agrave;y c&agrave;ng được chuộng ở Việt Nam, trong đ&oacute; Samsung vẫn dẫn đầu. &quot;Doanh số của d&ograve;ng Z hiện khoảng 100 ngh&igrave;n, trong đ&oacute; Z Flip3 b&aacute;n tốt hơn Fold3&quot;, người n&agrave;y cho biết th&ecirc;m.</p>

<p><img alt="Galaxy Z Fold3. Ảnh: Lưu Quý" src="https://i1-sohoa.vnecdn.net/2022/06/26/zfold3-1656243258-8706-1656243555.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=K8EXBFX2-SbkZVYYyPNIzw" /></p>

<p>Galaxy Z Fold3. Ảnh:<em>&nbsp;Lưu Qu&yacute;</em></p>

<p>Theo thống k&ecirc; tại c&aacute;c hệ thống b&aacute;n lẻ lớn trong ba th&aacute;ng gần đ&acirc;y, c&aacute;c điện thoại Samsung đạt doanh số v&agrave; doanh thu cao nhất vẫn l&agrave; sản phẩm gi&aacute; rẻ như Galaxy A12, A13, A03, hay m&aacute;y cao cấp đ&atilde; ra mắt hai năm l&agrave; Galaxy Note 20 Ultra.</p>

<p>Z Fold3 hiện l&agrave; điện thoại đắt tiền nhất của Samsung tại Việt Nam. Sản phẩm nổi bật ở m&agrave;n h&igrave;nh 7,6 inch c&oacute; thể gập lại v&agrave; một m&agrave;n h&igrave;nh 6,2 inch b&ecirc;n ngo&agrave;i, c&ugrave;ng sử dụng c&ocirc;ng nghệ Dynamic Amoled 2X, tần số qu&eacute;t 120 Hz. M&aacute;y được trang bị chip Snapdragon 888 5G, cụm ba camera 12 megapixel. Z Flip3 nhỏ hơn, với m&agrave;n h&igrave;nh ch&iacute;nh 6,7 inch c&oacute; thể gập ngang.</p>
', 1, NULL, NULL, 1)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (40, 1, N'Apple bán đồng hồ thông minh vào tháng 10
', N'https://static.tuoitre.vn/tto/i/s626/2014/06/07/fFyHoYUL.jpg', CAST(N'2022-01-19T01:21:18.750' AS DateTime), N'<h2>TTO - Theo Nikkei, Apple đang r&aacute;o riết chuẩn bị ra mắt đồng hồ th&ocirc;ng minh (smartwatch) v&agrave;o th&aacute;ng 10.</h2>

<table border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td><a href="https://static.tuoitre.vn/tto/i/s626/2014/06/07/fFyHoYUL.jpg" title="Mẫu thiết kế đồ họa ý tưởng về thiết bị đeo tay thông minh "><img alt="fFyHoYUL.jpg" src="https://static.tuoitre.vn/tto/i/s626/2014/06/07/fFyHoYUL.jpg" /></a></td>
		</tr>
		<tr>
			<td>Mẫu thiết kế đồ họa &yacute; tưởng về thiết bị đeo tay th&ocirc;ng minh &quot;iWatch&quot; - Ảnh: MacRumor</td>
		</tr>
	</tbody>
</table>

<p>Nikkei dẫn nguồn tin ri&ecirc;ng cho biết, c&aacute;c t&iacute;nh năng kỹ thuật của thiết bị th&ocirc;ng minh đang được ho&agrave;n tất. Đ&aacute;ng ch&uacute; &yacute;, thiết bị c&oacute; m&agrave;n h&igrave;nh OLED cong, nhiều cảm biến thu thập dữ liệu sức khỏe như lượng đường trong m&aacute;u, ti&ecirc;u hao calori, chất lượng giấc ngủ.</p>

<p>Một số th&ocirc;ng tin kh&aacute;c cho biết, thiết bị th&ocirc;ng minh đeo tay của Apple sẽ d&ugrave;ng phi&ecirc;n bản hệ điều h&agrave;nh iOS tinh gọn. V&agrave;o đầu th&aacute;ng n&agrave;y, Apple đ&atilde; ch&iacute;nh thức giới thiệu hệ điều h&agrave;nh iOS 8 tại sự kiện WWDC 2014, bao gồm ứng dụng tổng hợp phục vụ sức khỏe, c&oacute; thể đồng bộ với thiết bị th&ocirc;ng minh.</p>

<p>Theo Nikkei, t&ecirc;n dự kiến của thiết bị n&agrave;y l&agrave; &quot;iWatch&quot;, tham gia gia đ&igrave;nh thiết bị họ &quot;i&quot; của Apple. Sản phẩm sẽ ra mắt c&ugrave;ng iPad v&agrave; Mac mới v&agrave;o th&aacute;ng 10, sau sự kiện iPhone thế hệ mới ra mắt th&aacute;ng 9 tới đ&acirc;y. Apple l&ecirc;n kế hoạch sản xuất từ 3 đến 5 triệu chiếc &quot;iWatch&quot; mỗi th&aacute;ng sau khi giới thiệu ra thị trường.</p>

<p>Thị trường thiết bị th&ocirc;ng minh đeo tr&ecirc;n người (wearable) đang trở n&ecirc;n s&ocirc;i động hơn bao giờ hết. Đối thủ lớn của Apple, Samsung đ&atilde; ra mắt thế hệ thứ hai đồng hồ th&ocirc;ng minh (smartwatch) Gear 2, k&egrave;m một v&ograve;ng đeo tay th&ocirc;ng minh GearFit, tương tự, Sony c&oacute; v&ograve;ng đeo tay th&ocirc;ng minh Smartband đi k&egrave;m Sony Smartwatch 2. Trong khi đ&oacute;, cả LG v&agrave; Motorola li&ecirc;n tục &quot;nh&aacute; h&agrave;ng&quot; về d&ograve;ng smartwatch sắp ra mắt của m&igrave;nh. Giới c&ocirc;ng nghệ lẫn c&aacute;c đối thủ c&ugrave;ng hồi hộp chờ đợi sản phẩm theo như lời CEO Apple Tim Cook cho biết &quot;độc đ&aacute;o nhất từ 25 năm trở lại đ&acirc;y của Apple&quot;.</p>

<p>Apple kh&ocirc;ng đưa ra b&igrave;nh luận g&igrave; về th&ocirc;ng tin tr&ecirc;n.</p>

<p><strong>* Smartphone 3D của Amazon ra mắt 18-6</strong>. Dự &aacute;n d&agrave;i hơi của Amazon cho chiếc điện thoại th&ocirc;ng minh đ&atilde; đến kỳ hạn, sau khi c&ocirc;ng ty đăng tải một video clip tr&ecirc;n YouTube h&eacute; mở về thiết bị n&agrave;y.</p>
', 1, NULL, NULL, 2)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (41, 2, N'Mặt trời hoạt động ''dữ dội'' khiến hàng loạt vệ tinh lao khỏi quỹ đạo', N'https://cdn.tuoitre.vn/thumb_w/586/2022/6/24/photo-1-16560678491421479232771.jpg', CAST(N'2021-01-19T01:21:18.750' AS DateTime), N'<h2>TTO - Hoạt động của Mặt trời trong năm 2022 dữ dội hơn nhiều so với dự đo&aacute;n của c&aacute;c nh&agrave; dự b&aacute;o thời tiết thi&ecirc;n văn. Dưới những cơn b&atilde;o Mặt trời, vệ tinh đột ngột giảm xuống độ cao thấp hơn v&agrave; rơi trở lại mặt đất.</h2>

<ul>
	<li><a href="https://tuoitre.vn/7-bi-an-ve-he-mat-troi-chua-co-loi-giai-20220618073144006.htm" title="7 bí ẩn về Hệ Mặt trời chưa có lời giải">7 b&iacute; ẩn về Hệ Mặt trời chưa c&oacute; lời giải</a></li>
	<li><a href="https://tuoitre.vn/vet-den-mat-troi-tang-gap-doi-kich-thuoc-sau-24-gio-de-doa-ban-xung-lua-manh-ve-trai-dat-20220621102223934.htm" title="Vết đen Mặt trời tăng gấp đôi kích thước sau 24 giờ, đe dọa bắn xung lửa mạnh về Trái đất">Vết đen Mặt trời tăng gấp đ&ocirc;i k&iacute;ch thước sau 24 giờ, đe dọa bắn xung lửa mạnh về Tr&aacute;i đất</a></li>
	<li><a href="https://tuoitre.vn/mat-troi-lai-ban-xung-lua-manh-cap-x-ve-phia-trai-dat-gay-mat-dien-vo-tuyen-nhieu-noi-20220421113054157.htm" title="Mặt trời lại bắn xung lửa mạnh cấp X về phía Trái đất, gây mất điện vô tuyến nhiều nơi">Mặt trời lại bắn xung lửa mạnh cấp X về ph&iacute;a Tr&aacute;i đất, g&acirc;y mất điện v&ocirc; tuyến nhiều nơi</a></li>
</ul>

<p><a href="https://cdn.tuoitre.vn/2022/6/24/photo-1-16560678491421479232771.jpg" target="_blank" title="Vệ tinh Swarm theo dõi môi trường xung quanh Trái đất từ năm 2013 - Ảnh: ESA"><img alt="Mặt trời hoạt động dữ dội khiến hàng loạt vệ tinh lao khỏi quỹ đạo - Ảnh 1." id="img_8335efb0-f3ab-11ec-8334-29d2c95fe6f6" src="https://cdn.tuoitre.vn/thumb_w/586/2022/6/24/photo-1-16560678491421479232771.jpg" title="Mặt trời hoạt động dữ dội khiến hàng loạt vệ tinh lao khỏi quỹ đạo - Ảnh 1." /></a></p>

<p>Vệ tinh Swarm theo d&otilde;i m&ocirc;i trường xung quanh Tr&aacute;i đất từ năm 2013 - Ảnh: ESA</p>

<p>Sự thay đổi thời tiết trong kh&ocirc;ng gian diễn ra tr&ugrave;ng với sự bắt đầu của chu kỳ Mặt trời mới. C&aacute;c chuy&ecirc;n gia cho rằng đ&oacute; c&oacute; thể l&agrave; sự khởi đầu của một số năm kh&oacute; khăn cho c&aacute;c hoạt động trong vũ trụ.</p>

<p>V&agrave;o cuối năm 2021, những người điều h&agrave;nh ch&ograve;m vệ tinh Swarm của Cơ quan Vũ trụ ch&acirc;u &Acirc;u (ESA) nhận thấy một điều đ&aacute;ng lo ngại: c&aacute;c vệ tinh đo từ trường xung quanh Tr&aacute;i đất bắt đầu ch&igrave;m về ph&iacute;a bầu kh&iacute; quyển với tốc độ nhanh bất thường - gấp 10 lần so với trước đ&acirc;y.</p>

<p>Th&aacute;ng 5-2022, c&aacute;c nh&agrave; khai th&aacute;c phải bắt đầu n&acirc;ng độ cao của vệ tinh bằng c&aacute;ch sử dụng động cơ đẩy tr&ecirc;n t&agrave;u để cứu ch&uacute;ng.</p>

<p>B&agrave; Anja Stromme, gi&aacute;m đốc sứ mệnh Swarm của ESA, n&oacute;i với trang tin&nbsp;<em>Space.com</em>: &quot;Trong 5, 6 năm qua, c&aacute;c vệ tinh ch&igrave;m khoảng 2,5 km/năm. Nhưng kể từ th&aacute;ng 12-2021, ch&uacute;ng hầu như lặn mất tăm. Tốc độ ch&igrave;m trong khoảng thời gian từ th&aacute;ng 12-2021 đến th&aacute;ng 4-2022 l&agrave; 20 km/năm&quot;.</p>

<p>Vệ tinh Swarm của ESA kh&ocirc;ng phải l&agrave; vệ tinh duy nhất vật lộn với thời tiết kh&ocirc;ng gian ng&agrave;y c&agrave;ng tồi tệ. V&agrave;o th&aacute;ng 2-2022,&nbsp;<a href="https://tuoitre.vn/bao-mat-troi-danh-rot-hang-chuc-ve-tinh-internet-toc-do-cao-20220210115406931.htm" target="_blank" title="SpaceX đã mất 40 vệ tinh Starlink">SpaceX đ&atilde; mất 40 vệ tinh Starlink</a>&nbsp;ho&agrave;n to&agrave;n mới. Ch&uacute;ng đ&atilde; bị một cơn b&atilde;o Mặt trời tấn c&ocirc;ng ngay sau khi ph&oacute;ng.</p>

<p>C&aacute;c vệ tinh quay xung quanh Tr&aacute;i đất lu&ocirc;n phải đối mặt với lực cản của bầu kh&iacute; quyển khiến ch&uacute;ng dần chậm lại v&agrave; cuối c&ugrave;ng rơi trở lại mặt đất. Ch&uacute;ng thường kh&ocirc;ng sống s&oacute;t sau qu&aacute; tr&igrave;nh gọi l&agrave; t&aacute;i nhập v&agrave; bốc ch&aacute;y trong kh&iacute; quyển.</p>

<p>Lực cản của kh&iacute; quyển n&agrave;y buộc c&aacute;c bộ điều khiển của Trạm vũ trụ quốc tế cũng phải thực hiện c&aacute;c thao t&aacute;c &quot;khởi động lại&quot; thường xuy&ecirc;n để duy tr&igrave; quỹ đạo của trạm l&agrave; 400km tr&ecirc;n Tr&aacute;i đất.&nbsp;Đồng thời, lực cản n&agrave;y cũng gi&uacute;p l&agrave;m sạch m&ocirc;i trường gần Tr&aacute;i đất khỏi r&aacute;c kh&ocirc;ng gian.&nbsp;</p>

<p>Cường độ của lực cản phụ thuộc v&agrave;o hoạt động của Mặt trời - lượng gi&oacute; do mặt trời phun ra - thay đổi t&ugrave;y thuộc v&agrave;o chu kỳ mặt trời 11 năm.</p>

<p>Chu kỳ Mặt trời vừa qua ch&iacute;nh thức kết th&uacute;c v&agrave;o th&aacute;ng 12-2019, n&oacute; như buồn ngủ, &iacute;t hoạt động.</p>

<p>Tuy nhi&ecirc;n, kể từ khi bước sang chu kỳ mới, Mặt trời đ&atilde; &quot;thức dậy&quot;, phun ra ng&agrave;y c&agrave;ng nhiều gi&oacute; v&agrave; tạo ra c&aacute;c vết đen, v&agrave; hiện tượng ph&oacute;ng xung điện với tốc độ ng&agrave;y c&agrave;ng tăng. V&agrave; tầng kh&iacute; quyển tr&ecirc;n của Tr&aacute;i đất đ&atilde; cảm nhận được những ảnh hưởng n&agrave;y.</p>

<p>Dưới những cơn b&atilde;o Mặt trời, vệ tinh sẽ đột ngột giảm xuống độ cao thấp hơn. Quỹ đạo của vệ tinh c&agrave;ng thấp th&igrave; nguy cơ kh&ocirc;ng thể phục hồi c&agrave;ng cao, khiến c&aacute;c nh&agrave; khai th&aacute;c bất lực nh&igrave;n ch&uacute;ng rơi xuống bầu kh&iacute; quyển.</p>

<p>B&agrave; Stromme cho biết tất cả c&aacute;c t&agrave;u vũ trụ xung quanh độ cao 400km đều c&oacute; vấn đề, bao gồm cả Trạm vũ trụ quốc tế, v&agrave; c&aacute;c kỹ sư sẽ phải thực hiện thao t&aacute;c &quot;khởi động lại&quot; thường xuy&ecirc;n hơn để giữ cho n&oacute; nổi</p>
', 1, NULL, NULL, 3)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (42, 2, N'12 startup nhận thưởng cuộc thi SK Startup Fellowship 2022', N'https://cdn.tuoitre.vn/thumb_w/586/2022/6/24/sk-startup-fellowship-16560611323572032020855.png', CAST(N'2021-02-19T01:21:18.750' AS DateTime), N'<h2>TTO - Ng&agrave;y 24-6, ban tổ chức cuộc thi SK Startup Fellowship 2022 c&ocirc;ng bố 12 startup được chọn nhận thưởng sau qu&aacute; tr&igrave;nh s&agrave;ng lọc, đ&aacute;nh gi&aacute; khắt khe v&agrave; phỏng vấn trực tiếp.</h2>

<ul>
	<li><a href="https://congnghe.tuoitre.vn/startup-theo-chan-y-bac-si-tren-tung-cay-so-trong-covid-19-20220315121834326.htm" title="Startup theo chân y bác sĩ ''trên từng cây số'' trong COVID-19">Startup theo ch&acirc;n y b&aacute;c sĩ &#39;tr&ecirc;n từng c&acirc;y số&#39; trong COVID-19</a></li>
	<li><a href="https://congnghe.tuoitre.vn/startup-viet-va-nhung-giac-mo-lon-20220302191324454.htm" title="Startup Việt và những giấc mơ lớn">Startup Việt v&agrave; những giấc mơ lớn</a></li>
	<li><a href="https://congnghe.tuoitre.vn/tai-khoi-dong-san-choi-ho-tro-startup-viet-20220227193645296.htm" title="Tái khởi động sân chơi hỗ trợ startup Việt">T&aacute;i khởi động s&acirc;n chơi hỗ trợ startup Việt</a></li>
</ul>

<p><a href="https://cdn.tuoitre.vn/2022/6/24/sk-startup-fellowship-16560611323572032020855.png" target="_blank" title="12  startup nhận thưởng cuộc thi SK Startup Fellowship 2022 - Ảnh: ANH THƯ"><img alt="12 startup nhận thưởng cuộc thi SK Startup Fellowship 2022 - Ảnh 1." id="img_e293cbe0-f39b-11ec-9229-b5d46648fdcd" src="https://cdn.tuoitre.vn/thumb_w/586/2022/6/24/sk-startup-fellowship-16560611323572032020855.png" title="12 startup nhận thưởng cuộc thi SK Startup Fellowship 2022 - Ảnh 1." /></a></p>

<p>12 startup nhận thưởng cuộc thi SK Startup Fellowship 2022 - Ảnh: ANH THƯ</p>

<p>Theo đ&aacute;nh gi&aacute; của ban tổ chức, hầu hết c&aacute;c startup được chọn đều đang trong giai đoạn tăng tốc ph&aacute;t triển v&agrave; x&aacute;c định r&otilde; hướng đi chiến lược. Về mặt c&ocirc;ng nghệ, một số startup thể hiện sự nhanh nhạy khi bắt kịp c&aacute;c c&ocirc;ng nghệ mới, ph&ugrave; hợp với xu hướng thế giới như c&ocirc;ng nghệ blockchain, tr&iacute; tuệ nh&acirc;n tạo (AI).</p>

<p>Mặt kh&aacute;c, nhiều startup thể hiện sự ki&ecirc;n định theo đuổi v&agrave; t&igrave;m ra lời giải đột ph&aacute; hơn cho c&aacute;c ng&agrave;nh tương đối truyền thống như AgriTech (n&ocirc;ng nghiệp c&ocirc;ng nghệ).</p>

<p>Nhiều startup c&oacute; l&otilde;i c&ocirc;ng nghệ cao, h&agrave;m lượng nghi&ecirc;n cứu s&acirc;u, sở hữu bằng s&aacute;ng chế như: Benkon, Cypher AI, SmartDoseAI, Selex Motor, CyberPurify. Đặc biệt, c&oacute; một v&agrave;i đơn vị khởi nghiệp trong lĩnh vực phần cứng đ&atilde; bước v&agrave;o giai đoạn thương mại h&oacute;a v&agrave; t&igrave;m được thị trường ph&ugrave; hợp. Thực tế, sản phẩm c&ocirc;ng nghệ cao c&oacute; phần mềm t&iacute;ch hợp phần cứng tự sản xuất tại Việt Nam đ&ograve;i hỏi khả năng ph&aacute;t triển phần mềm, cũng như năng lực quản trị nguồn nguy&ecirc;n vật liệu, chuỗi cung ứng v&agrave; hệ sinh th&aacute;i hỗ trợ ở tr&igrave;nh độ cao.</p>

<p>Nhiều nh&agrave; s&aacute;ng lập tại cuộc thi năm nay kh&ocirc;ng chỉ được đ&agrave;o tạo chuy&ecirc;n s&acirc;u, c&oacute; chuy&ecirc;n m&ocirc;n cao, m&agrave; c&ograve;n c&oacute; tư duy kinh doanh rất thực tế. Một số nh&agrave; s&aacute;ng lập c&ograve;n c&oacute; bề d&agrave;y kinh nghiệm ở cả thị trường Việt Nam v&agrave; quốc tế, ti&ecirc;u biểu như Realbox, Fundiin.</p>

<p>Ngay sau khi c&ocirc;ng bố top 12, c&aacute;c startup sẽ tiếp tục tham gia c&aacute;c chương tr&igrave;nh chia sẻ kiến thức, kinh nghiệm về quản trị t&agrave;i ch&iacute;nh, gọi vốn&hellip; từ c&aacute;c đối t&aacute;c của Tập đo&agrave;n SK như c&aacute;c quỹ đầu tư mạo hiểm trong khu vực, KPMG, BSSC, c&ugrave;ng nhiều cơ hội giao lưu trong mạng lưới của SK v&agrave; hệ sinh th&aacute;i khởi nghiệp Việt Nam.</p>

<p>Dự kiến th&aacute;ng 11-2022, chương tr&igrave;nh SK Startup Fellowship 2022 sẽ kh&eacute;p lại với sự kiện Demo Day, nơi c&aacute;c startup sẽ tr&igrave;nh b&agrave;y về m&ocirc; h&igrave;nh kinh doanh của m&igrave;nh trước nh&agrave; đầu tư v&agrave; hội đồng gi&aacute;m khảo. Top 4 sẽ nhận nguồn t&agrave;i trợ kh&ocirc;ng quy đổi cổ phần 50.000 USD</p>
', 1, NULL, NULL, 2)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (43, 2, N'Google cảnh báo phần mềm của Ý tấn công smartphone dùng iOS và Android', N'https://cdn.tuoitre.vn/thumb_w/586/2022/6/24/hacker-1656055402859600758115.jpg', CAST(N'2021-03-19T01:21:18.750' AS DateTime), N'<h2>TTO - Google cho biết nhiều điện thoại th&ocirc;ng minh chạy c&aacute;c hệ điều h&agrave;nh iOS v&agrave; Android tại &Yacute; v&agrave; Kazakhstan đ&atilde; bị x&acirc;m nhập tr&aacute;i ph&eacute;p th&ocirc;ng qua phần mềm của C&ocirc;ng ty RCS Lab c&oacute; trụ sở tại &Yacute;.</h2>

<ul>
	<li><a href="https://congnghe.tuoitre.vn/nga-canh-bao-phat-google-lien-quan-cac-thong-tin-sai-lech-20220623113358059.htm" title="Nga cảnh báo phạt Google liên quan các thông tin sai lệch">Nga cảnh b&aacute;o phạt Google li&ecirc;n quan c&aacute;c th&ocirc;ng tin sai lệch</a></li>
	<li><a href="https://congnghe.tuoitre.vn/luat-su-thang-kien-google-duoc-tuyen-boi-thuong-245-trieu-usd-20220618095257822.htm" title="Luật sư thắng kiện Google, được tuyên bồi thường 245 triệu USD">Luật sư thắng kiện Google, được tuy&ecirc;n bồi thường 245 triệu USD</a></li>
	<li><a href="https://congnghe.tuoitre.vn/google-buoc-ky-su-tam-nghi-vi-noi-tri-thong-minh-nhan-tao-co-tri-giac-20220613111102489.htm" title="Google buộc kỹ sư tạm nghỉ vì nói trí thông minh nhân tạo có tri giác">Google buộc kỹ sư tạm nghỉ v&igrave; n&oacute;i tr&iacute; th&ocirc;ng minh nh&acirc;n tạo c&oacute; tri gi&aacute;c</a></li>
</ul>

<p><a href="https://cdn.tuoitre.vn/2022/6/24/hacker-1656055402859600758115.jpg" target="_blank" title="Nhiều người dùng điện thoại iOS và Android có nguy cơ bị hack bởi phần mềm gián điệp từ Ý - Ảnh: PIXABAY"><img alt="Google cảnh báo phần mềm của Ý tấn công smartphone dùng iOS và Android - Ảnh 1." id="img_93f18f70-f38e-11ec-9fa7-8940bffc8753" src="https://cdn.tuoitre.vn/thumb_w/586/2022/6/24/hacker-1656055402859600758115.jpg" title="Google cảnh báo phần mềm của Ý tấn công smartphone dùng iOS và Android - Ảnh 1." /></a></p>

<p>Nhiều người d&ugrave;ng điện thoại iOS v&agrave; Android c&oacute; nguy cơ bị hack bởi phần mềm gi&aacute;n điệp từ &Yacute; - Ảnh: PIXABAY</p>

<p>Nh&oacute;m ph&acirc;n t&iacute;ch an ninh mạng của&nbsp;<a href="https://tuoitre.vn/google.html" target="_blank" title="Google">Google</a>&nbsp;cho biết phần mềm gi&aacute;n điệp của RCS Lab x&acirc;m nhập điện thoại bằng nhiều c&aacute;ch, trong đ&oacute; c&oacute; việc x&acirc;m nhập qua những lượt tải xuống tự động m&agrave; người d&ugrave;ng kh&ocirc;ng hề hay biết.</p>

<p>Theo Google, phần mềm gi&aacute;n điệp RCS m&agrave; h&atilde;ng n&agrave;y ph&aacute;t hiện, c&ograve;n được gọi l&agrave; &quot;Hermit&quot;, cũng ch&iacute;nh l&agrave; phần mềm m&agrave; C&ocirc;ng ty chuy&ecirc;n cung cấp dịch vụ bảo mật cho điện thoại th&ocirc;ng minh Lookout đ&atilde; b&aacute;o c&aacute;o trước đ&acirc;y.</p>

<p>C&aacute;c nh&agrave; nghi&ecirc;n cứu của Lookout cho biết tin tặc c&oacute; thể sử dụng Hermit để gi&agrave;nh quyền kiểm so&aacute;t điện thoại th&ocirc;ng minh, ghi &acirc;m, chuyển hướng cuộc gọi v&agrave; thu thập dữ liệu như danh bạ, tin nhắn, ảnh v&agrave; vị tr&iacute; của thiết bị.</p>

<p>Google v&agrave; Lookout đều cho rằng phần mềm gi&aacute;n điệp n&agrave;y c&oacute; thể x&acirc;m nhập điện thoại sau khi người d&ugrave;ng bấm v&agrave;o c&aacute;c đường link trong những tin nhắn SMS được gửi tới điện thoại của người d&ugrave;ng.</p>

<p>Trong một số trường hợp, c&aacute;c tin tặc t&igrave;m c&aacute;ch lợi dụng nh&agrave; cung cấp dịch vụ Internet (ISP) để v&ocirc; hiệu h&oacute;a kết nối dữ liệu di động của thiết bị. Sau khi v&ocirc; hiệu h&oacute;a, tin tặc sẽ gửi một li&ecirc;n kết độc hại qua SMS y&ecirc;u cầu mục ti&ecirc;u c&agrave;i đặt một ứng dụng để kh&ocirc;i phục kết nối dữ liệu.</p>

<p>Nếu kh&ocirc;ng lợi dụng ISP, tin tặc giả danh c&aacute;c nh&agrave; sản xuất điện thoại hoặc ứng dụng để gửi tin nhắn SMS lừa người d&ugrave;ng bấm v&agrave;o c&aacute;c đường link trong tin nhắn.</p>

<p>Google cho biết h&atilde;ng đ&atilde; cảnh b&aacute;o người d&ugrave;ng điện thoại sử dụng hệ điều h&agrave;nh Android bị phần mềm gi&aacute;n điệp t&igrave;m c&aacute;ch x&acirc;m nhập v&agrave; tăng cường c&aacute;c c&ocirc;ng cụ bảo vệ phần mềm. Apple cũng cho biết đ&atilde; thực hiện c&aacute;c bước để bảo vệ người d&ugrave;ng iPhone sử dụng hệ điều h&agrave;nh iOS.</p>

<p>Theo Google, hoạt động ph&aacute;t triển c&aacute;c phần mềm gi&aacute;n điệp thương mại đang ng&agrave;y c&agrave;ng nở rộ với tốc độ rất nhanh. Hiện đội gi&aacute;m s&aacute;t nguy cơ mạng của Google đang theo d&otilde;i hoạt động mua b&aacute;n phần mềm gi&aacute;n điệp tại hơn 30 quốc gia tr&ecirc;n thế giới.</p>
', 1, NULL, NULL, 2)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (44, 2, N'Big Tech bắt tay phát triển tiêu chuẩn cho vũ trụ ảo, có giống World Wide Web?', N'https://cdn.tuoitre.vn/thumb_w/586/2022/6/22/meta-16558720362962086809519.jpg', CAST(N'2021-04-19T01:21:18.750' AS DateTime), N'<h2>TTO - Meta (c&ocirc;ng ty mẹ của Facebook), Microsoft v&agrave; c&aacute;c g&atilde; khổng lồ c&ocirc;ng nghệ (Big Tech) kh&aacute;c đang ph&aacute;t triển metaverse tham gia nh&oacute;m x&acirc;y dựng c&aacute;c ti&ecirc;u chuẩn để vũ trụ ảo của c&aacute;c c&ocirc;ng ty n&agrave;y tương th&iacute;ch với nhau. Tuy nhi&ecirc;n Apple kh&ocirc;ng c&oacute; trong nh&oacute;m.</h2>

<ul>
	<li><a href="https://congnghe.tuoitre.vn/vu-tru-ao-se-tiep-suc-du-lich-20220416223102288.htm" title="Vũ trụ ảo sẽ tiếp sức du lịch?">Vũ trụ ảo sẽ tiếp sức du lịch?</a></li>
	<li><a href="https://congnghe.tuoitre.vn/nguoi-dung-to-bi-cuong-hiep-trong-vu-tru-ao-meta-20220205115743936.htm" title="Người dùng tố bị ''cưỡng hiếp'' trong vũ trụ ảo Meta">Người d&ugrave;ng tố bị &#39;cưỡng hiếp&#39; trong vũ trụ ảo Meta</a></li>
	<li><a href="https://congnghe.tuoitre.vn/dua-vu-tru-ao-vao-chinh-quyen-20220103013425891.htm" title="Đưa vũ trụ ảo vào chính quyền">Đưa vũ trụ ảo v&agrave;o ch&iacute;nh quyền</a></li>
</ul>

<p><a href="https://cdn.tuoitre.vn/2022/6/22/meta-16558720362962086809519.jpg" target="_blank" title="Meta đặt cược lớn vào vũ trụ ảo metaverse - Ảnh: Meta Facebook"><img alt="Big Tech bắt tay phát triển tiêu chuẩn cho vũ trụ ảo, có giống World Wide Web? - Ảnh 1." id="img_99588bf0-f1e3-11ec-8a6e-1b03632c0a88" src="https://cdn.tuoitre.vn/thumb_w/586/2022/6/22/meta-16558720362962086809519.jpg" title="Big Tech bắt tay phát triển tiêu chuẩn cho vũ trụ ảo, có giống World Wide Web? - Ảnh 1." /></a></p>

<p>Meta đặt cược lớn v&agrave;o vũ trụ ảo metaverse - Ảnh: Meta Facebook</p>

<p>Trong tuy&ecirc;n bố ng&agrave;y 21-6, nh&oacute;m Metaverse Standards Forum (MSF) cho biết tham gia c&ograve;n c&oacute; nhiều c&ocirc;ng ty lớn trong lĩnh vực kh&ocirc;ng gian, sản xuất chip như Nvidia, Qualcomm, c&ocirc;ng ty game Epic Games, c&aacute;c tổ chức như World Wide Web Consortium (W3C)...</p>

<p>H&atilde;ng tin Reuters dẫn lời &ocirc;ng Neil Trevett, một l&atilde;nh đạo của Nvidia, diễn đ&agrave;n nhằm kết nối c&aacute;c ti&ecirc;u chuẩn giữa nhiều tổ chức v&agrave; c&ocirc;ng ty để mang lại &quot;khả năng tương t&aacute;c thế giới thực&quot; trong metaverse.</p>

<p>MSF được cho l&agrave; sẽ th&uacute;c đẩy c&aacute;c ti&ecirc;u chuẩn mở, c&oacute; t&iacute;nh tương t&aacute;c cho c&ocirc;ng nghệ thực tế ảo, kh&ocirc;ng gian địa l&yacute; v&agrave; 3D. C&aacute;c ti&ecirc;u chuẩn mở sẽ gi&uacute;p c&aacute;c nh&agrave; ph&aacute;t triển dễ d&agrave;ng x&acirc;y dựng c&ugrave;ng một nội dung tr&ecirc;n nhiều nền tảng kh&aacute;c nhau, hoặc người d&ugrave;ng c&oacute; thể chuyển dữ liệu từ dịch vụ n&agrave;y sang dịch vụ kh&aacute;c.</p>

<p>&quot;C&aacute;c nh&agrave; l&atilde;nh đạo trong ng&agrave;nh cho rằng tiềm năng của metaverse sẽ được hiện thực h&oacute;a tốt nhất nếu n&oacute; được x&acirc;y dựng tr&ecirc;n nền tảng c&aacute;c ti&ecirc;u chuẩn mở&quot;, tuy&ecirc;n bố của nh&oacute;m cho biết.</p>

<p>Tuy nhi&ecirc;n, ti&ecirc;u chuẩn chung kh&ocirc;ng c&oacute; nghĩa l&agrave; c&aacute;c c&ocirc;ng ty sẽ tạo ra c&aacute;c vũ trụ li&ecirc;n kết như c&aacute;ch hoạt động của World Wide Web.</p>

<p>C&aacute;c c&ocirc;ng ty đang chạy đua ph&aacute;t triển metaverse, trong đ&oacute; Meta dự kiến tung ra thiết bị đeo thực tế ảo Cambria trong năm nay. Meta (c&ocirc;ng ty mẹ của Facebook) đặt cược tương lai v&agrave;o metaverse v&agrave; đ&atilde; đầu tư rất lớn v&agrave;o vũ trụ ảo. C&ocirc;ng ty n&agrave;y cho biết sẽ chi &iacute;t nhất 10 tỉ USD trong năm nay để nghi&ecirc;n cứu v&agrave; ph&aacute;t triển c&ocirc;ng nghệ thực tế ảo, trong đ&oacute; gồm nhiều thiết bị k&iacute;nh đeo.</p>

<p>Trong khi đ&oacute;, Apple cũng đang ph&aacute;t triển thực tế ảo v&agrave; c&oacute; thể bước v&agrave;o cuộc chơi cũng với một thiết bị đeo thực tế ảo.</p>
', 1, NULL, NULL, 3)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (45, 2, N'Lầu Năm Góc hợp tác với SpaceX phát triển ''tàu vũ trụ quân sự''', N'https://cdn.tuoitre.vn/thumb_w/586/2022/6/22/photo-1-16558684126461076796050.jpg', CAST(N'2021-05-19T01:21:18.750' AS DateTime), N'<p>22 13:39 GMT+7</p>

<p><a href="javascript:;" rel="nofollow" title="Thích"><strong>7</strong></a><a href="javascript:void(0);" rel="nofollow" title="Bình luận"><strong>0</strong></a><a href="javascript:;" rel="nofollow" title="Lưu"><strong>Lưu</strong></a></p>

<h2>TTO - C&ocirc;ng ty vũ trụ SpaceX của tỉ ph&uacute; Elon Musk sẽ bắt đầu x&acirc;y dựng &quot;t&agrave;u vũ trụ qu&acirc;n sự&quot; Starship theo kế hoạch mới của Lầu Năm G&oacute;c (Bộ Quốc ph&ograve;ng Mỹ).</h2>

<ul>
	<li><a href="https://tuoitre.vn/tau-vu-tru-moi-nhat-cua-spacex-phat-no-sau-khi-ha-canh-2021030410040617.htm" title="Tàu vũ trụ mới nhất của SpaceX phát nổ sau khi hạ cánh">T&agrave;u vũ trụ mới nhất của SpaceX ph&aacute;t nổ sau khi hạ c&aacute;nh</a></li>
	<li><a href="https://tuoitre.vn/tau-vu-tru-cua-spacex-ket-noi-thanh-cong-voi-iss-20201117151547248.htm" title="Tàu vũ trụ của SpaceX kết nối thành công với ISS">T&agrave;u vũ trụ của SpaceX kết nối th&agrave;nh c&ocirc;ng với ISS</a></li>
	<li><a href="https://tuoitre.vn/indonesia-de-nghi-duoc-lam-diem-phong-tau-vu-tru-cho-spacex-20201212215947687.htm" title="Indonesia đề nghị được làm điểm phóng tàu vũ trụ cho SpaceX">Indonesia đề nghị được l&agrave;m điểm ph&oacute;ng t&agrave;u vũ trụ cho SpaceX</a></li>
</ul>

<p><a href="https://cdn.tuoitre.vn/2022/6/22/photo-1-16558684126461076796050.jpg" target="_blank" title="Lầu Năm Góc sẽ sử dụng tàu vũ trụ này cho hoạt động quân sự của Mỹ - Ảnh: ALAMY STOCK"><img alt="Lầu Năm Góc hợp tác với SpaceX phát triển tàu vũ trụ quân sự - Ảnh 1." id="img_2927f8a0-f1db-11ec-8a6e-1b03632c0a88" src="https://cdn.tuoitre.vn/thumb_w/586/2022/6/22/photo-1-16558684126461076796050.jpg" title="Lầu Năm Góc hợp tác với SpaceX phát triển tàu vũ trụ quân sự - Ảnh 1." /></a></p>

<p>Lầu Năm G&oacute;c sẽ sử dụng t&agrave;u vũ trụ n&agrave;y cho hoạt động qu&acirc;n sự của Mỹ - Ảnh: ALAMY STOCK</p>

<p>Theo một b&aacute;o c&aacute;o nội bộ của qu&acirc;n đội Mỹ được c&ocirc;ng bố h&ocirc;m 20-6, Lầu Năm G&oacute;c sẽ hợp t&aacute;c với Tập đo&agrave;n SpaceX để ph&oacute;ng &quot;t&agrave;u vũ trụ qu&acirc;n sự&quot; Starship v&agrave;o kh&ocirc;ng gian, nhằm hỗ trợ nhanh ch&oacute;ng c&aacute;c hoạt động qu&acirc;n sự của Mỹ ở khắp nơi tr&ecirc;n h&agrave;nh tinh, Đ&agrave;i Russia Today cho biết.</p>

<p>Trước đ&oacute;, Tập đo&agrave;n SpaceX v&agrave; Bộ Chỉ huy vận tải Mỹ (TRANSCOM) đ&atilde; k&yacute; kết một thỏa thuận hợp t&aacute;c v&agrave;o năm 2020. Tuy nhi&ecirc;n, đến nay c&aacute;c &quot;t&agrave;u vũ trụ qu&acirc;n sự&quot; Starship vẫn chưa đi v&agrave;o hoạt động thực tế.</p>

<p>Mục ti&ecirc;u hợp t&aacute;c trước mắt giữa Lầu Năm G&oacute;c v&agrave; SpaceX l&agrave; t&agrave;u Starship c&oacute; thể tiếp nhi&ecirc;n liệu ở bất kỳ đ&acirc;u tr&ecirc;n thế giới trong v&ograve;ng 60 ph&uacute;t m&agrave; kh&ocirc;ng cần đến m&aacute;y bay chở h&agrave;ng. Điều n&agrave;y sẽ mang đến cho qu&acirc;n đội Mỹ một c&ocirc;ng cụ phản ứng nhanh.&nbsp;</p>

<p>Bộ Chỉ huy vận tải thuộc Lầu Năm G&oacute;c cho biết họ c&oacute; thể &quot;nhanh ch&oacute;ng di chuyển c&aacute;c hoạt động hậu cần quan trọng, trong c&aacute;c trường hợp khẩn cấp về thời gian v&agrave; hỗ trợ nh&acirc;n đạo&quot;.</p>

<p>Theo trang tin&nbsp;<em>Dailystar</em>, b&aacute;o c&aacute;o x&aacute;c định 3 c&aacute;ch sử dụng tiềm năng của t&agrave;u vũ trụ qu&acirc;n sự, bao gồm: t&agrave;u Starship giao h&agrave;ng hậu cần nhanh ch&oacute;ng trong trường hợp xung đột với Trung Quốc ở Th&aacute;i B&igrave;nh Dương.</p>

<p>Ngo&agrave;i ra, t&agrave;u Starship c&ograve;n l&agrave; căn cứ tr&uacute; ẩn của lực lượng kh&ocirc;ng qu&acirc;n Mỹ. Theo đ&oacute;, kh&ocirc;ng qu&acirc;n Mỹ c&oacute; thể được thả xuống ở bất kỳ đ&acirc;u tr&ecirc;n thế giới một c&aacute;ch nhanh ch&oacute;ng.</p>

<p>Cuối c&ugrave;ng l&agrave; &quot;c&aacute;c kịch bản hỗ trợ c&aacute;c đại sứ qu&aacute;n&quot;, trong đ&oacute; t&agrave;u Starship c&oacute; thể được sử dụng cho &quot;lực lượng phản ứng nhanh&quot; nếu đại sứ qu&aacute;n bị tấn c&ocirc;ng.</p>

<p>Trong khi SpaceX chưa b&igrave;nh luận về c&acirc;u chuyện n&agrave;y, người ph&aacute;t ng&ocirc;n của TRANSCOM, &ocirc;ng John Ross n&oacute;i với trang tin&nbsp;<em>Intercept&nbsp;</em>qu&acirc;n đội Mỹ tin rằng một lực lượng phản ứng nhanh bằng t&ecirc;n lửa sẽ được triển khai &quot;khả thi trong v&ograve;ng 5-10 năm tới&quot;.</p>

<p>T&agrave;u vũ trụ Starship vẫn đang trong giai đoạn thử nghiệm. Th&aacute;ng 5-2021, nguy&ecirc;n mẫu của t&agrave;u đ&atilde; hạ c&aacute;nh th&agrave;nh c&ocirc;ng lần đầu ti&ecirc;n sau loạt thử nghiệm thất bại. Ngo&agrave;i những th&aacute;ch thức về kỹ thuật, gi&aacute;m đốc điều h&agrave;nh SpaceX Elon Musk c&ograve;n gặp kh&oacute; khăn với qu&aacute; tr&igrave;nh xin giấy ph&eacute;p ph&oacute;ng thử nghiệm tại bang Texas.</p>

<p>Tuần trước, Cục H&agrave;ng kh&ocirc;ng li&ecirc;n bang Mỹ (FAA) đ&atilde; ph&ecirc; duyệt sơ bộ cho SpaceX về vấn đề t&aacute;c động m&ocirc;i trường đối với chương tr&igrave;nh t&ecirc;n lửa v&agrave; t&agrave;u vũ trụ Starship. Tuy nhi&ecirc;n, để c&oacute; được giấy ph&eacute;p ph&ecirc; duyệt đầy đủ, c&ocirc;ng ty sẽ phải đ&aacute;p ứng 74 y&ecirc;u cầu kh&aacute;c, theo k&ecirc;nh&nbsp;<em>National Geographic</em>.</p>
', 0, NULL, NULL, 2)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (46, 4, N'Siêu máy tính mạnh nhất châu Âu đặt ở đâu?', N'https://cdn.tuoitre.vn/thumb_w/586/2022/6/14/b96e12d3-8ac6-45c4-a85f-b83a9f6198b2-1655191557273777088825.jpeg', CAST(N'2021-09-19T01:21:18.750' AS DateTime), N'<h2>TTO - Si&ecirc;u m&aacute;y t&iacute;nh mạnh nhất ch&acirc;u &Acirc;u vừa được ra mắt v&agrave;o ng&agrave;y 13-6 tại Kajaani, Phần Lan. M&aacute;y t&iacute;nh n&agrave;y đ&oacute;ng vai tr&ograve; nền tảng cho nghi&ecirc;n cứu v&agrave; ph&aacute;t triển tr&iacute; tuệ nh&acirc;n tạo v&agrave; c&ocirc;ng nghệ lượng tử.</h2>

<ul>
	<li><a href="https://congnghe.tuoitre.vn/nhat-ban-dung-sieu-may-tinh-va-ai-de-canh-bao-nhanh-song-than-20210222121109477.htm" title="Nhật Bản dùng siêu máy tính và AI để cảnh báo nhanh sóng thần">Nhật Bản d&ugrave;ng si&ecirc;u m&aacute;y t&iacute;nh v&agrave; AI để cảnh b&aacute;o nhanh s&oacute;ng thần</a></li>
	<li><a href="https://congnghe.tuoitre.vn/sieu-may-tinh-du-doan-anh-thang-duc-vao-chung-ket-roi-thua-phap-2021062521562296.htm" title="Siêu máy tính dự đoán: Anh thắng Đức, vào chung kết rồi... thua Pháp">Si&ecirc;u m&aacute;y t&iacute;nh dự đo&aacute;n: Anh thắng Đức, v&agrave;o chung kết rồi... thua Ph&aacute;p</a></li>
	<li><a href="https://congnghe.tuoitre.vn/thai-lan-mua-sieu-may-tinh-hieu-qua-nhat-dong-nam-a-co-the-phan-tich-bien-the-sars-cov-2-20211201135054723.htm" title="Thái Lan mua siêu máy tính hiệu quả nhất Đông Nam Á, có thể phân tích biến thể SARS-CoV-2">Th&aacute;i Lan mua si&ecirc;u m&aacute;y t&iacute;nh hiệu quả nhất Đ&ocirc;ng Nam &Aacute;, c&oacute; thể ph&acirc;n t&iacute;ch biến thể SARS-CoV-2</a></li>
</ul>

<p><a href="https://cdn.tuoitre.vn/2022/6/14/b96e12d3-8ac6-45c4-a85f-b83a9f6198b2-1655191557273777088825.jpeg" target="_blank" title="LUMI là siêu máy tính đẳng cấp thế giới - Ảnh minh họa: LUMI Supercomputer"><img alt="Siêu máy tính mạnh nhất châu Âu đặt ở đâu? - Ảnh 1." id="img_3c00c700-ebb3-11ec-a105-4787cbeec816" src="https://cdn.tuoitre.vn/thumb_w/586/2022/6/14/b96e12d3-8ac6-45c4-a85f-b83a9f6198b2-1655191557273777088825.jpeg" title="Siêu máy tính mạnh nhất châu Âu đặt ở đâu? - Ảnh 1." /></a></p>

<p>LUMI l&agrave; si&ecirc;u m&aacute;y t&iacute;nh đẳng cấp thế giới - Ảnh minh họa: LUMI Supercomputer</p>

<p>Đ&acirc;y l&agrave;&nbsp;<a href="https://tuoitre.vn/sieu-may-tinh.html" target="_blank" title="siêu máy tính">si&ecirc;u m&aacute;y t&iacute;nh</a>&nbsp;đẳng cấp thế giới, c&oacute; t&ecirc;n gọi l&agrave; LUMI, thuộc sở hữu của Tập đo&agrave;n EuroHPC Joint Undertaking (EuroHPC JU).</p>

<p>Ph&oacute; chủ tịch điều h&agrave;nh của Ủy ban ch&acirc;u &Acirc;u, b&agrave; Margarethe Vestager, m&ocirc; tả si&ecirc;u m&aacute;y t&iacute;nh l&agrave; một bước tiến quan trọng trong qu&aacute; tr&igrave;nh chuyển đổi kỹ thuật số v&agrave; xanh của ch&acirc;u &Acirc;u. Theo b&agrave;, quyền tự chủ kỹ thuật số sẽ phụ thuộc v&agrave;o việc l&agrave;m chủ thế hệ si&ecirc;u m&aacute;y t&iacute;nh tiếp theo.</p>

<p>Ph&oacute; chủ tịch điều h&agrave;nh Ủy ban ch&acirc;u &Acirc;u cho biết 3 năm trước, EU đ&atilde; mua 8 si&ecirc;u m&aacute;y t&iacute;nh v&agrave; hơn 50% số m&aacute;y n&agrave;y đang hoạt động. C&aacute;c m&aacute;y t&iacute;nh c&ograve;n lại dự kiến đi v&agrave;o hoạt động v&agrave;o cuối năm nay.</p>

<p>LUMI c&oacute; tốc độ nhanh hơn 7 lần so với c&aacute;c si&ecirc;u m&aacute;y t&iacute;nh mạnh nhất ở ch&acirc;u &Acirc;u hiện nay, v&agrave; l&agrave; một trong những nền tảng h&agrave;ng đầu cho tr&iacute; tuệ nh&acirc;n tạo tr&ecirc;n to&agrave;n cầu.</p>

<p>EuroHPC cho biết khả năng t&iacute;nh to&aacute;n khổng lồ của LUMI chủ yếu dựa tr&ecirc;n nhiều bộ xử l&yacute; đồ họa hay c&ograve;n gọi l&agrave; bộ xử l&yacute; GPU, đặc biệt th&iacute;ch hợp để sử dụng với c&aacute;c phương ph&aacute;p tr&iacute; tuệ nh&acirc;n tạo kh&aacute;c nhau.</p>

<p>LUMI hiện l&agrave; một trong những si&ecirc;u m&aacute;y t&iacute;nh h&agrave;ng đầu tr&ecirc;n to&agrave;n cầu v&agrave; hoạt động bằng năng lượng thủy điện t&aacute;i tạo. Lượng nhiệt thải m&agrave; m&aacute;y t&iacute;nh tạo ra sẽ cung cấp 20% lượng nhiệt cho th&agrave;nh phố Kajaani.</p>
', 0, NULL, NULL, 3)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (47, 2, N'Amazon sắp giao hàng bằng thiết bị bay không người lái', N'https://cdn.tuoitre.vn/thumb_w/586/2022/6/14/b2671f95-6805-441d-8813-e7de71a237d1-prime-air-1655182580309342673778.jpg', CAST(N'2021-01-19T01:21:18.750' AS DateTime), N'<h2>TTO - Ng&agrave;y 13-6, Tập đo&agrave;n thương mại điện tử Amazon th&ocirc;ng b&aacute;o ra mắt dịch vụ giao h&agrave;ng bằng thiết bị bay kh&ocirc;ng người l&aacute;i tại California, Mỹ, v&agrave;o cuối năm nay.</h2>

<ul>
	<li><a href="https://congnghe.tuoitre.vn/them-mot-ceo-roi-amazon-20220604071212415.htm" title="Thêm một CEO rời Amazon">Th&ecirc;m một CEO rời Amazon</a></li>
	<li><a href="https://congnghe.tuoitre.vn/co-5g-dieu-hanh-xai-dien-on-ap-hon-20220614094713163.htm" title="Có 5G điều hành, xài điện ''ổn áp'' hơn">C&oacute; 5G điều h&agrave;nh, x&agrave;i điện &#39;ổn &aacute;p&#39; hơn</a></li>
	<li><a href="https://congnghe.tuoitre.vn/gia-bitcoin-thung-24-000-usd-dong-mat-65-gia-tri-ke-tu-thang-11-2021-20220613174847152.htm" title="Giá bitcoin ''thủng'' 24.000 USD/đồng, mất 65% giá trị kể từ tháng 11-2021">Gi&aacute; bitcoin &#39;thủng&#39; 24.000 USD/đồng, mất 65% gi&aacute; trị kể từ th&aacute;ng 11-2021</a></li>
</ul>

<p><a href="https://cdn.tuoitre.vn/2022/6/14/b2671f95-6805-441d-8813-e7de71a237d1-prime-air-1655182580309342673778.jpg" target="_blank" title="Amazon chuẩn bị ra mắt dịch vụ giao hàng bằng thiết bị bay không người lái tại thành phố California, Mỹ - Ảnh: AMAZON"><img alt="Amazon sắp giao hàng bằng thiết bị bay không người lái - Ảnh 1." id="img_558d0c70-eb9e-11ec-8a6e-1b03632c0a88" src="https://cdn.tuoitre.vn/thumb_w/586/2022/6/14/b2671f95-6805-441d-8813-e7de71a237d1-prime-air-1655182580309342673778.jpg" title="Amazon sắp giao hàng bằng thiết bị bay không người lái - Ảnh 1." /></a></p>

<p>Amazon chuẩn bị ra mắt dịch vụ giao h&agrave;ng bằng thiết bị bay kh&ocirc;ng người l&aacute;i tại th&agrave;nh phố California, Mỹ - Ảnh: AMAZON</p>

<p>Theo Amazon, kh&aacute;ch h&agrave;ng ở thị trấn Lockeford, Bắc California, c&oacute; thể đăng k&yacute; giao h&agrave;ng miễn ph&iacute; bằng m&aacute;y bay kh&ocirc;ng người l&aacute;i &quot;Prime Air&quot;.</p>

<p>C&aacute;c mặt h&agrave;ng &quot;đủ điều kiện bay&quot; sẽ được đ&oacute;ng g&oacute;i v&agrave; vận chuyển bằng m&aacute;y bay kh&ocirc;ng người l&aacute;i đến địa chỉ giao h&agrave;ng, dừng ở độ cao an to&agrave;n để kh&aacute;ch h&agrave;ng k&yacute; nhận.</p>

<p>Người ph&aacute;t ng&ocirc;n của Amazon cho biết m&aacute;y bay kh&ocirc;ng người l&aacute;i c&oacute; thể mang những g&oacute;i h&agrave;ng c&oacute; trọng lượng l&ecirc;n tới khoảng 2,2kg với k&iacute;ch thước bằng một hộp đựng gi&agrave;y lớn.</p>

<p>C&aacute;c mặt h&agrave;ng được vận chuyển bằng h&igrave;nh thức n&agrave;y bao gồm c&aacute;c sản phẩm gia dụng, đồ l&agrave;m đẹp, đồ d&ugrave;ng văn ph&ograve;ng v&agrave; thiết bị c&ocirc;ng nghệ.</p>
', 0, NULL, NULL, 3)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (49, 3, N'Hóa thạch cá nhà táng bị cá mập cắn mũi
', N'https://i1-vnexpress.vnecdn.net/2022/06/29/Capture-JPG-3729-1656473705.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=KlQf8tjPin_4faYiXj6LWQ', CAST(N'2021-02-19T01:21:18.750' AS DateTime), N'<p>PERUC&aacute;c nh&agrave; nghi&ecirc;n cứu ph&aacute;t hiện tổ ti&ecirc;n của c&aacute; mập rất th&iacute;ch ăn mũi của c&aacute; nh&agrave; t&aacute;ng cổ đại do lượng chất b&eacute;o lớn, theo b&agrave;i b&aacute;o c&ocirc;ng bố tr&ecirc;n tạp ch&iacute; Proceedings of the Royal Society B.</p>

<p><img alt="Mô phỏng xác cá nhà táng bị cá mập ăn. Ảnh: Jaime Bran" src="https://i1-vnexpress.vnecdn.net/2022/06/29/Capture-JPG-3729-1656473705.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=Y82j2dzz6hpRxBYzy9Lc0w" /></p>

<p>M&ocirc; phỏng x&aacute;c c&aacute; nh&agrave; t&aacute;ng bị c&aacute; mập ăn. Ảnh:&nbsp;<em>Jaime Bran</em></p>

<p>C&aacute; nh&agrave; t&aacute;ng c&oacute; cơ quan mũi lớn chứa nhiều chất b&eacute;o, d&ugrave;ng để tạo ra &acirc;m thanh như tiếng k&ecirc;u v&agrave; t&iacute;n hiệu s&oacute;ng &acirc;m để định vị bằng tiếng vang. Aldo Benites-Palomino, nghi&ecirc;n cứu sinh tiến sĩ ở Đại học Zurich v&agrave; cộng sự ph&acirc;n t&iacute;ch vết cắn tr&ecirc;n một số hộp sọ c&aacute; nh&agrave; t&aacute;ng h&oacute;a thạch từ thế Trung T&acirc;n ở th&agrave;nh hệ Pisco tại Peru, c&oacute; ni&ecirc;n đại từ 5 đến 7 triệu năm. Vết cắn ph&ugrave; hợp với h&agrave;m của nhiều lo&agrave;i c&aacute; mập cổ đại tập trung ở khu vực cạnh cơ quan mũi tr&ecirc;n hộp sọ c&aacute; nh&agrave; t&aacute;ng, chủ yếu ở xương h&agrave;m tr&ecirc;n v&agrave; v&ugrave;ng quanh mắt. Điều n&agrave;y h&eacute; lộ sự ưa th&iacute;ch của c&aacute; mập trong v&ugrave;ng đối với khu vực tr&ecirc;n cơ thể c&aacute; voi.</p>

<p>&quot;Mũi của c&aacute; nh&agrave; t&aacute;ng hiện đại l&agrave; một trong bộ phận tập trung nhiều dầu v&agrave; chất b&eacute;o nhất trong tự nhi&ecirc;n, thuộc tổ hợp mũi&quot;, Benites-Palomino cho biết.</p>

<p>Trong khi hộp sọ c&aacute; nh&agrave; t&aacute;ng h&oacute;a thạch kh&ocirc;ng chứa bất kỳ m&ocirc; mềm n&agrave;o bởi chất b&eacute;o kh&ocirc;ng thể tồn tại sau h&agrave;ng triệu năm, từ h&igrave;nh d&aacute;ng hộp sọ, nh&oacute;m nghi&ecirc;n cứu suy đo&aacute;n mũi c&aacute; nh&agrave; t&aacute;ng cổ đại cũng chứa chất b&eacute;o, trở th&agrave;nh bữa ăn ho&agrave;n hảo đối với c&aacute; mập. &quot;Họ c&aacute; nh&agrave; t&aacute;ng si&ecirc;u đa dạng với &iacute;t nhất 7 lo&agrave;i đ&atilde; biết từ v&ugrave;ng Pisco. Ch&uacute;ng tạo th&agrave;nh một nguồn thức ăn l&yacute; tưởng&quot;, Benites-Palomino n&oacute;i.</p>

<p>Ở thời hiện đại, c&aacute; mập cũng nổi tiếng th&iacute;ch ăn bộ phận với mật độ chất b&eacute;o cao như mỡ ở bụng c&aacute; voi chết. Nghi&ecirc;n cứu n&agrave;y h&eacute; lộ sở th&iacute;ch tr&ecirc;n đ&atilde; k&eacute;o d&agrave;i h&agrave;ng triệu năm v&agrave; c&aacute; mập ph&aacute;t hiện nơi chứa nhiều chất b&eacute;o nhất tr&ecirc;n cơ thể c&aacute; nh&agrave; t&aacute;ng l&agrave; v&ugrave;ng mũi.</p>

<p>C&aacute; mập kh&ocirc;ng săn c&aacute; nh&agrave; t&aacute;ng để ăn phần mũi m&agrave; thường ăn x&aacute;c tr&ocirc;i nổi của ch&uacute;ng trước khi ch&igrave;m xuống đ&aacute;y biển. C&aacute;i x&aacute;c thường tr&ocirc;i nổi nhiều ng&agrave;y cho tới khi tất cả chất b&eacute;o bị c&aacute; mập ti&ecirc;u thụ hết, Benites-Palomino cho biết. Theo nghi&ecirc;n cứu, h&igrave;nh dạng, k&iacute;ch thước v&agrave; dấu răng của vết cắn rất đa dạng. Lo&agrave;i c&aacute; mập phổ biến nhất sống gần Peru v&agrave;o thời kỳ đ&oacute; bao gồm c&aacute; mập mako, c&aacute; mập trắng, c&aacute; mập c&aacute;t v&agrave; c&aacute; mập megalodon khổng lồ.</p>
', 1, NULL, NULL, 4)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (50, 3, N'Côn trùng bản địa duy nhất ở Nam Cực có thể tuyệt chủng', N'https://i1-vnexpress.vnecdn.net/2022/06/29/Ruoi-nhue-1911-1656478338.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=d8nqiVcRDN6zlY6k5Spcmw', CAST(N'2022-04-19T01:21:18.750' AS DateTime), N'<p>T&igrave;nh huống m&ocirc; phỏng trong nghi&ecirc;n cứu cho thấy, nhiệt độ m&ugrave;a đ&ocirc;ng tăng l&ecirc;n 2 độ C c&oacute; thể giảm khả năng sống s&oacute;t của ruồi nhuế Nam Cực.</p>

<p><img alt="Ruồi nhuế Nam Cực thích nghi với môi trường sống khắc nghiệt. Ảnh: Ben Philip" src="https://i1-vnexpress.vnecdn.net/2022/06/29/Ruoi-nhue-1911-1656478338.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=CwWU8UC8eLd3OixHjsuL4w" /></p>

<p>Ruồi nhuế Nam Cực th&iacute;ch nghi với m&ocirc;i trường sống khắc nghiệt. Ảnh:&nbsp;<em>Ben Philip</em></p>

<p>Ruồi nhuế Nam Cực, lo&agrave;i c&ocirc;n tr&ugrave;ng bản địa duy nhất được biết đến ở ch&acirc;u Nam Cực, đang bị đẩy tới bờ vực tuyệt chủng do kh&iacute; hậu ấm l&ecirc;n, từ đ&oacute; c&oacute; thể khiến lưới thức ăn của lục địa n&agrave;y thay đổi, theo nghi&ecirc;n cứu xuất bản tr&ecirc;n tạp ch&iacute;&nbsp;<em>Functional Ecology&nbsp;</em>h&ocirc;m 12/6.</p>

<p>Ruồi nhuế Nam Cực l&agrave; lo&agrave;i c&ocirc;n tr&ugrave;ng kh&ocirc;ng biết bay với k&iacute;ch thước nhỏ hơn hạt đậu. Ch&uacute;ng đ&atilde; tiến h&oacute;a để tồn tại trong những điều kiện v&ocirc; c&ugrave;ng khắc nghiệt. Theo nh&oacute;m nghi&ecirc;n cứu, trong đ&oacute; c&oacute; chuy&ecirc;n gia Jack Devlin tại Đại học Kentucky, Mỹ, m&ugrave;a đ&ocirc;ng trong v&ugrave;ng ấm l&ecirc;n đang đe dọa đến sự tồn tại của ch&uacute;ng.</p>

<p>Lo&agrave;i vật n&agrave;y ho&agrave;n th&agrave;nh v&ograve;ng đời trong khoảng hai năm, trong đ&oacute; phần lớn thời gian l&agrave; ở dạng ấu tr&ugrave;ng. Trong nghi&ecirc;n cứu mới, nh&oacute;m chuy&ecirc;n gia đ&aacute;nh gi&aacute; phản ứng của ấu tr&ugrave;ng với m&ugrave;a đ&ocirc;ng m&ocirc; phỏng k&eacute;o d&agrave;i khoảng s&aacute;u th&aacute;ng với 3 t&igrave;nh huống nhiệt l&agrave; ấm (-1 độ C), b&igrave;nh thường (-3 độ C) v&agrave; lạnh (- 5 độ C). Với mỗi t&igrave;nh huống, họ đặt ấu tr&ugrave;ng v&agrave;o 3 kiểu m&ocirc;i trường ri&ecirc;ng biệt m&agrave; ch&uacute;ng thường sinh sống gồm vật chất hữu cơ đang ph&acirc;n hủy, r&ecirc;u sống v&agrave; tảo&nbsp;<em>Prasiola crispa</em>.</p>

<p>Theo d&otilde;i c&aacute;c giai đoạn m&ugrave;a đ&ocirc;ng m&ocirc; phỏng, nh&oacute;m nh&agrave; khoa học đo lường khả năng sống s&oacute;t, sự vận động, tổn thương m&ocirc;, mức dự trữ năng lượng v&agrave; phản ứng căng thẳng ph&acirc;n tử của ấu tr&ugrave;ng. Kết quả, việc m&ugrave;a đ&ocirc;ng ấm l&ecirc;n 2 độ C c&oacute; thể l&agrave;m giảm tỷ lệ sống s&oacute;t của c&ocirc;n tr&ugrave;ng, đồng thời giảm mức dự trữ năng lượng. Sự thiếu hụt năng lượng c&oacute; thể ảnh hưởng ti&ecirc;u cực đến sự ph&aacute;t triển v&agrave; sinh sản về sau.</p>

<p>Nếu ấu tr&ugrave;ng đốt ch&aacute;y nhiều năng lượng dự trữ hơn khi m&ugrave;a đ&ocirc;ng ấm l&ecirc;n th&igrave; cuối c&ugrave;ng, ch&uacute;ng sẽ tuyệt chủng ở một số h&ograve;n đảo nhất định, theo nh&agrave; c&ocirc;n tr&ugrave;ng học Joshua Benoit tại Đại học Cincinnati. Ch&acirc;u Nam Cực c&oacute; rất &iacute;t lo&agrave;i chỉ sinh sống tr&ecirc;n cạn n&ecirc;n việc mất đi lo&agrave;i ruồi nhuế bản địa cũng c&oacute; thể l&agrave;m thay đổi mạng lưới thức ăn của lục địa n&agrave;y.</p>

<p>&quot;Theo ch&uacute;ng t&ocirc;i biết, đ&acirc;y l&agrave; nghi&ecirc;n cứu đầu ti&ecirc;n m&ocirc; phỏng đủ độ d&agrave;i của m&ugrave;a đ&ocirc;ng v&agrave; x&aacute;c định tổn thất sinh l&yacute; trong c&aacute;c m&ocirc;i trường m&ugrave;a đ&ocirc;ng kh&aacute;c nhau ở động vật ch&acirc;n khớp ch&acirc;u Nam Cực. Kết quả cho thấy m&ugrave;a đ&ocirc;ng tiếp tục ấm l&ecirc;n ở B&aacute;n đảo Nam Cực c&oacute; thể t&aacute;c động xấu đến những lo&agrave;i vật kh&ocirc;ng xương sống vốn th&iacute;ch nghi với c&aacute;i lạnh v&agrave; c&aacute;c cộng đồng li&ecirc;n quan sống tr&ecirc;n cạn&quot;, nh&oacute;m nghi&ecirc;n cứu cho biết.</p>
', 1, NULL, NULL, 4)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (51, 3, N'Đàn cá voi sát thủ nuôi cá voi hoa tiêu non', N'https://i1-vnexpress.vnecdn.net/2022/06/29/VNE-Pod-JPG-2914-1656477786.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=tFS8jM-hKbMKpTkFFt-Hjw', CAST(N'2022-05-19T01:21:18.750' AS DateTime), N'2022-04-19 01:21:18.750', 1, NULL, NULL, 4)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (52, 3, N'Tàu vũ trụ Mỹ lần đầu nâng trạm ISS thành công', N'https://i1-vnexpress.vnecdn.net/2022/06/29/Tau-Cygnus-6116-1656473511.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=56TNhQryGsyGqCAF_klPjQ', CAST(N'2022-05-29T01:21:18.750' AS DateTime), N'<p>T&agrave;u Cygnus-17 của c&ocirc;ng ty Mỹ Northrop Grumman lần đầu ti&ecirc;n n&acirc;ng th&agrave;nh c&ocirc;ng Trạm Vũ trụ Quốc tế (ISS), đưa trạm l&ecirc;n độ cao khoảng 400 km h&ocirc;m 25/6.</p>

<p><img alt="Tàu chở hàng Cygnus NG-17 của Northrop Grumman gắn với cánh tay robot của trạm ISS trước khi tách ra hôm 28/6. Ảnh: NASA TV" src="https://i1-vnexpress.vnecdn.net/2022/06/29/Tau-Cygnus-6116-1656473511.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=HsP85VD35p54KJF8-gZz6A" /></p>

<p>T&agrave;u chở h&agrave;ng Cygnus-17 của Northrop Grumman gắn với c&aacute;nh tay robot của trạm ISS trước khi t&aacute;ch ra h&ocirc;m 28/6. Ảnh:&nbsp;<em>NASA TV</em></p>

<p>Sự kiện h&ocirc;m 25/6 đ&aacute;nh dấu lần đầu ti&ecirc;n t&agrave;u Cygnus thực hiện quy tr&igrave;nh đầy đủ nhằm n&acirc;ng trạm ISS. Trước đ&oacute;, con t&agrave;u đ&atilde; thử n&acirc;ng trạm h&ocirc;m 20/6, nhưng thử nghiệm&nbsp;<a href="https://vnexpress.net/tau-vu-tru-my-that-bai-trong-thu-nghiem-nang-tram-iss-4479599.html" rel="dofollow">bị hủy bỏ</a>&nbsp;chỉ sau 5 gi&acirc;y.</p>

<p>H&ocirc;m 25/6, t&agrave;u Cygnus-17 đ&atilde; khai hỏa động cơ để đẩy trạm vũ trụ l&ecirc;n 0,16 km ở điểm xa Tr&aacute;i Đất nhất v&agrave; 0,8 km ở điểm gần Tr&aacute;i Đất nhất. C&aacute;c thao t&aacute;c điều chỉnh quỹ đạo n&agrave;y được thực hiện thường xuy&ecirc;n v&agrave; cần thiết để chống lại lực k&eacute;o m&agrave; ISS phải chịu do bay qua lớp kh&iacute; quyển tr&ecirc;n của Tr&aacute;i Đất, khiến trạm dần hạ thấp theo thời gian.</p>

<p>T&agrave;u Cygnus-17 ph&oacute;ng l&ecirc;n kh&ocirc;ng gian ng&agrave;y 19/2 từ Cơ sở Bay Wallops của NASA tr&ecirc;n đảo Wallops, Virginia, mang theo 3.765 kg gồm c&aacute;c bộ th&iacute; nghiệm khoa học, thực phẩm v&agrave; nhiều h&agrave;ng h&oacute;a kh&aacute;c. Con t&agrave;u cập bến trạm ISS hai ng&agrave;y sau với sự hỗ trợ của c&aacute;nh tay robot.</p>

<p>T&agrave;u chở h&agrave;ng Cygnus c&oacute; chiều d&agrave;i 5,1 m v&agrave; đường k&iacute;nh hơn 3 m. Mỗi chiếc Cygnus c&oacute; sức chở khoảng 3.000 kg. 18 t&agrave;u Cygnus đ&atilde; được ph&oacute;ng l&ecirc;n kh&ocirc;ng gian từ năm 2013, trong đ&oacute; c&oacute; một chuyến bay thất bại năm 2014.</p>

<p>Northrop Grumman đ&atilde; thực hiện nhiều cải tiến cho Cygnus kể từ lần ph&oacute;ng đầu ti&ecirc;n c&aacute;ch đ&acirc;y 9 năm, bao gồm cả th&ecirc;m chức năng n&acirc;ng trạm ISS. Th&agrave;nh c&ocirc;ng mới bổ sung một khả năng quan trọng để gi&uacute;p duy tr&igrave; v&agrave; hỗ trợ trạm vũ trụ hoạt động, đồng thời chứng tỏ t&iacute;nh hữu &iacute;ch lớn của Cygnus với trạm ISS v&agrave; c&aacute;c sứ mệnh kh&aacute;m ph&aacute; kh&ocirc;ng gian trong tương lai, theo Steven Krein, ph&oacute; chủ tịch Bộ phận Vũ trụ Thương mại v&agrave; D&acirc;n dụng của Northrop Grumman.</p>

<p>Sau khi ho&agrave;n th&agrave;nh việc điều chỉnh quỹ đạo cho trạm ISS, t&agrave;u Cygnus-17 đ&atilde; t&aacute;ch khỏi trạm l&uacute;c 18h05 h&ocirc;m 28/6 (giờ H&agrave; Nội). Con t&agrave;u sẽ thực hiện th&ecirc;m một số nhiệm vụ kh&aacute;c, sau đ&oacute; lao xuống kh&iacute; quyển Tr&aacute;i Đất v&agrave; ch&aacute;y rụi.</p>
', 1, NULL, NULL, 4)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (53, 3, N'Trạm ISS né mảnh vỡ vệ tinh
', N'https://i1-vnexpress.vnecdn.net/2022/06/27/CaptureJPG-1656299277-3999-1656299316.jpg?w=300&h=180&q=100&dpr=1&fit=crop&s=XIEJKW-dslFjvQV-hyIXWw', CAST(N'2019-05-29T01:21:18.750' AS DateTime), N'<p>Cơ quan vũ trụ Nga Roscosmos sử dụng t&agrave;u chở h&agrave;ng Progress 81 đang gh&eacute;p nối với Trạm Vũ trụ Quốc tế (ISS) để dịch chuyển trạm n&agrave;y ra xa khỏi mảnh r&aacute;c vũ trụ từ vệ tinh Nga Cosmos 1408. Roscosmos chia sẻ video về qu&aacute; tr&igrave;nh t&agrave;u Progress 81 khai hỏa động cơ tr&ecirc;n mạng x&atilde; hội.</p>

<p>&quot;T&ocirc;i x&aacute;c nhận rằng l&uacute;c 22h03 giờ Moskva, c&aacute;c động cơ của t&agrave;u chở h&agrave;ng Nga Progress MS-20 đ&atilde; thực hiện một vụ điều chỉnh quỹ đạo ngo&agrave;i lịch tr&igrave;nh nhằm gi&uacute;p trạm ISS tr&aacute;nh khỏi vụ tiếp cận nguy hiểm với một mảnh vỡ từ vệ tinh Cosmos 1408&quot;, Dmitry Rogozin, gi&aacute;m đốc Roscosmos, viết tr&ecirc;n mạng x&atilde; hội.</p>

<p>T&agrave;u chở h&agrave;ng Progress 81 đốt động cơ trong 4 ph&uacute;t 34 gi&acirc;y, gi&uacute;p n&acirc;ng quỹ đạo của trạm ISS l&ecirc;n cao hơn một ch&uacute;t. &quot;Phi h&agrave;nh đo&agrave;n kh&ocirc;ng gặp nguy hiểm g&igrave; v&agrave; việc điều chỉnh như vậy kh&ocirc;ng ảnh hưởng đến việc vận h&agrave;nh trạm. Nếu kh&ocirc;ng điều chỉnh quỹ đạo, mảnh vỡ được dự đo&aacute;n l&agrave; sẽ bay qua c&aacute;ch trạm vũ trụ trong v&ograve;ng 0,6 km&quot;, NASA cho biết.</p>

<p>Cosmos 1408 l&agrave; vệ tinh Li&ecirc;n X&ocirc; (cũ) ph&oacute;ng l&ecirc;n kh&ocirc;ng gian từ S&acirc;n bay vũ trụ Plesetsk, Nga, năm 1982 v&agrave; hiện đ&atilde; ngừng hoạt động. Ng&agrave;y 15/11/2021, Nga chủ động ph&aacute; hủy vệ tinh n&agrave;y trong một vụ thử nghiệm t&ecirc;n lửa chống vệ tinh, tạo ra khoảng 1.500 mảnh r&aacute;c vũ trụ. C&aacute;c nh&agrave; phi h&agrave;nh gia tr&ecirc;n trạm ISS từng phải tr&uacute; ẩn trong t&agrave;u Soyuz v&agrave; Crew Dragon do lo ngại về r&aacute;c vũ trụ. C&aacute;c chuy&ecirc;n gia nhận định, số r&aacute;c n&agrave;y c&oacute; thể tiếp tục g&acirc;y nguy hiểm cho trạm v&agrave; c&aacute;c t&agrave;u kh&aacute;c trong nhiều năm tới.</p>
', 1, NULL, NULL, 4)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (55, 2, N'Samsung sẽ "hồi sinh" smartphone có thể tháo rời pin?', N'https://static-images.vnncdn.net/files/publish/2022/6/29/dien-thoai-samsung-168.jpg', CAST(N'2019-03-29T01:21:18.750' AS DateTime), N'Nhiều khả năng, Samsung sẽ phát triển điện thoại có thể tháo rời pin dành cho phân khúc tầm trung, cận cao cấp.
Vào ngày 13/7 tới đây, Samsung sẽ giới thiệu tới người dùng mẫu điện thoại siêu bền Galaxy Xcover 6 Pro và tablet Tab Active 4 Pro. Trong một số thông tin bị rò rỉ, nhiều khả năng mẫu điện thoại Xcover 6 Pro (SM-G736B) sẽ không sử dụng thiết kế nguyên khối. 


Thay vào đó, mẫu điện thoại này sẽ có khả năng mở nắp lưng, đây là ngôn ngữ thiết kế rất phổ biến trong những năm về trước. Hiện nay, kiểu thiết kế này chỉ tồn tại trên một số điện thoại Trung Quốc giá rẻ.

Trong danh sách gần đây của Google Play Console, Galaxy Xcover 6 sẽ sử dụng bộ vi xử lý Snapdragon 778G. Nếu những thông tin này là đúng, Xcover 6 sẽ là điện thoại thông minh mạnh mẽ nhất có khả năng tháo rời pin trực tiếp.

Các tính năng thuộc về phần cứng đáng chú ý khác được tiết lộ trong sách hướng dẫn sử dụng bao gồm hai phím cứng có thể tùy chỉnh, cổng 3.5mm, nút nguồn với hệ thống bảo mật quét dấu vân tay ở cạnh bên, khe cắm thẻ nhớ microSD.

Bên cạnh đó, Xcover 6 có thể sẽ được hỗ trợ các tính năng như chế độ chụp Single Take, quay video siêu chống rung cùng chế độ Samsung Dex. Đây rõ ràng là một sản phẩm không thể bỏ qua đối với những người yêu thích điện thoại có pin rời.

Điện thoại có thể tháo rời pin đã từng rất thịnh hành trong quá khứ, cho tới khi các nhà sản xuất cung cấp tính năng chống nước cho các mẫu flagship. Đối với điện thoại có thiết kế nguyên khối, pin sẽ được gắn liền vào máy, để từ đó tối ưu hoá diện tích, tăng dung lượng pin cho thiết bị.

Trước đây, thiết kế điện thoại nguyên khối chỉ tồn tại trên các mẫu điện thoại cao cấp, cho tới nay nguyên lý thiết kế này đã được áp dụng cho hầu hết các mẫu điện thoại từ phổ thông đến cao cấp.', 1, NULL, NULL, 3)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (56, 1, N'Việt Nam được đánh giá cao về tăng trưởng hạ tầng số', N'https://static-images.vnncdn.net/files/publish/2022/6/29/ha-tang-so-vietnam-2-67.jpg', CAST(N'2022-03-29T01:21:18.750' AS DateTime), N'<p>So với c&aacute;c nước trong khu vực, Việt Nam đang c&oacute; sự gia tăng về đầu tư v&agrave;o hạ tầng CNTT. Qu&aacute; tr&igrave;nh chuyển đổi số tại Việt Nam cũng đang diễn ra mạnh mẽ.</p>

<p>Trong buổi trao đổi vừa được tổ chức mới đ&acirc;y, &ocirc;ng Trần Vũ - TGĐ Dell Việt Nam cho biết, theo số liệu của doanh nghiệp n&agrave;y, trong Qu&yacute; 1/2022, Việt Nam vẫn đang tăng trưởng về hạ tầng số.&nbsp;</p>

<p>L&yacute; giải cho điều n&agrave;y, &ocirc;ng Trần Vũ cho rằng, nguy&ecirc;n nh&acirc;n s&acirc;u xa của tăng trưởng hạ tầng số đến từ nhu cầu hiện đại h&oacute;a nhằm bắt kịp c&aacute;c thay đổi số của nh&oacute;m ng&agrave;nh viễn th&ocirc;ng, ng&acirc;n h&agrave;ng v&agrave; c&aacute;c dịch vụ t&agrave;i ch&iacute;nh ở Việt Nam.</p>

<p>Hiện rất nhiều bộ, ng&agrave;nh tại Việt Nam đang đẩy mạnh chuyển đổi số, đưa hoạt động l&ecirc;n m&ocirc;i trường mạng. Ở bước kế tiếp, mục ti&ecirc;u cần l&agrave;m l&agrave; phải l&agrave;m sao kết nối c&aacute;c nền tảng số n&agrave;y.</p>

<p><img src="https://static-images.vnncdn.net/files/publish/2022/6/29/ha-tang-so-vietnam-2-67.jpg" /></p>

<p>&Ocirc;ng Trần Vũ - một chuy&ecirc;n gia c&oacute; nhiều năm kinh nghiệm trong lĩnh vực CNTT chia sẻ nhận định về hạ tầng số Việt Nam.</p>

<p>Chia sẻ với VietNamNet, &ocirc;ng Anothai Wettayakorn - một chuy&ecirc;n gia l&atilde;o l&agrave;ng trong ng&agrave;nh CNTT tại khu vực Ch&acirc;u &Aacute; cho biết, đang c&oacute; sự gia tăng về đầu tư v&agrave;o&nbsp;<a href="https://vietnamnet.vn/80-thi-phan-dien-toan-dam-may-viet-nam-nam-trong-tay-doanh-nghiep-ngoai-2030070.html" target="_blank">hạ tầng CNTT tại Việt Nam</a>. Qu&aacute; tr&igrave;nh chuyển đổi số tại Việt Nam cũng đang diễn ra mạnh mẽ.&nbsp;</p>

<p>Gia nhập Dell Technology từ năm 2004, &ocirc;ng Anothai Wettayakorn hiện l&agrave; Ph&oacute; Chủ tịch c&aacute;c thị trường Ch&acirc;u &Aacute; mới nổi v&agrave; l&agrave; người đứng đầu Bộ phận Kinh doanh Ng&agrave;nh h&agrave;ng ti&ecirc;u d&ugrave;ng Nam &Aacute; của tập đo&agrave;n n&agrave;y.</p>

<p>Đưa ra dự b&aacute;o về sự ph&aacute;t triển hạ tầng số tại Việt Nam cũng như tr&ecirc;n thế giới, theo &ocirc;ng Anothai Wettayakorn, một trong những xu hướng ch&iacute;nh của những năm tới đ&acirc;y l&agrave; tất cả mọi người đều muốn l&agrave;m việc từ xa.&nbsp;</p>

<p>B&ecirc;n cạnh đ&oacute;, khi quan s&aacute;t kh&aacute;ch h&agrave;ng của m&igrave;nh, Dell nhận thấy c&oacute; sự thay đổi trong c&aacute;ch thức m&agrave; c&aacute;c đối t&aacute;c đầu tư cho c&ocirc;ng nghệ. Điều n&agrave;y nhằm l&agrave;m thay đổi c&aacute;c trải nghiệm đang diễn ra trong thế giới vật l&yacute;.&nbsp;</p>

<p><img src="https://static-images.vnncdn.net/files/publish/2022/6/29/ha-tang-so-vietnam-3-68.jpg" /></p>

<p>Việt Nam đang th&uacute;c đẩy kh&aacute; nhanh sự ph&aacute;t triển hạ tầng số nhằm phục vụ cho chiến lược chuyển đổi số quốc gia.&nbsp;</p>

<p>Vị chuy&ecirc;n gia n&agrave;y cho rằng, người d&ugrave;ng cũng như c&aacute;c doanh nghiệp đều muốn chuyển đổi sang m&ocirc;i trường ưu ti&ecirc;n sử dụng c&ocirc;ng nghệ số. Để l&agrave;m điều đ&oacute;, c&aacute;c doanh nghiệp muốn chuyển đổi số cần phải quan t&acirc;m đến bốn điểm quan trọng.&nbsp;</p>

<p>Đầu ti&ecirc;n l&agrave; khả năng l&agrave;m việc từ xa, điều sẽ gi&uacute;p c&aacute;c doanh nghiệp thu h&uacute;t, giữ ch&acirc;n nguồn nh&acirc;n lực tr&igrave;nh độ cao. Tiếp đến, việc dịch chuyển l&ecirc;n nền tảng đa đ&aacute;m m&acirc;y l&agrave; một xu hướng m&agrave; c&aacute;c doanh nghiệp chuyển đổi số cần lưu &yacute;.</p>

<p><img src="https://static-images.vnncdn.net/files/publish/2022/6/29/ha-tang-so-vietnam-1-69.jpg" /></p>

<p>Việt Nam được c&aacute;c chuy&ecirc;n gia quốc tế đ&aacute;nh gi&aacute; cao về tăng trưởng hạ tầng số.</p>

<p>Trong thời gian tới, nhu cầu về dữ liệu sẽ li&ecirc;n tục tăng trưởng, kh&ocirc;ng chỉ tại trung t&acirc;m dữ liệu m&agrave; c&ograve;n tr&ecirc;n c&aacute;c đ&aacute;m m&acirc;y lai. Dữ liệu sẽ ở trong m&ocirc; h&igrave;nh v&agrave; trạng th&aacute;i si&ecirc;u ph&acirc;n t&aacute;n tại h&agrave;ng trăm, h&agrave;ng ngh&igrave;n điểm bi&ecirc;n mạng. Đ&acirc;y cũng l&agrave; l&yacute; do những c&ocirc;ng nghệ như AI, Học m&aacute;y, Dữ liệu lớn,... sẽ v&ocirc; c&ugrave;ng quan trọng.&nbsp;</p>

<p>Lưu &yacute; cuối c&ugrave;ng được &ocirc;ng Anothai Wettayakorn đưa ra l&agrave; c&aacute;c doanh nghiệp chuyển đổi số tại Việt Nam cần quan t&acirc;m hơn tới bảo mật v&agrave;&nbsp;<a href="https://vietnamnet.vn/canh-bao-nhieu-van-de-trong-bao-ve-du-lieu-ca-nhan-o-viet-nam-2034426.html" target="_blank">an to&agrave;n th&ocirc;ng tin</a>. Điều n&agrave;y đặc biệt cần thiết trong xu hướng chuyển dịch nh&acirc;n sự từ tập trung sang ph&acirc;n t&aacute;n, khi họ c&oacute; thể l&agrave;m việc từ xa ở bất kỳ đ&acirc;u, bất kỳ l&uacute;c n&agrave;o.&nbsp;</p>
', NULL, NULL, NULL, 3)
INSERT [dbo].[posts] ([post_id], [user_id], [title], [thumbnail], [updated_date], [post_details], [featured], [sub_title], [publication_date], [post_subcategories_id]) VALUES (59, 1, N'“Cá mập” tiền mã hóa trước nguy cơ vỡ nợ 670 triệu USD', N'https://static-images.vnncdn.net/files/publish/2022/6/27/three-arrows-capital-vo-no-1224.jpg', CAST(N'2022-03-29T01:21:18.750' AS DateTime), N'<p>Đ&acirc;y l&agrave; khoản nợ khổng lồ của Three Arrows Capital - một trong những quỹ đầu tư c&oacute; sức ảnh hưởng lớn tr&ecirc;n thị trường tiền m&atilde; h&oacute;a.</p>

<p>C&ocirc;ng ty m&ocirc;i giới giao dịch Voyager Digital vừa đưa ra th&ocirc;ng b&aacute;o về khoản nợ khổng lồ của Three Arrows Capital (3AC). Quỹ đầu tư c&oacute; trụ sở tại Singapore n&agrave;y được biết đến l&agrave; một trong những nh&agrave; đầu tư t&ecirc;n tuổi nhất tr&ecirc;n thị trường tiền m&atilde; h&oacute;a.&nbsp;</p>

<p>Theo đ&oacute;, Three Arrows Capital đ&atilde; kh&ocirc;ng thực hiện được việc thanh to&aacute;n bắt buộc đối với khoản vay. Điều n&agrave;y diễn ra trong bối cảnh thị trường tiền m&atilde; h&oacute;a đang rơi v&agrave;o giai đoạn downtrend v&agrave; chưa c&oacute; dấu hiệu hồi phục.&nbsp;</p>

<p>Khoản vay của Three Arrows Capital bao gồm 15.250 Bitcoin (trị gi&aacute; tương đương 324 triệu USD) v&agrave; 350 triệu USD dưới dạng stablecoin USDC. Trước t&igrave;nh h&igrave;nh tr&ecirc;n Voyager Digital đang thảo luận với c&aacute;c cố vấn ph&aacute;p l&yacute; về biện ph&aacute;p để xử l&yacute; t&igrave;nh h&igrave;nh.&nbsp;</p>

<p><img src="https://static-images.vnncdn.net/files/publish/2022/6/27/three-arrows-capital-vo-no-1224.jpg" /></p>

<p>Three Arrows Capital - &ldquo;c&aacute; mập&rdquo; tiền m&atilde; h&oacute;a trước nguy cơ vỡ nợ 670 triệu USD.</p>

<p>Kh&aacute; nổi tiếng trong l&agrave;ng crypto, tuy vậy, trường ph&aacute;i đầu tư của Three Arrows Capital được đ&aacute;nh gi&aacute; c&oacute; khẩu vị rủi ro cao.&nbsp;</p>

<p>Danh mục đầu tư của Three Arrows Capital hiện trải d&agrave;i ở nhiều mảng kh&aacute;c nhau, từ s&agrave;n phi tập trung (DEX), cho vay (lending), giao thức cơ bản (Base Protocol) cho đến quản l&yacute; t&agrave;i sản (Asset Management).&nbsp;</p>

<p>B&ecirc;n cạnh đ&oacute;, quỹ đầu tư n&agrave;y cũng bỏ tiền v&agrave;o c&aacute;c tổ chức cung cấp dịch vụ vốn như BlockFi, Deribit v&agrave; c&aacute;c quỹ kh&aacute;c như Multicoin Capital, Coincident Capital,...</p>

<p><img src="https://static-images.vnncdn.net/files/publish/2022/6/27/three-arrows-capital-vo-no-3-1225.jpg" /></p>

<p>Zhu Su - nh&agrave; đồng s&aacute;ng lập của Three Arrows Capital.</p>

<p>Trước th&ocirc;ng b&aacute;o của Voyager Digital, từng xuất hiện kh&ocirc;ng &iacute;t tin đồn về việc Three Arrows Capital sụp đổ. Tuy vậy, ngay sau th&ocirc;ng tin về khoản nợ của Three Arrows Capital được đưa ra, thị trường&nbsp;<a href="https://vietnamnet.vn/tien-ma-hoa-tag17372998106149618843.html" target="_blank">tiền m&atilde; h&oacute;a</a>&nbsp;đ&atilde; ngay lập tức c&oacute; phản ứng xấu.&nbsp;</p>

<p>Theo đ&oacute;, gi&aacute; Bitcoin đ&atilde; lập tức giảm mạnh chỉ trong v&ograve;ng 2 giờ đồng hồ, từ 21.200 USD xuống chỉ c&ograve;n 20.600 USD. Với những tin tức xấu li&ecirc;n tục xuất hiện trong những ng&agrave;y gần đ&acirc;y, c&oacute; lẽ sẽ phải đến cuối năm nay, thị trường crypto mới bắt đầu c&oacute; những dấu hiệu của việc khởi sắc.&nbsp;</p>
', NULL, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[posts] OFF
GO
SET IDENTITY_INSERT [dbo].[product_categories] ON 

INSERT [dbo].[product_categories] ([category_id], [category_name], [description], [featured]) VALUES (1, N'Product technology', N'Product technology', 1)
INSERT [dbo].[product_categories] ([category_id], [category_name], [description], [featured]) VALUES (2, N'Science and technology', N'Science and technology', 1)
INSERT [dbo].[product_categories] ([category_id], [category_name], [description], [featured]) VALUES (3, N'SmartPhone', NULL, 1)
INSERT [dbo].[product_categories] ([category_id], [category_name], [description], [featured]) VALUES (4, N'Tablet', NULL, 1)
INSERT [dbo].[product_categories] ([category_id], [category_name], [description], [featured]) VALUES (5, N'Accessory', NULL, 1)
SET IDENTITY_INSERT [dbo].[product_categories] OFF
GO
SET IDENTITY_INSERT [dbo].[product_feedbacks] ON 

INSERT [dbo].[product_feedbacks] ([feedback_id], [user_id], [product_id], [star], [feedbacks_content], [full_name], [phone], [gender], [email], [image_url], [feedback_date]) VALUES (1, 0, 12, 4, N'dd', N'Pháº¡m VÄn ToÃ n', N'0978415744', 0, N'tretrau224@gmail.com', N'', CAST(N'2022-06-12T18:21:02.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[product_feedbacks] OFF
GO
SET IDENTITY_INSERT [dbo].[product_images] ON 

INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (4, 3, N'images/product_images/hp-205-pro-g8-aio-r3-5r3f1pa-2-1.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (5, 3, N'images/product_images/hp-205-pro-g8-aio-r3-5r3f1pa-3-1.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (6, 3, N'images/product_images/hp-205-pro-g8-aio-r3-5r3f1pa-4.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (7, 3, N'images/product_images/hp-205-pro-g8-aio-r3-5r3f1pa-5.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (8, 3, N'images/product_images/hp-205-pro-g8-aio-r3-5r3f1pa-6.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (9, 3, N'images/product_images/hp-205-pro-g8-aio-r3-5r3f1pa-7.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (10, 3, N'images/product_images/hp-205-pro-g8-aio-r3-5r3f1pa-8.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (11, 4, N'images/product_images/thumb-apple-imac-24-m1-2021-800x450.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (12, 4, N'images/product_images/vi-vn-imac-24-inch-45k-retina-m1-mgph3saa-1.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (13, 4, N'images/product_images/vi-vn-imac-24-inch-45k-retina-m1-mgph3saa-2.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (14, 4, N'images/product_images/vi-vn-imac-24-inch-45k-retina-m1-mgph3saa-3.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (15, 4, N'images/product_images/vi-vn-imac-24-inch-45k-retina-m1-mgph3saa-4.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (16, 5, N'images/product_images/thumb-apple-imac-24-m1-2021-800x450 (1).jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (17, 5, N'images/product_images/vi-vn-imac-24-inch-45k-retina-m1-mgtf3saa-1.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (18, 5, N'images/product_images/vi-vn-imac-24-inch-45k-retina-m1-mgtf3saa-2.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (19, 5, N'images/product_images/vi-vn-imac-24-inch-45k-retina-m1-mgtf3saa-3.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (20, 5, N'images/product_images/vi-vn-imac-24-inch-45k-retina-m1-mgtf3saa-4.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (21, 6, N'images/product_images/vi-vn-asus-zen-aio-m5401wu-r5-ba014w-1.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (22, 6, N'images/product_images/vi-vn-asus-zen-aio-m5401wu-r5-ba014w-2.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (23, 6, N'images/product_images/vi-vn-asus-zen-aio-m5401wu-r5-ba014w-3.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (24, 6, N'images/product_images/vi-vn-asus-zen-aio-m5401wu-r5-ba014w-4.jpg', N'')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (25, 21, N'images/product_images/bluetooth-airpods-pro-magsafe-charge-apple-mlwk3-231021-120617.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (26, 21, N'images/product_images/bluetooth-airpods-pro-magsafe-charge-apple-mlwk3-231021-120615.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (27, 21, N'images/product_images/bluetooth-airpods-pro-magsafe-charge-apple-mlwk3-1.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (28, 22, N'images/product_images/tai-nghe-bluetooth-kanen-k6-den-2-org.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (29, 22, N'images/product_images/tai-nghe-bluetooth-kanen-k6-n.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (30, 23, N'images/product_images/bluetooth-mozard-k8-hong-1-org.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (31, 23, N'images/product_images/bluetooth-mozard-k8-hong-2-org.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (32, 23, N'images/product_images/bluetooth-mozard-k8-1.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (33, 24, N'images/product_images/bluetooth-true-wireless-jlab-go-air-pop-2-2.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (34, 24, N'images/product_images/bluetooth-true-wireless-jlab-go-air-pop-3-2.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (35, 24, N'images/product_images/bluetooth-true-wireless-jlab-go-air-pop-5-1.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (36, 7, N'images/product_images/macbook-air-m1-2020-gray-600x600.jpg', N'macbook air m1 thumbnail')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (37, 7, N'images/product_images/apple-macbook-air-m1-2020-z124000de-4-1-1-1020x570.jpg', N'macbook air m1 image')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (38, 7, N'images/product_images/vi-vn-apple-macbook-air-m1-2020-z124000de-7.jpg', N'macbook air m1 image')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (39, 7, N'images/product_images/vi-vn-apple-macbook-air-m1-2020-z124000de-6.jpg', N'macbook air m1 image')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (40, 7, N'images/product_images/vi-vn-apple-macbook-air-m1-2020-z124000de-2.jpg', N'macbook air m1 image')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (41, 8, N'images/product_images/dell-xps-17-9710-i7-xps7i7001w1-1-600x600.jpg', N'dell xps 17 9710 thumbnail')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (42, 8, N'images/product_images/vi-vn-dell-xps-17-9710-i7-xps7i7001w1-2.jpg', N'dell xps 17 9710 image')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (43, 8, N'images/product_images/vi-vn-dell-xps-17-9710-i7-xps7i7001w1-4.jpg', N'dell xps 17 9710 image')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (44, 8, N'images/product_images/vi-vn-dell-xps-17-9710-i7-xps7i7001w1-10.jpg', N'dell xps 17 9710 image')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (45, 8, N'images/product_images/vi-vn-dell-xps-17-9710-i7-xps7i7001w1-9.jpg', N'dell xps 17 9710 image')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (46, 9, N'images/product_images/lenovo-gaming-legion-5-15ith6-i7-82jk00fnvn-180322-100552-600x600.jpg', N'lenovo legion 5 thumbnail')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (47, 9, N'images/product_images/vi-vn-lenovo-gaming-legion-5-15ith6-i7-82jk00fnvn-2.jpg', N'lenovo legion 5 image')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (48, 9, N'images/product_images/vi-vn-lenovo-gaming-legion-5-15ith6-i7-82jk00fnvn-3.jpg', N'lenovo legion 5 image')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (49, 9, N'images/product_images/vi-vn-lenovo-gaming-legion-5-15ith6-i7-82jk00fnvn-5.jpg', N'lenovo legion 5 image')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (50, 9, N'images/product_images/vi-vn-lenovo-gaming-legion-5-15ith6-i7-82jk00fnvn-6.jpg', N'lenovo legion 5 image')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (51, 10, N'images/product_images/lg-gram-17-i7-17z90pgah76a5-3-600x600.jpg', N'lg gram 17 i7 thumbnail')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (52, 10, N'images/product_images/lg-gram-17-i7-17z90pgah76a5-070521-1108441.jpg', N'lg gram 17 i7 image')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (53, 10, N'images/product_images/lg-gram-17-i7-17z90pgah76a5-070521-1108442.jpg', N'lg gram 17 i7 image')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (54, 10, N'images/product_images/lg-gram-17-i7-17z90pgah76a5-070521-1108453.jpg', N'lg gram 17 i7 image')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (55, 10, N'images/product_images/lg-gram-17-i7-17z90pgah76a5-070521-1108476.jpg', N'lg gram 17 i7 image')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (56, 11, N'images/product_images/k380-multi-device-bluetooth-keyboard_2_.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (57, 12, N'images/product_images/ban-phim-co-gaming-mau-trang-dareu-ek87-white-01.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (58, 13, N'images/product_images/ban-phim-apple-magic-keyboard-2021-1.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (59, 14, N'images/product_images/_0000_z1999964392001_dea65b777420d95cc.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (60, 15, N'images/product_images/ban-phim-khong-day-logitech-k580-2.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (61, 16, N'images/product_images/mx-keys-mini-top-rose-us.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (62, 17, N'images/product_images/_0003_e7dc73590673398238ae0954151de25b.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (63, 18, N'images/product_images/k120-refresh-gallery-images--2-.u3059.d20170508.t165045.665973.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (64, 19, N'images/product_images/ban-phim-co-khong-day-dareu-ek807g-4.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (65, 20, N'images/product_images/ban-phim-co-rapoo-v500se-rainbow-2.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (66, 11, N'images/product_images/k380-multi-device-bluetooth-keyboard_1_.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (67, 12, N'images/product_images/1_52_7.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (68, 13, N'images/product_images/ban-phim-apple-magic-keyboard-2021-4.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (69, 14, N'images/product_images/_0001_z1999964398355_7a400fe0a1fa82e20.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (70, 15, N'images/product_images/ban-phim-khong-day-logitech-k580-1.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (71, 16, N'images/product_images/_0001_mx-keys-mini-profile-black.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (72, 17, N'images/product_images/_0000_product_image-5383-2-1200x675.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (73, 18, N'images/product_images/k120-refresh-gallery-images--3-.u3059.d20170508.t165045.699849.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (74, 19, N'images/product_images/ban-phim-co-khong-day-dareu-ek807g-3.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (75, 20, N'images/product_images/ban-phim-co-rapoo-v500se-rainbow-3.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (76, 11, N'images/product_images/ban-phim-bluetooth-logitech-k380_1.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (77, 12, N'images/product_images/smartekvn-ban-phim-dareu-ek87-pink-white-1.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (78, 13, N'images/product_images/ban-phim-apple-magic-keyboard-2021.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (79, 14, N'images/product_images/_0002_z1999964419602_21e9b7c37f5bdc5db.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (80, 15, N'images/product_images/ban-phim-khong-day-logitech-k580.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (81, 16, N'images/product_images/_0004_mx-keys-mini-top-black-us.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (82, 17, N'images/product_images/ban-phim-gaming-rbg-havit-kb866l.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (83, 18, N'images/product_images/ban-phim-co-day-logitech-k120.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (84, 19, N'images/product_images/ban-phim-co-khong-day-dareu-ek807g-2.jpg', N'des')
INSERT [dbo].[product_images] ([image_id], [product_id], [url], [description]) VALUES (85, 20, N'images/product_images/ban-phim-co-rapoo-v500se-rainbow.jpg', N'des')
SET IDENTITY_INSERT [dbo].[product_images] OFF
GO
SET IDENTITY_INSERT [dbo].[product_sub_categories] ON 

INSERT [dbo].[product_sub_categories] ([sub_category_id], [category_name], [description], [status], [category_id]) VALUES (3, N'Laptop Gaming', NULL, 1, 1)
INSERT [dbo].[product_sub_categories] ([sub_category_id], [category_name], [description], [status], [category_id]) VALUES (4, N'UltraBook', NULL, 1, 1)
INSERT [dbo].[product_sub_categories] ([sub_category_id], [category_name], [description], [status], [category_id]) VALUES (5, N'All In One', NULL, 1, 2)
INSERT [dbo].[product_sub_categories] ([sub_category_id], [category_name], [description], [status], [category_id]) VALUES (6, N'Workstation', NULL, 1, 2)
INSERT [dbo].[product_sub_categories] ([sub_category_id], [category_name], [description], [status], [category_id]) VALUES (7, N'Gaming ', NULL, 1, 2)
INSERT [dbo].[product_sub_categories] ([sub_category_id], [category_name], [description], [status], [category_id]) VALUES (8, N'Phone', NULL, 1, 3)
INSERT [dbo].[product_sub_categories] ([sub_category_id], [category_name], [description], [status], [category_id]) VALUES (9, N'Table', NULL, 1, 4)
INSERT [dbo].[product_sub_categories] ([sub_category_id], [category_name], [description], [status], [category_id]) VALUES (10, N'HeadPhone', NULL, 1, 5)
INSERT [dbo].[product_sub_categories] ([sub_category_id], [category_name], [description], [status], [category_id]) VALUES (11, N'EarPhone', NULL, 1, 5)
INSERT [dbo].[product_sub_categories] ([sub_category_id], [category_name], [description], [status], [category_id]) VALUES (12, N'Mouse', NULL, 1, 5)
INSERT [dbo].[product_sub_categories] ([sub_category_id], [category_name], [description], [status], [category_id]) VALUES (13, N'Keyboard', NULL, 1, 5)
SET IDENTITY_INSERT [dbo].[product_sub_categories] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (3, N'HP 205 Pro G8 AIO', 5, 55, CAST(N'2022-05-25T22:34:12.353' AS DateTime), 13890000.0000, 13390000.0000, N'HP 205 Pro G8 AIO R3 5300U (5R3F1PA) là chiếc máy tính AIO được thiết kế tối ưu cho mọi không gian làm việc như văn phòng, quầy lễ tân, sảnh bệnh viện,... khi được tích hợp cả CPU, ổ cứng, loa, camera trên cùng một màn hình nhưng vẫn đảm bảo hiệu năng đáp ứng tốt cho các tác vụ văn phòng, đồ họa cơ bản.', 0, 1, N'R3 5300U/4GB/256GB/23.8inch FHD/Bàn phím&Chuột//Win11', N'images/product_images/hp-205-pro-g8-aio-r3-5r3f1pa-2-1.jpg', N'5R3F1PA')
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (4, N'iMac 24 inch 2021 4.5K', 4, 11, CAST(N'2022-05-25T22:34:12.353' AS DateTime), 39990000.0000, 36990000.0000, N'iMac 24 inch 2021 4.5K Retina M1 là mẫu máy tính để bàn tích hợp CPU vào màn hình của Apple với thiết kế vẻ ngoài hoàn toàn mới, màu sắc rực rỡ cùng hiệu năng vô cùng mạnh mẽ từ chip M1.', 1, 1, N'M1/256GB/8GB/8-core GPU', N'images/product_images/thumb-apple-imac-24-m1-2021-800x450.jpg', NULL)
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (5, N'iMac 24 inch 2021 4.5K', 4, 14, CAST(N'2022-05-25T22:34:12.353' AS DateTime), 34990000.0000, 31490000.0000, N'Máy tính để bàn iMac 24 inch 2021 4.5K Retina M1 (MGTF3SA/A) của Apple ra mắt đầu quý 2 năm 2021 gây xôn xao bởi diện mạo lột xác mới mẻ, cá tính, đồng thời thừa hưởng sức mạnh từ chip xử lý M1 và màn hình 4.5K Retina, đáp ứng mọi nhu cầu từ văn phòng đến xử lý hình ảnh, video chuyên nghiệp.', 1, 1, N'M1/256GB/8GB/7-core GPU', N'images/product_images/thumb-apple-imac-24-m1-2021-800x450 (1).jpg', NULL)
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (6, N'Asus Zen AIO', 4, 45, CAST(N'2022-05-25T22:34:12.353' AS DateTime), 19990000.0000, 18990000.0000, N'Asus Zen AIO M5401WU R5 (BA014W) là phiên bản máy tính All-in-One tiện lợi khi gói gọn tất cả mọi thứ vào chung một màn hình từ ổ cứng, loa, webcam đến CPU tích hợp, tối ưu hóa không gian làm việc nhưng vẫn đáp ứng đa dạng mọi nhu cầu cần thiết hằng ngày.', 1, 1, N'M5401WU R5 5500U/8GB/512GB/23.8"F/Touch/Bàn phím&Chuột/Win11', N'images/product_images/vi-vn-asus-zen-aio-m5401wu-r5-ba014w-1.jpg', N'BA014W')
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (7, N'MacBook Air M1 2020 16GB', 3, 90, CAST(N'2022-05-25T22:36:02.960' AS DateTime), 33990000.0000, 28990000.0000, N'Laptop Apple MacBook Air M1 2020 có thiết kế đẹp, sang trọng với CPU M1 độc quyền từ Apple cho hiệu năng đồ họa cao, màn hình Retina hiển thị siêu nét cùng với hệ thống bảo mật tối ưu.', 1, 1, NULL, N'images/product_images/macbook-air-m1-2020-gray-600x600.jpg', N'Z124000DE')
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (8, N'Dell XPS 17 9710', 3, 99, CAST(N'2022-05-25T22:36:02.960' AS DateTime), 82990000.0000, 72990000.0000, N'Laptop Dell XPS 17 9710 (XPS7I7001W1) sẽ không làm người dùng thất vọng khi sở hữu ngoại hình thời thượng cùng những thông số kỹ thuật đẳng cấp.', 1, 1, N'i7 11800H/16GB/1TB SSD/4GB RTX3050/Touch/Cáp/Office H&S/Win11', N'images/product_images/dell-xps-17-9710-i7-xps7i7001w1-1-600x600.jpg', N'XPS7I7001W1')
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (9, N'Lenovo Gaming Legion 5 15ITH6 i7 11800H/16GB/512GB/4GB RTX3050Ti/165Hz/Win11 (82JK00FNVN)', 3, 99, CAST(N'2022-05-25T22:36:02.960' AS DateTime), 39990000.0000, NULL, N'Phong cách thiết kế độc đáo, trẻ trung cùng hiệu năng mạnh mẽ vượt trội của card màn hình NVIDIA RTX hội tụ trong chiếc laptop Lenovo Gaming Legion 5 15ITH6 i7 (82JK00FNVN) hứa hẹn sẽ cân mọi tựa game đình đám cũng như sẵn sàng hỗ trợ bạn xử lý các tác vụ nặng.', 1, 1, NULL, N'images/product_images/lenovo-gaming-legion-5-15ith6-i7-82jk00fnvn-180322-100552-600x600.jpg', N'82JK00FNVN')
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (10, N'LG Gram 17 2021 i7 1165G7/16GB/512GB/Win10 (17Z90P-G.AH76A5)', 3, 100, CAST(N'2022-05-25T22:36:02.960' AS DateTime), 52890000.0000, 42890000.0000, N'Laptop LG Gram 17 2021 i7 (17Z90P-G.AH76A5) là 1 phiên bản laptop thời trang mang thiết kế siêu mỏng nhẹ với cấu hình mạnh mẽ, giải trí đẳng cấp, là 1 lựa chọn đầy thú vị dành cho bạn.', 1, 1, NULL, N'images/product_images/lg-gram-17-i7-17z90pgah76a5-3-600x600.jpg', N'17Z90P-G.AH76A5')
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (11, N'Logitech K380', 9, 121, CAST(N'2022-05-25T22:38:42.787' AS DateTime), 344000.0000, 344000.0000, N'Thiết kế hiện đại, mỏng nhẹ cùng với nhiều màu sắc trẻ trung, tiện lợi khi mang theo và không tốn nhiều diện tích trên bàn làm việc', 1, 1, NULL, N'images/product_images/k380-multi-device-bluetooth-keyboard_2_.jpg', NULL)
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (12, N'Dareu EK87 TKL', 9, 321, CAST(N'2022-05-25T22:38:42.787' AS DateTime), 344000.0000, 344000.0000, N'Bàn phím cơ có dây DAREU EK87 là bàn phím chuyên dùng chơi game hệ thống Stab phím dài được làm theo dạng Cherry cùng 2 switch phụ. Bàn phím DareU EK87 có thiết kế rất thân thiện với các game thủ. Lớp vỏ bàn phím được làm khá chắc chắn, classic. Keycap Double Shot bền bỉ. Có lớp vỏ dày, cao che kín chân switch.', 1, 1, NULL, N'images/product_images/smartekvn-ban-phim-dareu-ek87-pink-white-1.jpg', NULL)
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (13, N'Apple Magic Keyboard 2021', 9, 97, CAST(N'2022-05-25T22:38:42.787' AS DateTime), 330000.0000, 290000.0000, N'Bàn phím Apple Magic Keyboard 2021 MK2A3 mang thiết kế hiện đại và có tính di động cực cao nhờ vào độ mỏng và trọng lượng chỉ 0.239kg nhờ việc được thiết kế bàn phím không có số, điều này giúp bạn có thể dễ dàng để nó vào trong balo hay túi xách và mang đi khắp nơi khi cần dùng.', 1, 1, NULL, N'images/product_images/ban-phim-apple-magic-keyboard-2021-1.jpg', N'MK2A3')
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (14, N'Rappo V500 Pro', 9, 145, CAST(N'2022-05-25T22:38:42.787' AS DateTime), 679000.0000, 555000.0000, N'Bàn phím cơ có dây Rapoo V500 Alloy sở hữu một thiết kế sang trọng với bề mặt phủ hợp kim nhôm nhờ đó bàn phím không chỉ mang lại sự sang trọng cùng độ bền bỉ vượt trội.', 1, 1, NULL, N'images/product_images/_0002_z1999964419602_21e9b7c37f5bdc5db.jpg', NULL)
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (15, N'Logitech K580', 9, 99, CAST(N'2022-05-25T22:38:42.787' AS DateTime), 540000.0000, 440000.0000, N'Bàn phím bluetooth Logitech K580 được thiết kế vô cùng hiện đại và tinh tế. Kích thước chỉ 37.35 x 14.39 x 2.13cm cùng với sự bo tròn mềm mại ở các góc giúp cho bàn phím trở nên mỏng nhẹ và sang trọng hơn rất nhiều. Bên cạnh đó, thiết kế góc nghiêng mang đến cảm giác thoải mái ngay cả khi sử dụng trong nhiều giờ liền.', 1, 1, NULL, N'images/product_images/ban-phim-khong-day-logitech-k580-2.jpg', NULL)
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (16, N'Logitech MX Keys mini', 9, 122, CAST(N'2022-05-25T22:38:42.787' AS DateTime), 230000.0000, 220000.0000, N'Với thiết kế nhỏ gọn, bỏ đi bớt một số chi tiết rườm rà và dãy số numpad bên phía tay phải, bàn phím không dây Logitech MX Keys Mini giúp cho không gian bàn làm việc của bạn trông thật gọn gàng và có nhiều khoảng trống hơn. Bên cạnh đó việc thiết kế các nút cảm xúc chuyên dùng tích hợp với dãy phím trên cùng cũng giúp cho việc thao tác của bạn trở nên dễ dàng và nhanh hơn bao giờ hết.', 1, 1, NULL, N'images/product_images/_0004_mx-keys-mini-top-black-us.jpg', NULL)
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (17, N'Havit KB866L RGB LED', 9, 132, CAST(N'2022-05-25T22:38:42.787' AS DateTime), 415000.0000, 380000.0000, N'Bàn phím Gaming RGB Havit KB866L có thiết kế nhỏ gọn và chắc chắn, bàn phím cơ giá rẻ cùng chất liệu hợp kim ổn định, giúp cho các phím khi gõ được nhẹ nhàng thoải mái hơn.', 1, 1, NULL, N'images/product_images/_0003_e7dc73590673398238ae0954151de25b.jpg', NULL)
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (18, N'Logitech K120', 9, 123, CAST(N'2022-05-25T22:38:42.787' AS DateTime), 220000.0000, 346000.0000, N'Bàn phím có dây LOGITECH K120 sở hữu thiết kế khá truyền thống với gam màu đen. So với các mẫu bàn phím hiện nay thì LOGITECH K120 có thiết kế khá mỏng, vừa giúp tiết kiệm diện tích, vừa tạo nên tính thẩm mỹ cho không gian làm việc của bạn.', 1, 1, NULL, N'images/product_images/ban-phim-co-day-logitech-k120.jpg', NULL)
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (19, N'Dareu EK807G TKL', 9, 123, CAST(N'2022-05-25T22:38:42.787' AS DateTime), 789000.0000, 770000.0000, N'Bàn phím cơ không dây Dareu EK807G sở hữu thiết kế gọn nhẹ, các ký tự keycap được sơn màu cam nổi bật, khoảng cách giữa các phím hoàn hảo cho bạn trải nghiệm gõ tốt nhất. Tuy nhiên, Dareu EK807G lại không được trang bị đèn LED nhưng bù lại có bộ keycap ABS shot chất lượng.', 1, 1, NULL, N'images/product_images/ban-phim-co-khong-day-dareu-ek807g-4.jpg', NULL)
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (20, N'V500SE Rainbow Blue Switch', 9, 123, CAST(N'2022-05-25T22:38:42.787' AS DateTime), 680000.0000, 590000.0000, N'Bàn phím cơ Rapoo V500SE Rainbow Blue Switch được làm từ chất liệu hợp kim cao cấp và có thiết kế nhỏ gọn. Trên bề mặt của bàn phím được sơn nhám tĩnh điện. Bên cạnh đó, các ký tự trên bàn phím được in rất đều đặn. Những phím chức năng được in đậm hơn để người dùng thuận tiện sử dụng hơn.', 1, 1, NULL, N'images/product_images/ban-phim-co-rapoo-v500se-rainbow.jpg', NULL)
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (21, N'AirPods Pro MagSafe Charge Apple Trắng ', 7, 99, CAST(N'2022-05-25T22:41:48.703' AS DateTime), 6800000.0000, 5900000.0000, N'Đặc điểm nổi bật

Vẻ ngoài thời trang, kiểu dáng nhỏ gọn, đeo chắc chắn với 3 size nút tai. 
Tái tạo âm thanh sống động, phù hợp với ống tai bạn nhờ chip H1, công nghệ Adaptive EQ.
Kiểm soát âm thanh tai nghe hiệu quả với công nghệ chống ồn chủ động (Active Noise Cancellation) cùng xuyên âm (Transparency mode).
Nghe nhạc đến 4.5 giờ khi bật chống ồn, 5 giờ khi tắt chống ồn.
Sử dụng song song với hộp sạc có thể dùng được đến 24 giờ nghe nhạc.
Hỗ trợ sạc nhanh trong 5 phút có 1 giờ sử dụng. 
Sạc không dây tiện lợi với bộ sạc Magsafe, chuẩn không dây Qi. 
An tâm khi gặp mưa nhỏ, luyện tập ra nhiều mồ hôi với chuẩn chống nước IPX4.
Sản phẩm chính hãng Apple, nguyên seal 100%. <br/>
Lưu ý: Thanh toán trước khi mở seal.', 1, 1, NULL, N'images/product_images/bluetooth-airpods-pro-magsafe-charge-apple-mlwk3-231021-120617.jpg', N'MLWK3')
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (22, N'Kanen K6', 7, 100, CAST(N'2022-05-25T22:41:48.703' AS DateTime), 600000.0000, 480000.0000, N'Đặc điểm nổi bật

Công nghệ Bluetooth 4.1 cho khoảng cách kết nối lên đến 10 m.
Có thể gọi nhanh, nghe nhạc, tạo cuộc hẹn,... thông qua Siri hay Google Voice.
Đệm tai nghe dày, thoải mái khi sử dụng khoảng thời gian dài.
Dung lượng pin: 500 mAh, cho thời gian sử dụng có thể lên đến 18 giờ, thời gian sạc khoảng 2 giờ.', 1, 1, NULL, N'images/product_images/tai-nghe-bluetooth-kanen-k6-den-2-org.jpg', NULL)
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (23, N'Mozard K8', 7, 100, CAST(N'2022-05-25T22:41:48.703' AS DateTime), 450000.0000, 360000.0000, N'Đặc điểm nổi bật

Thiết kế đệm tai êm và dày, giúp thoải mái khi đeo.
Có thể kéo giãn tai nghe 3.7 cm để vừa vặn hơn khi sử dụng.
Âm thanh phát ra to rõ, sắc nét, âm trầm dày chắc, đầy nội lực.
Tích hợp mic thoại giúp cho giọng nói rõ ràng, tương tác tốt hơn.
Chuẩn Bluetooth 4.2 cho khoảng cách đến 10 m.
Dung lượng pin 300mAh, thời gian sử dụng 15 giờ, sạc khoảng 2 giờ.
Tương thích với các thiết bị chạy hệ điều hành: Android, Windows, iOS.', 1, 1, NULL, N'images/product_images/bluetooth-mozard-k8-hong-1-org.jpg', NULL)
INSERT [dbo].[products] ([product_id], [name], [sub_category_id], [unit_in_stock], [updated_date], [original_price], [sale_price], [product_details], [featured], [status], [brief_infor], [thumbnail], [model]) VALUES (24, N'JLab GO Air POP', 7, 99, CAST(N'2022-05-25T22:41:48.703' AS DateTime), 690000.0000, 500000.0000, N'Thông tin sản phẩm
JLab GO Air POP một trong những chiếc tai nghe hội tụ đủ ba yếu tố: cảm giác đeo thoải mái vượt trội, chất lượng âm thanh hoàn hảo, thời lượng pin vượt xa phân khúc trong tầm giá. 
Một chất âm mang lại đầy sự bất ngờ
JLab GO Air POP được trang bị công nghệ âm thanh 6mm Dynamic driver và EQ Sound mang lại một mức nghe mà theo mình cảm nhận là thật sự rất hay. Hầu như có thể so sánh chiếc tai nghe này với các dòng tai nghe nằm trong phân khúc từ 1 đến 2 triệu.

Nếu so sánh với Galaxy Buds Pro thì chất âm của “em này" đạt 8/10 với một dải bass được thể hiện đậm đà, mạnh, nghe đủ độ ấm và trầm. ', 1, 1, NULL, N'images/product_images/bluetooth-true-wireless-jlab-go-air-pop-2-2.jpg', NULL)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([role_id], [role_name]) VALUES (1, N'Customer')
INSERT [dbo].[roles] ([role_id], [role_name]) VALUES (2, N'Marketing')
INSERT [dbo].[roles] ([role_id], [role_name]) VALUES (3, N'Sale')
INSERT [dbo].[roles] ([role_id], [role_name]) VALUES (4, N'Sale Manager')
INSERT [dbo].[roles] ([role_id], [role_name]) VALUES (5, N'Admin')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[sliders] ON 

INSERT [dbo].[sliders] ([slider_id], [slider_image], [title], [slider_link], [status]) VALUES (1, N'images/slider-images/empty-square-neon-background-free-vector.jpg', N'This is first slider title', N'productslist', 1)
INSERT [dbo].[sliders] ([slider_id], [slider_image], [title], [slider_link], [status]) VALUES (2, N'images/slider-images/istockphoto-1182650732-170667a.jpg', N'This is second slider title', N'product?id=1', 1)
SET IDENTITY_INSERT [dbo].[sliders] OFF
GO
INSERT [dbo].[tag_post] ([tag_id], [post_id]) VALUES (1, 1)
INSERT [dbo].[tag_post] ([tag_id], [post_id]) VALUES (1, 2)
INSERT [dbo].[tag_post] ([tag_id], [post_id]) VALUES (1, 3)
INSERT [dbo].[tag_post] ([tag_id], [post_id]) VALUES (1, 4)
GO
SET IDENTITY_INSERT [dbo].[tags] ON 

INSERT [dbo].[tags] ([tag_id], [tag_name]) VALUES (1, N'Review Laptop')
INSERT [dbo].[tags] ([tag_id], [tag_name]) VALUES (2, N'Review PC')
INSERT [dbo].[tags] ([tag_id], [tag_name]) VALUES (3, N'Review CPU')
SET IDENTITY_INSERT [dbo].[tags] OFF
GO
ALTER TABLE [dbo].[accounts]  WITH CHECK ADD  CONSTRAINT [FK_account.role_id] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([role_id])
GO
ALTER TABLE [dbo].[accounts] CHECK CONSTRAINT [FK_account.role_id]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK_order_details.order_id] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK_order_details.order_id]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK_order_details.product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK_order_details.product_id]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[accounts] ([user_id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[orders_management]  WITH CHECK ADD  CONSTRAINT [FK_order_sales.user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[accounts] ([user_id])
GO
ALTER TABLE [dbo].[orders_management] CHECK CONSTRAINT [FK_order_sales.user_id]
GO
ALTER TABLE [dbo].[orders_management]  WITH CHECK ADD  CONSTRAINT [FK_orders_sales.order_id] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[orders_management] CHECK CONSTRAINT [FK_orders_sales.order_id]
GO
ALTER TABLE [dbo].[permissions]  WITH CHECK ADD  CONSTRAINT [FK_permissions.roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([role_id])
GO
ALTER TABLE [dbo].[permissions] CHECK CONSTRAINT [FK_permissions.roles]
GO
ALTER TABLE [dbo].[permissions]  WITH CHECK ADD  CONSTRAINT [FK_permissions.screens] FOREIGN KEY([screen_id])
REFERENCES [dbo].[screens] ([screen_id])
GO
ALTER TABLE [dbo].[permissions] CHECK CONSTRAINT [FK_permissions.screens]
GO
ALTER TABLE [dbo].[post_sub_categories]  WITH CHECK ADD  CONSTRAINT [FK__post_sub___featu__02FC7413] FOREIGN KEY([category_id])
REFERENCES [dbo].[post_categories] ([category_id])
GO
ALTER TABLE [dbo].[post_sub_categories] CHECK CONSTRAINT [FK__post_sub___featu__02FC7413]
GO
ALTER TABLE [dbo].[posts]  WITH CHECK ADD  CONSTRAINT [FK__posts__post_subc__07C12930] FOREIGN KEY([post_subcategories_id])
REFERENCES [dbo].[post_sub_categories] ([id])
GO
ALTER TABLE [dbo].[posts] CHECK CONSTRAINT [FK__posts__post_subc__07C12930]
GO
ALTER TABLE [dbo].[posts]  WITH CHECK ADD  CONSTRAINT [FK_posts.user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[accounts] ([user_id])
GO
ALTER TABLE [dbo].[posts] CHECK CONSTRAINT [FK_posts.user_id]
GO
ALTER TABLE [dbo].[product_feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_product_feedbacks.product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[product_feedbacks] CHECK CONSTRAINT [FK_product_feedbacks.product_id]
GO
ALTER TABLE [dbo].[product_images]  WITH CHECK ADD  CONSTRAINT [FK_product_image.product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[product_images] CHECK CONSTRAINT [FK_product_image.product_id]
GO
ALTER TABLE [dbo].[product_sub_categories]  WITH CHECK ADD  CONSTRAINT [FK_product_sub_category.product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[product_categories] ([category_id])
GO
ALTER TABLE [dbo].[product_sub_categories] CHECK CONSTRAINT [FK_product_sub_category.product_category]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_product.category_id] FOREIGN KEY([sub_category_id])
REFERENCES [dbo].[product_sub_categories] ([sub_category_id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_product.category_id]
GO
ALTER TABLE [dbo].[tag_post]  WITH CHECK ADD  CONSTRAINT [FK_tagpost_post] FOREIGN KEY([post_id])
REFERENCES [dbo].[posts] ([post_id])
GO
ALTER TABLE [dbo].[tag_post] CHECK CONSTRAINT [FK_tagpost_post]
GO
ALTER TABLE [dbo].[tag_post]  WITH CHECK ADD  CONSTRAINT [FK_tagpost_tag] FOREIGN KEY([tag_id])
REFERENCES [dbo].[tags] ([tag_id])
GO
ALTER TABLE [dbo].[tag_post] CHECK CONSTRAINT [FK_tagpost_tag]
GO
USE [master]
GO
ALTER DATABASE [SWP391] SET  READ_WRITE 
GO
