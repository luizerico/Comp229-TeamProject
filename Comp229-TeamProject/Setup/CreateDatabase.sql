USE [master]
GO
/****** Object:  Database [Comp229-TeamProject]    Script Date: 11/24/2016 7:42:18 PM ******/
CREATE DATABASE [Comp229-TeamProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Comp229-TeamProject', FILENAME = N'E:\SQLServer\MSSQL13.SQLEXPRESS\MSSQL\DATA\Comp229-TeamProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Comp229-TeamProject_log', FILENAME = N'E:\SQLServer\MSSQL13.SQLEXPRESS\MSSQL\DATA\Comp229-TeamProject.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Comp229-TeamProject] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Comp229-TeamProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Comp229-TeamProject] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [Comp229-TeamProject] SET ANSI_NULLS ON 
GO
ALTER DATABASE [Comp229-TeamProject] SET ANSI_PADDING ON 
GO
ALTER DATABASE [Comp229-TeamProject] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [Comp229-TeamProject] SET ARITHABORT ON 
GO
ALTER DATABASE [Comp229-TeamProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Comp229-TeamProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Comp229-TeamProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Comp229-TeamProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Comp229-TeamProject] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [Comp229-TeamProject] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [Comp229-TeamProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Comp229-TeamProject] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [Comp229-TeamProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Comp229-TeamProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Comp229-TeamProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Comp229-TeamProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Comp229-TeamProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Comp229-TeamProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Comp229-TeamProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Comp229-TeamProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Comp229-TeamProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Comp229-TeamProject] SET RECOVERY FULL 
GO
ALTER DATABASE [Comp229-TeamProject] SET  MULTI_USER 
GO
ALTER DATABASE [Comp229-TeamProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Comp229-TeamProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Comp229-TeamProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Comp229-TeamProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Comp229-TeamProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Comp229-TeamProject] SET QUERY_STORE = OFF
GO
USE [Comp229-TeamProject]
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
USE [Comp229-TeamProject]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 11/24/2016 7:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] NOT NULL,
	[ISBN] [varchar](50) NULL,
	[Author] [varchar](50) NULL,
	[Type] [int] NULL,
	[Pages] [int] NULL,
	[Edition] [int] NULL,
	[Ebook] [bit] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Game]    Script Date: 11/24/2016 7:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[Id] [int] NOT NULL,
	[ASIN] [varchar](50) NULL,
	[ESRB] [varchar](50) NULL,
	[Studio] [varchar](50) NULL,
	[Platform] [int] NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item]    Script Date: 11/24/2016 7:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[type] [int] NOT NULL,
	[description] [varbinary](250) NULL,
	[status] [int] NOT NULL,
	[completed] [int] NULL,
	[cover_image] [varchar](150) NULL,
	[publisher] [varchar](150) NULL,
	[release_date] [date] NULL,
	[info_url] [varchar](150) NULL,
	[quantity] [int] NULL,
	[registered_date] [date] NULL,
	[registered_by] [int] NULL,
	[updated_date] [date] NULL,
	[updated_by] [int] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Loan]    Script Date: 11/24/2016 7:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loan](
	[Id] [int] NOT NULL,
	[Item] [int] NULL,
	[User] [int] NULL,
	[StartLoan] [date] NULL,
	[EndLoan] [date] NULL,
	[Delay] [int] NULL,
	[Notes] [varchar](250) NULL,
	[Registered] [datetime] NULL,
 CONSTRAINT [PK_Loan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movie]    Script Date: 11/24/2016 7:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[Id] [int] NOT NULL,
	[IMDB] [varchar](50) NULL,
	[Director] [varchar](50) NULL,
	[Studio] [varchar](50) NULL,
	[Type] [int] NULL,
	[Duration] [int] NULL,
	[Digital] [bit] NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Platform]    Script Date: 11/24/2016 7:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Platform](
	[Id] [int] NOT NULL,
	[Platform] [varchar](50) NULL,
 CONSTRAINT [PK_Platform] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Review]    Script Date: 11/24/2016 7:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[Id] [int] NOT NULL,
	[Item] [int] NULL,
	[Username] [int] NULL,
	[Score] [int] NULL,
	[Comment] [varchar](250) NULL,
	[Registered_date] [datetime] NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 11/24/2016 7:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id] [int] NOT NULL,
	[status] [varchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Type]    Script Date: 11/24/2016 7:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] NOT NULL,
	[type] [varchar](50) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/24/2016 7:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] NOT NULL,
	[uname] [varchar](15) NOT NULL,
	[Pwd] [varchar](25) NOT NULL,
	[userRole] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Type] FOREIGN KEY([Type])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Type]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Platform] FOREIGN KEY([Platform])
REFERENCES [dbo].[Platform] ([Id])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_Platform]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Type] FOREIGN KEY([Type])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_Type]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Registered] FOREIGN KEY([registered_by])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Registered]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Status] FOREIGN KEY([status])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Status]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Type] FOREIGN KEY([type])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Type]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Updated] FOREIGN KEY([updated_by])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Updated]
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_Loan] FOREIGN KEY([Item])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_Loan]
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Type] FOREIGN KEY([Type])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_Type]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Item] FOREIGN KEY([Item])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Item]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_User] FOREIGN KEY([Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_User]
GO
USE [master]
GO
ALTER DATABASE [Comp229-TeamProject] SET  READ_WRITE 
GO
