USE [master]
GO
/****** Object:  Database [comp229project]    Script Date: 12/4/2016 11:29:26 PM ******/
CREATE DATABASE [comp229project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'comp229project', FILENAME = N'E:\SQLServer\MSSQL13.SQLEXPRESS\MSSQL\DATA\comp229project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'comp229project_log', FILENAME = N'E:\SQLServer\MSSQL13.SQLEXPRESS\MSSQL\DATA\comp229project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [comp229project] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [comp229project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [comp229project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [comp229project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [comp229project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [comp229project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [comp229project] SET ARITHABORT OFF 
GO
ALTER DATABASE [comp229project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [comp229project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [comp229project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [comp229project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [comp229project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [comp229project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [comp229project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [comp229project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [comp229project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [comp229project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [comp229project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [comp229project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [comp229project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [comp229project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [comp229project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [comp229project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [comp229project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [comp229project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [comp229project] SET  MULTI_USER 
GO
ALTER DATABASE [comp229project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [comp229project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [comp229project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [comp229project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [comp229project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [comp229project] SET QUERY_STORE = OFF
GO
USE [comp229project]
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
USE [comp229project]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 12/4/2016 11:29:27 PM ******/
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
/****** Object:  Table [dbo].[Game]    Script Date: 12/4/2016 11:29:27 PM ******/
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
/****** Object:  Table [dbo].[Item]    Script Date: 12/4/2016 11:29:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](150) NOT NULL,
	[type] [int] NOT NULL,
	[description] [varchar](3000) NULL,
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
/****** Object:  Table [dbo].[Loan]    Script Date: 12/4/2016 11:29:27 PM ******/
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
/****** Object:  Table [dbo].[Movie]    Script Date: 12/4/2016 11:29:27 PM ******/
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
/****** Object:  Table [dbo].[Platform]    Script Date: 12/4/2016 11:29:27 PM ******/
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
/****** Object:  Table [dbo].[Review]    Script Date: 12/4/2016 11:29:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[Id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Status]    Script Date: 12/4/2016 11:29:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Type]    Script Date: 12/4/2016 11:29:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](50) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/4/2016 11:29:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](15) NOT NULL,
	[Password] [varchar](25) NOT NULL,
	[userRole] [varchar](25) NOT NULL,
	[Email] [varchar](50) NULL,
	[Birthdate] [date] NULL,
	[Picture] [varchar](50) NULL,
	[Registered_date] [date] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [name], [type], [description], [status], [completed], [cover_image], [publisher], [release_date], [info_url], [quantity], [registered_date], [registered_by], [updated_date], [updated_by]) VALUES (2, N'Hobbit', 3, N'<pre class="notranslate" lang="aspnet">extend the confirmation <strong>message to include details ab</strong>out the particular <br />record, such as, "Are you sure you want to delete the Chai product?" Such <br />customization is also possi<strong>ble in templates</strong> using data-binding syntax.</pre>', 1, 35, N'big_logo.png', NULL, CAST(N'2016-12-14' AS Date), NULL, 121, CAST(N'2016-12-14' AS Date), 1, CAST(N'2016-12-02' AS Date), 1)
INSERT [dbo].[Item] ([Id], [name], [type], [description], [status], [completed], [cover_image], [publisher], [release_date], [info_url], [quantity], [registered_date], [registered_by], [updated_date], [updated_by]) VALUES (3, N'Narnia', 1, N'<h3 id="markdown-header-how-to-build-and-run">How to build and run?</h3>
<p>This is a <a href="http://laravel.com/">laravel</a> application. Follow these steps to suceessfully build and run it:</p>', 1, 50, N'favicon.ico', NULL, NULL, NULL, NULL, NULL, 4, NULL, 4)
INSERT [dbo].[Item] ([Id], [name], [type], [description], [status], [completed], [cover_image], [publisher], [release_date], [info_url], [quantity], [registered_date], [registered_by], [updated_date], [updated_by]) VALUES (4, N'Harry Porter - 1', 1, NULL, 1, 5, N'logo.jpg', NULL, NULL, NULL, NULL, NULL, 1, NULL, 3)
INSERT [dbo].[Item] ([Id], [name], [type], [description], [status], [completed], [cover_image], [publisher], [release_date], [info_url], [quantity], [registered_date], [registered_by], [updated_date], [updated_by]) VALUES (5, N'Harry Porter - 2', 1, NULL, 1, 50, N'big_logo.png', NULL, NULL, NULL, NULL, NULL, 1, NULL, 4)
INSERT [dbo].[Item] ([Id], [name], [type], [description], [status], [completed], [cover_image], [publisher], [release_date], [info_url], [quantity], [registered_date], [registered_by], [updated_date], [updated_by]) VALUES (6, N'Antifragile', 1, N'<p>The <span class="input">Values</span> and <span class="input">NewValues</span> dictionaries contain the current values from the controls in the record being inserted or edited in the <a href="https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.formview.aspx">FormView</a> control. The <span class="input">OldValues</span> dictionary contains any original values of fields except the key fields, which are included in the <span class="input">Keys </span>dictionary. New values for editable key fields are contained in the <span class="input">NewValues</span> dictionary.</p>
<p>The data source control uses the values from the <span class="input">Keys</span>, <span class="input">Values</span>, <span class="input">NewValues</span>, and <span class="input">OldValues</span> dictionaries as parameters for the insert, update, or delete command. For information about how data source control parameters are created based on the dictionaries created for bound values, see <a href="https://msdn.microsoft.com/en-us/library/ms228051.aspx">Using Parameters with Data Source Controls for Inserting and Updating</a>.</p>
<p>After the update is complete, the <a href="https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.formview.aspx">FormView</a> control raises its <a href="https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.formview.itemupdated.aspx">ItemUpdated</a> event. This event allows you to perform post-query logic such as integrity checks. Similarly, the <a href="https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.formview.aspx">FormView</a> control raises its <a href="https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.formview.iteminserted.aspx">ItemInserted</a> event after an insert, and its <a href="https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.formview.itemdeleted.aspx">ItemDeleted</a> event after a delete.</p>
<p>After the update is complete and all events have been raised, the <a href="https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.formview.aspx">FormView</a> control rebinds to the data source control.</p>', 2, 50, N'big_logo.png', N'Eu', CAST(N'2016-12-03' AS Date), N'www.uol.com.br', 12, NULL, 2, CAST(N'2016-12-03' AS Date), 3)
INSERT [dbo].[Item] ([Id], [name], [type], [description], [status], [completed], [cover_image], [publisher], [release_date], [info_url], [quantity], [registered_date], [registered_by], [updated_date], [updated_by]) VALUES (7, N'Fast and Slow', 1, NULL, 3, 50, N'logo.jpg', NULL, NULL, NULL, NULL, NULL, 1, NULL, 2)
INSERT [dbo].[Item] ([Id], [name], [type], [description], [status], [completed], [cover_image], [publisher], [release_date], [info_url], [quantity], [registered_date], [registered_by], [updated_date], [updated_by]) VALUES (8, N'Batman', 2, N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1)
INSERT [dbo].[Item] ([Id], [name], [type], [description], [status], [completed], [cover_image], [publisher], [release_date], [info_url], [quantity], [registered_date], [registered_by], [updated_date], [updated_by]) VALUES (9, N'Man of Steel', 4, N'<p>asfadsfasdf asdfaa fdaadfa</p>
<p>df</p>
<p>afas&nbsp;</p>', 3, 1, N'1', N'2', CAST(N'2016-12-07' AS Date), N'111', 11, NULL, 1, NULL, 2)
INSERT [dbo].[Item] ([Id], [name], [type], [description], [status], [completed], [cover_image], [publisher], [release_date], [info_url], [quantity], [registered_date], [registered_by], [updated_date], [updated_by]) VALUES (10, N'Matrix Reloaded', 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 3)
INSERT [dbo].[Item] ([Id], [name], [type], [description], [status], [completed], [cover_image], [publisher], [release_date], [info_url], [quantity], [registered_date], [registered_by], [updated_date], [updated_by]) VALUES (11, N'Lego Batman', 3, N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 2)
INSERT [dbo].[Item] ([Id], [name], [type], [description], [status], [completed], [cover_image], [publisher], [release_date], [info_url], [quantity], [registered_date], [registered_by], [updated_date], [updated_by]) VALUES (12, N'Witcher 3', 3, N'<ol>
<li style="text-align: right;">asdf<span style="background-color: #ff6600;">asdf<strong>asdfasfas<em>dfa</em></strong></span><em><span style="background-color: #ff6600;">a</span>fsdfasdf</em></li>
<li style="text-align: right;"><span style="color: #b35785;"><em>adsf</em></span></li>
<li style="text-align: right;"><span style="color: #b35785;"><em>asdfa</em></span></li>
</ol>
<h2 style="text-align: right;">&nbsp;</h2>', 1, 50, N'librarylogo.jpg', NULL, CAST(N'2016-12-06' AS Date), NULL, NULL, CAST(N'2016-12-06' AS Date), 1, CAST(N'2016-12-16' AS Date), 1)
INSERT [dbo].[Item] ([Id], [name], [type], [description], [status], [completed], [cover_image], [publisher], [release_date], [info_url], [quantity], [registered_date], [registered_by], [updated_date], [updated_by]) VALUES (13, N'Diablo', 3, N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 2)
INSERT [dbo].[Item] ([Id], [name], [type], [description], [status], [completed], [cover_image], [publisher], [release_date], [info_url], [quantity], [registered_date], [registered_by], [updated_date], [updated_by]) VALUES (14, N'World at War', 3, NULL, 1, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), NULL, NULL, CAST(N'2016-12-15' AS Date), 2, CAST(N'2016-12-07' AS Date), 3)
INSERT [dbo].[Item] ([Id], [name], [type], [description], [status], [completed], [cover_image], [publisher], [release_date], [info_url], [quantity], [registered_date], [registered_by], [updated_date], [updated_by]) VALUES (19, N'asdfas', 4, N'???1', 2, NULL, NULL, NULL, CAST(N'2016-12-14' AS Date), NULL, NULL, CAST(N'2016-12-15' AS Date), 3, CAST(N'2016-12-09' AS Date), 4)
INSERT [dbo].[Item] ([Id], [name], [type], [description], [status], [completed], [cover_image], [publisher], [release_date], [info_url], [quantity], [registered_date], [registered_by], [updated_date], [updated_by]) VALUES (24, N'Uncharted', 3, N'<p>safsf</p>
<p>asdfas</p>
<p>f&nbsp;</p>', 1, 0, N'big_logo.png', N'NaghtyDog', CAST(N'2016-12-08' AS Date), N'qwerqwer', NULL, CAST(N'2016-12-09' AS Date), 1, CAST(N'2016-12-07' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (2, 2, 2, 2, N'1111', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (3, NULL, 2, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (4, NULL, 2, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (6, 2, 2, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (7, 2, 2, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (8, 2, 2, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (9, 2, 2, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (10, 2, 2, 2, N'3333', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (11, 2, 2, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (12, 2, 2, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (13, 2, 2, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (14, 2, 2, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (15, 2, 2, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (16, 2, 2, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (17, 2, 2, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (18, 2, 2, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (19, 2, 2, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (20, 2, 2, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (21, 2, 2, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (22, 2, 3, 22222222, N'2222222222', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (23, 3, 2, 333, N'33333', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (24, 3, 2, 333, N'33333', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (25, 3, 2, 333, N'33333', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (26, 3, 3, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (27, 6, 1, NULL, NULL, NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (28, 6, 1, NULL, NULL, NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (29, 7, 1, NULL, NULL, NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (30, 7, 1, NULL, NULL, NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (31, 7, 4, NULL, NULL, NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (32, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (33, 7, 4, NULL, NULL, NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (34, 9, 4, 3, NULL, CAST(N'2016-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (35, 9, 4, 3, NULL, CAST(N'2016-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (36, 2, 4, 3, NULL, CAST(N'2016-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (37, 2, 4, 3, NULL, CAST(N'2016-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (38, 5, 4, NULL, NULL, NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (39, 5, 4, NULL, NULL, NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (40, 9, 4, NULL, NULL, NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (41, 9, 2, 2, N'ewrqwrwe', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (42, 9, 2, 2, N'edqerqerwqrwe', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (43, 9, 4, NULL, NULL, NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (44, 9, 4, NULL, NULL, NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (45, 9, 2, 2, N'fsadfasdfsfs', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (46, 9, 1, 1, N'dsfasfafa', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (47, 9, 1, 1, N'eqeqeqwqw', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (48, 9, 4, 5, N'34343', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (49, 9, 4, 4, N'4', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (50, 9, 4, 4, N'4', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (51, 6, 1, 1, N'121212', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (52, 6, 3, 2, N'1212121', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (53, 6, 4, 2, N'221212', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (54, 6, 4, 1, N'121212', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (55, 6, 4, 4, N'121212', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (56, 6, 4, 2, N'1212121222212122', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (57, 6, 4, NULL, NULL, NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (58, 6, NULL, 2, N'wrtwetwre', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (59, 6, NULL, 2, N'ewrtwertwet', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (60, 6, NULL, 2, N'warwqtwertew', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (61, 6, NULL, 2, N'1212212122', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (62, 6, NULL, 2, N'1212212122', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (63, 6, NULL, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (64, 6, NULL, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (65, 6, NULL, 2, N'4', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (66, 3, NULL, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (67, 3, NULL, 3, N'3', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (68, 3, NULL, 3, N'3', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (69, 3, NULL, 3, N'3', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (70, 3, NULL, 2, N'edfdfdsfadf', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (71, 3, 4, 2, N'22222', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (72, 3, 4, NULL, NULL, NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (73, 2, 4, NULL, NULL, NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (74, 4, 2, 2, N'tyfygfjgf', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (75, 5, 4, NULL, NULL, NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (76, 5, 2, 2, N'2', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (77, 5, 4, 5, N'fafafaf', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (78, 5, 4, 3, N'asdfsdfasdfafadf', NULL)
INSERT [dbo].[Review] ([Id], [Item], [Username], [Score], [Comment], [Registered_date]) VALUES (79, 7, 4, 5, N'aDFAFASDFASDFSDFS', NULL)
SET IDENTITY_INSERT [dbo].[Review] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([id], [status]) VALUES (1, N'Owned')
INSERT [dbo].[Status] ([id], [status]) VALUES (2, N'Wanted')
INSERT [dbo].[Status] ([id], [status]) VALUES (3, N'Loaned')
INSERT [dbo].[Status] ([id], [status]) VALUES (4, N'Lost')
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([id], [type]) VALUES (1, N'Book')
INSERT [dbo].[Type] ([id], [type]) VALUES (2, N'Movie')
INSERT [dbo].[Type] ([id], [type]) VALUES (3, N'Game')
INSERT [dbo].[Type] ([id], [type]) VALUES (4, N'Other')
SET IDENTITY_INSERT [dbo].[Type] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [userRole], [Email], [Birthdate], [Picture], [Registered_date]) VALUES (1, N'admin', N'admin', N'admin', N'sagfasdf@qwqwqwqwqdasdf.adfa', CAST(N'2016-12-15' AS Date), N'logo.jpg', CAST(N'2016-12-16' AS Date))
INSERT [dbo].[Users] ([Id], [Username], [Password], [userRole], [Email], [Birthdate], [Picture], [Registered_date]) VALUES (2, N'user', N'user', N'admin', N'qwer@afdasd.cs', NULL, N'big_logo.png', NULL)
INSERT [dbo].[Users] ([Id], [Username], [Password], [userRole], [Email], [Birthdate], [Picture], [Registered_date]) VALUES (3, N'naruto', N'123456', N'user', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [Username], [Password], [userRole], [Email], [Birthdate], [Picture], [Registered_date]) VALUES (4, N'jiraya', N'123456', N'admin', NULL, NULL, N'logo.png', NULL)
INSERT [dbo].[Users] ([Id], [Username], [Password], [userRole], [Email], [Birthdate], [Picture], [Registered_date]) VALUES (10, N'12341234', N'123456', N'admin', N'lui@luiz.com', CAST(N'2016-12-09' AS Date), N'big_logo.png', NULL)
INSERT [dbo].[Users] ([Id], [Username], [Password], [userRole], [Email], [Birthdate], [Picture], [Registered_date]) VALUES (12, N'nana', N'123', N'user', N'jkn@jk.co', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [Username], [Password], [userRole], [Email], [Birthdate], [Picture], [Registered_date]) VALUES (16, N'sasuke', N'123456', N'admin', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [Username], [Password], [userRole], [Email], [Birthdate], [Picture], [Registered_date]) VALUES (17, N'kakashi', N'123456', N'admin', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [PK_Users]    Script Date: 12/4/2016 11:29:27 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [PK_Users] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_User] FOREIGN KEY([Username])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_User]
GO
USE [master]
GO
ALTER DATABASE [comp229project] SET  READ_WRITE 
GO
