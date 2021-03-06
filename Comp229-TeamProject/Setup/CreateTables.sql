USE [Comp229-TeamProject]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 11/24/2016 7:44:27 PM ******/
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
/****** Object:  Table [dbo].[Game]    Script Date: 11/24/2016 7:44:27 PM ******/
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
/****** Object:  Table [dbo].[Item]    Script Date: 11/24/2016 7:44:27 PM ******/
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
/****** Object:  Table [dbo].[Loan]    Script Date: 11/24/2016 7:44:27 PM ******/
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
/****** Object:  Table [dbo].[Movie]    Script Date: 11/24/2016 7:44:27 PM ******/
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
/****** Object:  Table [dbo].[Platform]    Script Date: 11/24/2016 7:44:27 PM ******/
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
/****** Object:  Table [dbo].[Review]    Script Date: 11/24/2016 7:44:27 PM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 11/24/2016 7:44:27 PM ******/
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
/****** Object:  Table [dbo].[Type]    Script Date: 11/24/2016 7:44:27 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 11/24/2016 7:44:27 PM ******/
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
