USE [master]
GO
/****** Object:  Database [OnlineMarket]    Script Date: 1/11/2018 7:32:55 AM ******/
CREATE DATABASE [OnlineMarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineMarket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\OnlineMarket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineMarket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\OnlineMarket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineMarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineMarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineMarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineMarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineMarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineMarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineMarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineMarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineMarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineMarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineMarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineMarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineMarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineMarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineMarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineMarket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineMarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineMarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineMarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineMarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineMarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineMarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineMarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineMarket] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineMarket] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineMarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineMarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineMarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineMarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineMarket] SET DELAYED_DURABILITY = DISABLED 
GO
USE [OnlineMarket]
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
USE [OnlineMarket]
GO
/****** Object:  Table [dbo].[persistent_logins]    Script Date: 1/11/2018 7:32:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persistent_logins](
	[username] [nvarchar](64) NOT NULL,
	[series] [varchar](64) NOT NULL,
	[token] [varchar](64) NOT NULL,
	[last_used] [timestamp] NOT NULL,
 CONSTRAINT [PK_persistent_logins] PRIMARY KEY CLUSTERED 
(
	[series] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [OnlineMarket] SET  READ_WRITE 
GO
