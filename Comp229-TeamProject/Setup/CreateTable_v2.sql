USE [Comp229-TeamProject]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 11/24/2016 7:46:38 PM ******/
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
/****** Object:  Table [dbo].[Loan]    Script Date: 11/24/2016 7:46:38 PM ******/
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
/****** Object:  Table [dbo].[Review]    Script Date: 11/24/2016 7:46:38 PM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 11/24/2016 7:46:38 PM ******/
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
/****** Object:  Table [dbo].[Type]    Script Date: 11/24/2016 7:46:38 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 11/24/2016 7:46:38 PM ******/
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


/* Insert example data */
USE [Comp229-TeamProject]
GO

INSERT INTO [dbo].[Users]
           ([Username]
           ,[Password]
           ,[userRole])
           
     VALUES
           ('jiraya','123456', 'admin'),		   
           ('jaspion','123456', 'admin'),
		   ('naruto','123456', 'user'),
		   ('user1', '123456', 'user') 
GO

INSERT INTO [dbo].[Status]
           ([status])
     VALUES
           ('Owned'),('Wanted'),('Loaned'),('Lost')
GO

INSERT INTO [dbo].[Type]
           ([type])
     VALUES
           ('Book'),('Movie'),('Game'),('Other')
GO

INSERT INTO [dbo].[Item]
           ([name]
           ,[type]
           ,[description]
           ,[status])
     VALUES
           ('Lord of the Rings', 1, '', 1),
		   ('Hobbit', 1, '', 1),
		   ('Narnia', 1, '', 1),
		   ('Harry Porter - 1', 1, '', 1),
		   ('Harry Porter - 2', 1, '', 1),
		   ('Antifragile', 1, '', 2),
		   ('Fast and Slow', 1, '', 3),
		   ('Batman', 2, '', 1),
		   ('Man of Steel', 2, '', 1),
		   ('Matrix Reloaded', 2, '', 1),
		   ('Lego Batman', 3, '', 1),
		   ('Witcher 3', 3, '', 1),
		   ('Diablo', 3, '', 1),
		   ('World at War', 3, '', 1)
GO

