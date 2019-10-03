USE [Filmer]
GO
/****** Object:  Table [dbo].[CinemaLocation]    Script Date: 2019-09-26 12:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CinemaLocation](
	[CinemaLocationID] [int] NOT NULL,
	[City] [nvarchar](255) NOT NULL,
	[CinemaAddress] [nvarchar](255) NOT NULL,
	[CinemaName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CinemaLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2019-09-26 12:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] NOT NULL,
	[Mail] [nvarchar](255) NOT NULL,
	[MemberID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerViewing]    Script Date: 2019-09-26 12:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerViewing](
	[CustomerViewingID] [int] IDENTITY(1,1) NOT NULL,
	[ViewingDate] [datetime] NOT NULL,
	[ViewingID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerViewingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 2019-09-26 12:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberID] [int] NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[PhoneNumber] [nvarchar](255) NULL,
	[MemberPassword] [nvarchar](255) NOT NULL,
	[JoinDate] [datetime] NOT NULL,
	[MemberAdmin] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieApi]    Script Date: 2019-09-26 12:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieApi](
	[MovieApiID] [int] NOT NULL,
	[MovieKey] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieApiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salon]    Script Date: 2019-09-26 12:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salon](
	[SalonID] [int] IDENTITY(1,1) NOT NULL,
	[CinemaLocationID] [int] NOT NULL,
	[SalonNumber] [int] NOT NULL,
	[MaxSeats] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SalonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Viewing]    Script Date: 2019-09-26 12:27:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Viewing](
	[ViewingID] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[MovieApiID] [int] NOT NULL,
	[SalonID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ViewingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Salon]  WITH CHECK ADD FOREIGN KEY([CinemaLocationID])
REFERENCES [dbo].[CinemaLocation] ([CinemaLocationID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[CustomerViewing]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[CustomerViewing]  WITH CHECK ADD FOREIGN KEY([ViewingID])
REFERENCES [dbo].[Viewing] ([ViewingID])
GO
ALTER TABLE [dbo].[Viewing]  WITH CHECK ADD FOREIGN KEY([SalonID])
REFERENCES [dbo].[Salon] ([SalonID])
GO
ALTER TABLE [dbo].[Viewing]  WITH CHECK ADD FOREIGN KEY([MovieApiID])
REFERENCES [dbo].[MovieApi] ([MovieApiID])
GO
