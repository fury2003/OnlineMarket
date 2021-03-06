USE [master]
GO
/****** Object:  Database [SmartMarket]    Script Date: 1/11/2018 2:39:10 PM ******/
CREATE DATABASE [SmartMarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SmartMarket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SmartMarket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SmartMarket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SmartMarket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmartMarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmartMarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SmartMarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SmartMarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SmartMarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SmartMarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [SmartMarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SmartMarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SmartMarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SmartMarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SmartMarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SmartMarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SmartMarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SmartMarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SmartMarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SmartMarket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SmartMarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SmartMarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SmartMarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SmartMarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SmartMarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SmartMarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SmartMarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SmartMarket] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SmartMarket] SET  MULTI_USER 
GO
ALTER DATABASE [SmartMarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SmartMarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SmartMarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SmartMarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SmartMarket] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SmartMarket]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SmartMarket]
GO
/****** Object:  Table [dbo].[tb_address]    Script Date: 1/11/2018 2:39:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_address](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[province_id] [tinyint] NOT NULL,
	[first_name] [nvarchar](64) NOT NULL,
	[last_name] [nvarchar](64) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[phone_number] [varchar](11) NOT NULL,
	[city] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_tb_address] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_address_order]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_address_order](
	[id_address] [int] IDENTITY(1,1) NOT NULL,
	[id_order] [int] NOT NULL,
 CONSTRAINT [PK_tb_address_order] PRIMARY KEY CLUSTERED 
(
	[id_address] ASC,
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_attribute]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_attribute](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[attribute_group_id] [int] NOT NULL,
	[name] [nvarchar](128) NOT NULL,
	[description] [nvarchar](500) NULL,
	[priority] [int] NULL,
	[type] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tb_attribute] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_attribute_group]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_attribute_group](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](128) NOT NULL,
	[product_category_id] [int] NOT NULL,
	[description] [nvarchar](500) NULL,
	[priority] [int] NULL,
 CONSTRAINT [PK_tb_attribute_group] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_brand]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_brand](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](64) NOT NULL,
	[slug] [varchar](64) NOT NULL,
	[image_path] [varchar](2048) NULL,
	[description] [nvarchar](1000) NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [PK_tb_brand] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_cart]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cart](
	[product_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_tb_cart] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_comment]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_comment](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[parent_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[status] [tinyint] NOT NULL,
	[update_date] [datetime] NULL,
	[create_date] [datetime] NOT NULL,
 CONSTRAINT [PK_tb_comment] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_comment_post]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_comment_post](
	[comment_id] [int] NOT NULL,
	[post_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_comment_post_1] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC,
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_comment_product]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_comment_product](
	[comment_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_comment_product_1] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_configuration]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_configuration](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[key] [nvarchar](255) NOT NULL,
	[value] [nvarchar](max) NULL,
 CONSTRAINT [PK_tb_configuration] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_event]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_event](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[publisher_id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NULL,
	[status] [tinyint] NOT NULL,
	[percent_value] [tinyint] NULL,
	[value] [decimal](13, 6) NULL,
	[code] [varchar](32) NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
	[date_from] [datetime] NOT NULL,
	[date_to] [datetime] NOT NULL,
	[max_price] [decimal](13, 6) NOT NULL,
	[min_price] [decimal](13, 6) NOT NULL,
 CONSTRAINT [PK_tb_event] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_event_brand]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_event_brand](
	[event_id] [int] NOT NULL,
	[brand_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_event_brand_1] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC,
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_event_category]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_event_category](
	[event_id] [int] NOT NULL,
	[product_category_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_event_category_1] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC,
	[product_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_event_order]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_event_order](
	[event_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_event_order_1] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC,
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_event_product]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_event_product](
	[event_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_event_product_1] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_image]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_image](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[path] [nvarchar](2083) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[data_type] [varchar](128) NOT NULL,
	[description] [nvarchar](500) NULL,
	[upload_date] [datetime] NOT NULL,
	[uploader_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_image] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_menu]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_menu](
	[_id] [int] NOT NULL,
	[parent_id] [int] NULL,
	[group_menu_id] [int] NOT NULL,
	[path] [varchar](2083) NOT NULL,
	[description] [nvarchar](500) NULL,
	[icon] [varchar](35) NULL,
	[name] [nvarchar](255) NOT NULL,
	[order] [int] NOT NULL,
 CONSTRAINT [PK_tb_menu] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_menu_group]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_menu_group](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[slug] [varchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK_tb_group_menu] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_notification]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_notification](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[status] [tinyint] NOT NULL,
	[content] [nvarchar](500) NOT NULL,
	[create_date] [datetime] NOT NULL,
 CONSTRAINT [PK_tb_notification] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_order]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_order](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[total_paid] [decimal](13, 0) NULL,
	[total_paid_real] [decimal](13, 0) NULL,
	[total_product] [int] NULL,
	[total_shipping] [int] NULL,
	[status] [tinyint] NULL,
	[invoice_date] [datetime] NULL,
	[create_date] [datetime] NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [PK_tb_order] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_order_detail]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_order_detail](
	[product_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[product_quantity] [int] NOT NULL,
	[product_price] [decimal](13, 0) NOT NULL,
	[product_weight] [float] NOT NULL,
	[product_name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tb_order_detail_1] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_persistent_logins]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_persistent_logins](
	[username] [varchar](128) NOT NULL,
	[series] [varchar](64) NOT NULL,
	[token] [varchar](64) NOT NULL,
	[last_used] [datetime] NOT NULL,
 CONSTRAINT [PK_persistent_logins] PRIMARY KEY CLUSTERED 
(
	[series] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_post]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_post](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[post_category_id] [int] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[publisher_id] [int] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
	[status] [tinyint] NOT NULL,
	[post_type] [varchar](255) NOT NULL,
	[feature_image] [varchar](1024) NOT NULL,
 CONSTRAINT [PK_tb_post] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_post_category]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_post_category](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[slug] [varchar](255) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
	[description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_tb_post_category] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_product]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_product](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[publisher_id] [int] NOT NULL,
	[brand_id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[slug] [varchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[price] [decimal](13, 0) NOT NULL,
	[quantity] [int] NOT NULL,
	[state] [tinyint] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
	[feature_image] [varchar](1024) NOT NULL,
 CONSTRAINT [PK_tb_product] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_product_attribute]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_product_attribute](
	[attribute_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_tb_product_attribute] PRIMARY KEY CLUSTERED 
(
	[attribute_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_product_category]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_product_category](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](64) NOT NULL,
	[slug] [nvarchar](64) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [PK_tb_product_category] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_product_views]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_product_views](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
	[count] [int] NOT NULL,
 CONSTRAINT [PK_tb_product_vierws] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_province]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_province](
	[_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](32) NOT NULL,
	[shipping_fee] [decimal](13, 0) NOT NULL,
 CONSTRAINT [PK_tb_province] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_rating]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_rating](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[rate_date] [datetime] NULL,
	[content] [nchar](10) NULL,
	[create_rate_date] [datetime] NOT NULL,
	[score] [tinyint] NOT NULL,
 CONSTRAINT [PK_tb_rating] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_role]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_role](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tb_role] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_statistic_product_views]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_statistic_product_views](
	[_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[week] [int] NULL,
	[month] [int] NULL,
	[year] [int] NULL,
	[total] [int] NULL,
 CONSTRAINT [PK_tb_statistic_product_views] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_statistic_rating]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_statistic_rating](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[average_score] [float] NOT NULL,
	[total_score] [int] NOT NULL,
	[user_count] [int] NOT NULL,
 CONSTRAINT [PK_tb_statistic_rating] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_user]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_user](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[gender] [tinyint] NOT NULL,
	[first_name] [nvarchar](64) NOT NULL,
	[last_name] [nvarchar](64) NOT NULL,
	[email] [varchar](128) NOT NULL,
	[password] [varchar](60) NOT NULL,
	[birthday] [datetime] NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
	[state] [varchar](10) NOT NULL,
	[avatar] [varchar](1024) NULL,
 CONSTRAINT [PK_tb_user] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_user_role]    Script Date: 1/11/2018 2:39:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_user_role](
	[user_id] [int] NOT NULL,
	[user_role_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_user_role] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[user_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tb_address] ON 

INSERT [dbo].[tb_address] ([_id], [user_id], [province_id], [first_name], [last_name], [address], [phone_number], [city]) VALUES (1, 1, 44, N'Nhật Sang', N'Nguyễn', N'81/13 Hoàng Diệu, P. Lộc Phát', N'01643456554', N'TP. Bảo Lộc')
SET IDENTITY_INSERT [dbo].[tb_address] OFF
SET IDENTITY_INSERT [dbo].[tb_configuration] ON 

INSERT [dbo].[tb_configuration] ([_id], [key], [value]) VALUES (1, N'title', N'Smart Market')
INSERT [dbo].[tb_configuration] ([_id], [key], [value]) VALUES (2, N'description', N'Smart Market nơi cửa hàng đồ điện tử uy tín nhất dành cho bạn')
INSERT [dbo].[tb_configuration] ([_id], [key], [value]) VALUES (3, N'keyword', N'Smart Market, Shop Online, E-comerece')
INSERT [dbo].[tb_configuration] ([_id], [key], [value]) VALUES (4, N'favicon', N'assets/images/favicon/favicon-32x32.png')
SET IDENTITY_INSERT [dbo].[tb_configuration] OFF
SET IDENTITY_INSERT [dbo].[tb_image] ON 

INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (57, N'assets/images/site/2018/01/1515543720154-1024px-Apple_logo_black.svg.png', N'1024px-Apple_logo_black.svg.png', N'site', NULL, CAST(N'2018-01-10T07:22:00.167' AS DateTime), 1)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (58, N'assets/images/site/2018/01/1515543847450-apple-logo.jpg', N'apple-logo.jpg', N'site', NULL, CAST(N'2018-01-10T07:24:07.453' AS DateTime), 1)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (59, N'assets/images/site/2018/01/1515545273253-Samsung-logo-2015-Nobg-1024x768.png', N'Samsung-logo-2015-Nobg-1024x768.png', N'site', NULL, CAST(N'2018-01-10T07:47:53.267' AS DateTime), 1)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (60, N'assets/images/site/2018/01/1515547894492-1024px-Apple_logo_black.svg.png', N'1024px-Apple_logo_black.svg.png', N'site', NULL, CAST(N'2018-01-10T08:31:34.547' AS DateTime), 1)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (61, N'assets/images/site/2018/01/1515548808022-1024px-Apple_logo_black.svg.png', N'1024px-Apple_logo_black.svg.png', N'site', NULL, CAST(N'2018-01-10T08:46:48.023' AS DateTime), 1)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (62, N'assets/images/site/2018/01/1515548883190-64020381_p0.png', N'64020381_p0.png', N'site', NULL, CAST(N'2018-01-10T08:48:03.190' AS DateTime), 1)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (63, N'assets/images/site/2018/01/1515551693752-1024px-Apple_logo_black.svg.png', N'1024px-Apple_logo_black.svg.png', N'site', NULL, CAST(N'2018-01-10T09:34:53.773' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tb_image] OFF
INSERT [dbo].[tb_persistent_logins] ([username], [series], [token], [last_used]) VALUES (N'nhatsang38@gmail.com', N'zEMxbqwuk/ByEmXLBX/w7Q==', N'DT7TT2FTBT86jKI4nI3JGQ==', CAST(N'2018-01-11T08:05:33.617' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_product_category] ON 

INSERT [dbo].[tb_product_category] ([_id], [name], [slug], [description], [create_date], [update_date]) VALUES (2, N'Laptop', N'laptop', N'A laptop or notebook computer is a small, portable PC. It is usually lightweight, depending on the manufacturer and model for other uses', CAST(N'2018-01-11T05:18:57.173' AS DateTime), NULL)
INSERT [dbo].[tb_product_category] ([_id], [name], [slug], [description], [create_date], [update_date]) VALUES (3, N'Desktop', N'desktop', N'Personal computer (PC) is a small computer with its price, size and compatibility making it useful for the individual.', CAST(N'2018-01-11T06:03:51.553' AS DateTime), NULL)
INSERT [dbo].[tb_product_category] ([_id], [name], [slug], [description], [create_date], [update_date]) VALUES (4, N'Smart Phone', N'smart-phone', N'Smartphone is a concept that refers to a mobile phone that integrates a mobile operating system platform with many advanced connectivity features and connectivity based on the basic mobile platform.', CAST(N'2018-01-11T06:05:11.040' AS DateTime), NULL)
INSERT [dbo].[tb_product_category] ([_id], [name], [slug], [description], [create_date], [update_date]) VALUES (5, N'Smart TV', N'smart-tv', N'A smart TV, sometimes referred to as connected TV, hybrid TV, or intelly (portmanteau of the words intelligent and telly), is a television set with integrated Internet and interactive "Web 2.0" features. Smart TV is a technological convergence between computers and flatscreen television sets and set-top boxes. Besides the traditional functions of television sets and set-top boxes provided through traditional broadcasting media, these devices can also provide Internet TV, online interactive media, over-the-top content (OTT), as well as on-demand streaming media, and home networking access.', CAST(N'2018-01-11T06:07:29.237' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tb_product_category] OFF
SET IDENTITY_INSERT [dbo].[tb_province] ON 

INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (1, N'Thành phố Hà Nội', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (2, N'Hà Giang', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (3, N'Cao Bằng', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (4, N'Bắc Kạn', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (5, N'Tuyên Quang', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (6, N'Lào Cai', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (7, N'Điện Biên', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (8, N'Lai Châu', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (9, N'Sơn La', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (10, N'Yên Bái', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (11, N'Hoà Bình', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (12, N'Thái Nguyên', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (13, N'Lạng Sơn', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (14, N'Quảng Ninh', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (15, N'Bắc Giang', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (16, N'Phú Thọ', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (17, N'Vĩnh Phúc', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (18, N'Bắc Ninh', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (19, N'Hải Dương', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (20, N'Thành phố Hải Phòng', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (21, N'Hưng Yên', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (22, N'Thái Bình', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (23, N'Hà Nam', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (24, N'Nam Định', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (25, N'Ninh Bình', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (26, N'Thanh Hóa', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (27, N'Nghệ An', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (28, N'Hà Tĩnh', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (29, N'Quảng Bình', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (30, N'Quảng Trị', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (31, N'Thừa Thiên Huế', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (32, N'Thành phố Đà Nẵng', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (33, N'Quảng Nam', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (34, N'Quảng Ngãi', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (35, N'Bình Định', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (36, N'Phú Yên', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (37, N'Khánh Hòa', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (38, N'Ninh Thuận', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (39, N'Bình Thuận', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (40, N'Kon Tum', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (41, N'Gia Lai', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (42, N'Đắk Lắk', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (43, N'Đắk Nông', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (44, N'Lâm Đồng', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (45, N'Bình Phước', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (46, N'Tây Ninh', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (47, N'Bình Dương', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (48, N'Đồng Nai', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (49, N'Bà Rịa - Vũng Tàu', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (50, N'Thành phố Hồ Chí Minh', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (51, N'Long An', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (52, N'Tiền Giang', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (53, N'Bến Tre', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (54, N'Trà Vinh', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (55, N'Vĩnh Long', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (56, N'Đồng Tháp', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (57, N'An Giang', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (58, N'Kiên Giang', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (59, N'Thành phố Cần Thơ', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (60, N'Hậu Giang', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (61, N'Sóc Trăng', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (62, N'Bạc Liêu', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (63, N'Cà Mau', CAST(0 AS Decimal(13, 0)))
SET IDENTITY_INSERT [dbo].[tb_province] OFF
SET IDENTITY_INSERT [dbo].[tb_role] ON 

INSERT [dbo].[tb_role] ([_id], [name]) VALUES (1, N'ADMIN')
INSERT [dbo].[tb_role] ([_id], [name]) VALUES (2, N'USER')
SET IDENTITY_INSERT [dbo].[tb_role] OFF
SET IDENTITY_INSERT [dbo].[tb_user] ON 

INSERT [dbo].[tb_user] ([_id], [gender], [first_name], [last_name], [email], [password], [birthday], [create_date], [update_date], [state], [avatar]) VALUES (1, 1, N'Nhật Sang', N'Nguyễn', N'nhatsang38@gmail.com', N'$2a$10$T8F4GgXjLFgoLXg7.syHe.lpH156BseQhFAC8z0Df5pd.YEanA27G', CAST(N'2017-01-25T00:00:00.000' AS DateTime), CAST(N'2017-12-26T15:50:52.560' AS DateTime), NULL, N'Active', N'/assets/images/avatar.jpg')
INSERT [dbo].[tb_user] ([_id], [gender], [first_name], [last_name], [email], [password], [birthday], [create_date], [update_date], [state], [avatar]) VALUES (2, 1, N'Nhật Tiến', N'Nguyễn', N'nhatsang39@gmail.com', N'$2a$10$NCQqCEv1TBADCdBKm/ysfOYBQqbPwW9YMHzKyDMZti4eqJ0lovKHG', CAST(N'2018-01-03T00:00:00.000' AS DateTime), CAST(N'2018-01-03T04:41:24.477' AS DateTime), NULL, N'Active', NULL)
SET IDENTITY_INSERT [dbo].[tb_user] OFF
INSERT [dbo].[tb_user_role] ([user_id], [user_role_id]) VALUES (1, 1)
INSERT [dbo].[tb_user_role] ([user_id], [user_role_id]) VALUES (2, 2)
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tb_brand_slug_unique]    Script Date: 1/11/2018 2:39:11 PM ******/
ALTER TABLE [dbo].[tb_brand] ADD  CONSTRAINT [IX_tb_brand_slug_unique] UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tb_user_email]    Script Date: 1/11/2018 2:39:11 PM ******/
ALTER TABLE [dbo].[tb_user] ADD  CONSTRAINT [IX_tb_user_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_attribute] ADD  CONSTRAINT [DF_tb_attribute_priority]  DEFAULT ((0)) FOR [priority]
GO
ALTER TABLE [dbo].[tb_attribute_group] ADD  CONSTRAINT [DF_tb_attribute_group_priority]  DEFAULT ((0)) FOR [priority]
GO
ALTER TABLE [dbo].[tb_address]  WITH CHECK ADD  CONSTRAINT [FK_tb_address_tb_province] FOREIGN KEY([province_id])
REFERENCES [dbo].[tb_province] ([_id])
GO
ALTER TABLE [dbo].[tb_address] CHECK CONSTRAINT [FK_tb_address_tb_province]
GO
ALTER TABLE [dbo].[tb_address]  WITH CHECK ADD  CONSTRAINT [FK_tb_address_tb_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_address] CHECK CONSTRAINT [FK_tb_address_tb_user]
GO
ALTER TABLE [dbo].[tb_address_order]  WITH CHECK ADD  CONSTRAINT [FK_tb_address_order_tb_address] FOREIGN KEY([id_address])
REFERENCES [dbo].[tb_address] ([_id])
GO
ALTER TABLE [dbo].[tb_address_order] CHECK CONSTRAINT [FK_tb_address_order_tb_address]
GO
ALTER TABLE [dbo].[tb_address_order]  WITH CHECK ADD  CONSTRAINT [FK_tb_address_order_tb_order] FOREIGN KEY([id_order])
REFERENCES [dbo].[tb_order] ([_id])
GO
ALTER TABLE [dbo].[tb_address_order] CHECK CONSTRAINT [FK_tb_address_order_tb_order]
GO
ALTER TABLE [dbo].[tb_attribute]  WITH CHECK ADD  CONSTRAINT [FK_tb_attribute_tb_attribute_group] FOREIGN KEY([attribute_group_id])
REFERENCES [dbo].[tb_attribute_group] ([_id])
GO
ALTER TABLE [dbo].[tb_attribute] CHECK CONSTRAINT [FK_tb_attribute_tb_attribute_group]
GO
ALTER TABLE [dbo].[tb_attribute_group]  WITH CHECK ADD  CONSTRAINT [FK_tb_attribute_group_tb_product_category] FOREIGN KEY([product_category_id])
REFERENCES [dbo].[tb_product_category] ([_id])
GO
ALTER TABLE [dbo].[tb_attribute_group] CHECK CONSTRAINT [FK_tb_attribute_group_tb_product_category]
GO
ALTER TABLE [dbo].[tb_cart]  WITH CHECK ADD  CONSTRAINT [FK_tb_cart_tb_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_product] ([_id])
GO
ALTER TABLE [dbo].[tb_cart] CHECK CONSTRAINT [FK_tb_cart_tb_product]
GO
ALTER TABLE [dbo].[tb_cart]  WITH CHECK ADD  CONSTRAINT [FK_tb_cart_tb_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_cart] CHECK CONSTRAINT [FK_tb_cart_tb_user]
GO
ALTER TABLE [dbo].[tb_comment]  WITH CHECK ADD  CONSTRAINT [FK_tb_comment_tb_comment] FOREIGN KEY([parent_id])
REFERENCES [dbo].[tb_comment] ([_id])
GO
ALTER TABLE [dbo].[tb_comment] CHECK CONSTRAINT [FK_tb_comment_tb_comment]
GO
ALTER TABLE [dbo].[tb_comment]  WITH CHECK ADD  CONSTRAINT [FK_tb_comment_tb_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_comment] CHECK CONSTRAINT [FK_tb_comment_tb_user]
GO
ALTER TABLE [dbo].[tb_comment_post]  WITH CHECK ADD  CONSTRAINT [FK_tb_comment_post_tb_comment] FOREIGN KEY([comment_id])
REFERENCES [dbo].[tb_comment] ([_id])
GO
ALTER TABLE [dbo].[tb_comment_post] CHECK CONSTRAINT [FK_tb_comment_post_tb_comment]
GO
ALTER TABLE [dbo].[tb_comment_post]  WITH CHECK ADD  CONSTRAINT [FK_tb_comment_post_tb_post] FOREIGN KEY([post_id])
REFERENCES [dbo].[tb_post] ([_id])
GO
ALTER TABLE [dbo].[tb_comment_post] CHECK CONSTRAINT [FK_tb_comment_post_tb_post]
GO
ALTER TABLE [dbo].[tb_comment_product]  WITH CHECK ADD  CONSTRAINT [FK_tb_comment_product_tb_comment] FOREIGN KEY([comment_id])
REFERENCES [dbo].[tb_comment] ([_id])
GO
ALTER TABLE [dbo].[tb_comment_product] CHECK CONSTRAINT [FK_tb_comment_product_tb_comment]
GO
ALTER TABLE [dbo].[tb_comment_product]  WITH CHECK ADD  CONSTRAINT [FK_tb_comment_product_tb_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_product] ([_id])
GO
ALTER TABLE [dbo].[tb_comment_product] CHECK CONSTRAINT [FK_tb_comment_product_tb_product]
GO
ALTER TABLE [dbo].[tb_event_brand]  WITH CHECK ADD  CONSTRAINT [FK_tb_event_brand_tb_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[tb_brand] ([_id])
GO
ALTER TABLE [dbo].[tb_event_brand] CHECK CONSTRAINT [FK_tb_event_brand_tb_brand]
GO
ALTER TABLE [dbo].[tb_event_brand]  WITH CHECK ADD  CONSTRAINT [FK_tb_event_brand_tb_event] FOREIGN KEY([event_id])
REFERENCES [dbo].[tb_event] ([_id])
GO
ALTER TABLE [dbo].[tb_event_brand] CHECK CONSTRAINT [FK_tb_event_brand_tb_event]
GO
ALTER TABLE [dbo].[tb_event_category]  WITH CHECK ADD  CONSTRAINT [FK_tb_event_category_tb_event] FOREIGN KEY([event_id])
REFERENCES [dbo].[tb_event] ([_id])
GO
ALTER TABLE [dbo].[tb_event_category] CHECK CONSTRAINT [FK_tb_event_category_tb_event]
GO
ALTER TABLE [dbo].[tb_event_category]  WITH CHECK ADD  CONSTRAINT [FK_tb_event_category_tb_product_category] FOREIGN KEY([product_category_id])
REFERENCES [dbo].[tb_product_category] ([_id])
GO
ALTER TABLE [dbo].[tb_event_category] CHECK CONSTRAINT [FK_tb_event_category_tb_product_category]
GO
ALTER TABLE [dbo].[tb_event_order]  WITH CHECK ADD  CONSTRAINT [FK_tb_event_order_tb_event_order] FOREIGN KEY([event_id])
REFERENCES [dbo].[tb_event] ([_id])
GO
ALTER TABLE [dbo].[tb_event_order] CHECK CONSTRAINT [FK_tb_event_order_tb_event_order]
GO
ALTER TABLE [dbo].[tb_event_order]  WITH CHECK ADD  CONSTRAINT [FK_tb_event_order_tb_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tb_order] ([_id])
GO
ALTER TABLE [dbo].[tb_event_order] CHECK CONSTRAINT [FK_tb_event_order_tb_order]
GO
ALTER TABLE [dbo].[tb_event_product]  WITH CHECK ADD  CONSTRAINT [FK_tb_event_product_tb_event] FOREIGN KEY([event_id])
REFERENCES [dbo].[tb_event] ([_id])
GO
ALTER TABLE [dbo].[tb_event_product] CHECK CONSTRAINT [FK_tb_event_product_tb_event]
GO
ALTER TABLE [dbo].[tb_event_product]  WITH CHECK ADD  CONSTRAINT [FK_tb_event_product_tb_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_product] ([_id])
GO
ALTER TABLE [dbo].[tb_event_product] CHECK CONSTRAINT [FK_tb_event_product_tb_product]
GO
ALTER TABLE [dbo].[tb_image]  WITH CHECK ADD  CONSTRAINT [FK_tb_image_tb_user] FOREIGN KEY([uploader_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_image] CHECK CONSTRAINT [FK_tb_image_tb_user]
GO
ALTER TABLE [dbo].[tb_menu]  WITH CHECK ADD  CONSTRAINT [FK_tb_menu_tb_menu] FOREIGN KEY([parent_id])
REFERENCES [dbo].[tb_menu] ([_id])
GO
ALTER TABLE [dbo].[tb_menu] CHECK CONSTRAINT [FK_tb_menu_tb_menu]
GO
ALTER TABLE [dbo].[tb_menu]  WITH CHECK ADD  CONSTRAINT [FK_tb_menu_tb_menu_group] FOREIGN KEY([group_menu_id])
REFERENCES [dbo].[tb_menu_group] ([_id])
GO
ALTER TABLE [dbo].[tb_menu] CHECK CONSTRAINT [FK_tb_menu_tb_menu_group]
GO
ALTER TABLE [dbo].[tb_notification]  WITH CHECK ADD  CONSTRAINT [FK_tb_notification_tb_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_notification] CHECK CONSTRAINT [FK_tb_notification_tb_user]
GO
ALTER TABLE [dbo].[tb_order]  WITH CHECK ADD  CONSTRAINT [FK_tb_order_tb_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_order] CHECK CONSTRAINT [FK_tb_order_tb_user]
GO
ALTER TABLE [dbo].[tb_order_detail]  WITH CHECK ADD  CONSTRAINT [FK_tb_order_detail_tb_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tb_order] ([_id])
GO
ALTER TABLE [dbo].[tb_order_detail] CHECK CONSTRAINT [FK_tb_order_detail_tb_order]
GO
ALTER TABLE [dbo].[tb_post]  WITH CHECK ADD  CONSTRAINT [FK_tb_post_tb_post_category] FOREIGN KEY([post_category_id])
REFERENCES [dbo].[tb_post_category] ([_id])
GO
ALTER TABLE [dbo].[tb_post] CHECK CONSTRAINT [FK_tb_post_tb_post_category]
GO
ALTER TABLE [dbo].[tb_post]  WITH CHECK ADD  CONSTRAINT [FK_tb_post_tb_user] FOREIGN KEY([publisher_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_post] CHECK CONSTRAINT [FK_tb_post_tb_user]
GO
ALTER TABLE [dbo].[tb_product]  WITH CHECK ADD  CONSTRAINT [FK_tb_product_tb_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[tb_brand] ([_id])
GO
ALTER TABLE [dbo].[tb_product] CHECK CONSTRAINT [FK_tb_product_tb_brand]
GO
ALTER TABLE [dbo].[tb_product]  WITH CHECK ADD  CONSTRAINT [FK_tb_product_tb_product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[tb_product_category] ([_id])
GO
ALTER TABLE [dbo].[tb_product] CHECK CONSTRAINT [FK_tb_product_tb_product_category]
GO
ALTER TABLE [dbo].[tb_product]  WITH CHECK ADD  CONSTRAINT [FK_tb_product_tb_user] FOREIGN KEY([publisher_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_product] CHECK CONSTRAINT [FK_tb_product_tb_user]
GO
ALTER TABLE [dbo].[tb_product_attribute]  WITH CHECK ADD  CONSTRAINT [FK_tb_product_attribute_tb_attribute] FOREIGN KEY([attribute_id])
REFERENCES [dbo].[tb_attribute] ([_id])
GO
ALTER TABLE [dbo].[tb_product_attribute] CHECK CONSTRAINT [FK_tb_product_attribute_tb_attribute]
GO
ALTER TABLE [dbo].[tb_product_attribute]  WITH CHECK ADD  CONSTRAINT [FK_tb_product_attribute_tb_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_product] ([_id])
GO
ALTER TABLE [dbo].[tb_product_attribute] CHECK CONSTRAINT [FK_tb_product_attribute_tb_product]
GO
ALTER TABLE [dbo].[tb_product_views]  WITH CHECK ADD  CONSTRAINT [FK_tb_product_vierws_tb_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_product] ([_id])
GO
ALTER TABLE [dbo].[tb_product_views] CHECK CONSTRAINT [FK_tb_product_vierws_tb_product]
GO
ALTER TABLE [dbo].[tb_rating]  WITH CHECK ADD  CONSTRAINT [FK_tb_rating_tb_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_product] ([_id])
GO
ALTER TABLE [dbo].[tb_rating] CHECK CONSTRAINT [FK_tb_rating_tb_product]
GO
ALTER TABLE [dbo].[tb_rating]  WITH CHECK ADD  CONSTRAINT [FK_tb_rating_tb_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_rating] CHECK CONSTRAINT [FK_tb_rating_tb_user]
GO
ALTER TABLE [dbo].[tb_statistic_product_views]  WITH CHECK ADD  CONSTRAINT [FK_tb_statistic_product_views_tb_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_product] ([_id])
GO
ALTER TABLE [dbo].[tb_statistic_product_views] CHECK CONSTRAINT [FK_tb_statistic_product_views_tb_product]
GO
ALTER TABLE [dbo].[tb_statistic_rating]  WITH CHECK ADD  CONSTRAINT [FK_tb_statistic_rating_tb_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_product] ([_id])
GO
ALTER TABLE [dbo].[tb_statistic_rating] CHECK CONSTRAINT [FK_tb_statistic_rating_tb_product]
GO
ALTER TABLE [dbo].[tb_user_role]  WITH CHECK ADD  CONSTRAINT [FK_tb_user_role_tb_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_user_role] CHECK CONSTRAINT [FK_tb_user_role_tb_user]
GO
ALTER TABLE [dbo].[tb_user_role]  WITH CHECK ADD  CONSTRAINT [FK_tb_user_role_tb_user_role] FOREIGN KEY([user_role_id])
REFERENCES [dbo].[tb_role] ([_id])
GO
ALTER TABLE [dbo].[tb_user_role] CHECK CONSTRAINT [FK_tb_user_role_tb_user_role]
GO
USE [master]
GO
ALTER DATABASE [SmartMarket] SET  READ_WRITE 
GO
