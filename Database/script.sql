USE [master]
GO
/****** Object:  Database [Filmer]    Script Date: 2019-11-01 18:11:15 ******/
CREATE DATABASE [Filmer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Filmer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Filmer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Filmer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Filmer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Filmer] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Filmer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Filmer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Filmer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Filmer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Filmer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Filmer] SET ARITHABORT OFF 
GO
ALTER DATABASE [Filmer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Filmer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Filmer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Filmer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Filmer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Filmer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Filmer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Filmer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Filmer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Filmer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Filmer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Filmer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Filmer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Filmer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Filmer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Filmer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Filmer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Filmer] SET RECOVERY FULL 
GO
ALTER DATABASE [Filmer] SET  MULTI_USER 
GO
ALTER DATABASE [Filmer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Filmer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Filmer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Filmer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Filmer] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Filmer', N'ON'
GO
ALTER DATABASE [Filmer] SET QUERY_STORE = OFF
GO
USE [Filmer]
GO
/****** Object:  Table [dbo].[accesstokens]    Script Date: 2019-11-01 18:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accesstokens](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[token] [varchar](max) NOT NULL,
	[expires] [datetime] NOT NULL,
	[created] [datetime] NOT NULL,
 CONSTRAINT [PK_accesstokens] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CinemaLocation]    Script Date: 2019-11-01 18:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CinemaLocation](
	[CinemaLocationID] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](255) NOT NULL,
	[CinemaAddress] [nvarchar](255) NOT NULL,
	[CinemaName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CinemaLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 2019-11-01 18:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[PhoneNumber] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[JoinDate] [datetime] NULL,
	[Admin] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberViewing]    Script Date: 2019-11-01 18:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberViewing](
	[MemberViewingID] [int] IDENTITY(1,1) NOT NULL,
	[ViewingID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[Tickets] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberViewingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieApi]    Script Date: 2019-11-01 18:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieApi](
	[MovieApiID] [int] IDENTITY(1,1) NOT NULL,
	[MovieKey] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieApiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salon]    Script Date: 2019-11-01 18:11:15 ******/
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
/****** Object:  Table [dbo].[Viewing]    Script Date: 2019-11-01 18:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Viewing](
	[ViewingID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [money] NOT NULL,
	[ViewingDate] [datetime] NOT NULL,
	[MovieApiID] [int] NOT NULL,
	[SalonID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ViewingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[accesstokens] ON 

INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (1, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6Yjc2NDNkZWUtZDVkZS00NGM3LTk5ZjItNzI3NzllZDYzMDAw', CAST(N'2019-10-24T18:05:10.487' AS DateTime), CAST(N'2019-10-24T17:05:10.487' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (2, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6M2JhYTczYTktOWE0MC00MzcyLWI4NDItNjNiYjMyMDRjNzhi', CAST(N'2019-10-24T18:06:44.677' AS DateTime), CAST(N'2019-10-24T17:06:44.677' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (3, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NjBjNDQ5NTItNzBhZC00OWQzLWFmYzktNDllMjk2MTZkMjdj', CAST(N'2019-10-24T18:07:14.710' AS DateTime), CAST(N'2019-10-24T17:07:14.710' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (4, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6OTNjMjAzOWQtODVjMy00YzIyLThhYWUtOWUyMWEwYjhhMTVi', CAST(N'2019-10-24T18:07:57.663' AS DateTime), CAST(N'2019-10-24T17:07:57.663' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (5, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ZWYzNmUwNGUtM2NjNC00YWYyLWFhM2UtYjVkOTYxZTEzZmI3', CAST(N'2019-10-24T18:08:17.560' AS DateTime), CAST(N'2019-10-24T17:08:17.560' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (6, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6Y2Q0YzFlYzQtOGEwMS00MTZkLTkwZjAtYWMyZmRlNzZjNzFm', CAST(N'2019-10-24T18:08:42.060' AS DateTime), CAST(N'2019-10-24T17:08:42.060' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (7, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ODgyNTk1OTUtZTY3OC00NjgzLThiNDMtYzBiYjE0MjI1NDBh', CAST(N'2019-10-24T18:09:16.453' AS DateTime), CAST(N'2019-10-24T17:09:16.453' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (8, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NTNmMmQyYTktZjNiMy00NmM3LWE1OTYtMjQ5NjA4MTIzOTk5', CAST(N'2019-10-24T18:09:35.907' AS DateTime), CAST(N'2019-10-24T17:09:35.907' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (9, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ODQzMWEzYzEtYThiNS00ODdkLTg4ZWMtMDQ1MjQ5NGIyNjNl', CAST(N'2019-10-24T18:10:02.480' AS DateTime), CAST(N'2019-10-24T17:10:02.480' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (10, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NzNhZGIzNTEtMjk1Ni00NDYyLTgwNzQtYWMyODQzN2Y4MDc3', CAST(N'2019-10-24T18:31:18.340' AS DateTime), CAST(N'2019-10-24T17:31:18.340' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (11, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YmQyZDU2MGUtNmM0Yy00ODQwLWE0YjAtNDFjMzUyNGYxOGU0', CAST(N'2019-10-24T18:32:35.800' AS DateTime), CAST(N'2019-10-24T17:32:35.800' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (12, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NTU1YTMwOWMtYjU2OS00ZWZiLTg2ZjEtYjJlZmZmOTQwOTIy', CAST(N'2019-10-24T18:32:40.817' AS DateTime), CAST(N'2019-10-24T17:32:40.817' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (13, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YmU3Y2FhYWUtNDYyMy00YWE2LTllMzQtNTgyOTA4YThjODI5', CAST(N'2019-10-24T18:40:20.667' AS DateTime), CAST(N'2019-10-24T17:40:20.667' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (14, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NjQyZTUwYTYtZDc5Yi00NDhlLWJlMDUtYzJmOWVkMGUwMWRh', CAST(N'2019-10-29T14:49:04.123' AS DateTime), CAST(N'2019-10-29T13:49:04.123' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (15, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MDMwOGQ4YWUtOGFhZi00YzU1LThlNmYtMmI3ZWY3YzUxZTFk', CAST(N'2019-10-29T14:58:51.833' AS DateTime), CAST(N'2019-10-29T13:58:51.833' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (16, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YjU1N2U3MDktMmFlOS00NGE4LTkzOWUtMTkyYjJiZDU3ZTc3', CAST(N'2019-10-29T15:04:22.657' AS DateTime), CAST(N'2019-10-29T14:04:22.657' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (17, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ZWU0YmM5ZWYtYjNhMC00MjAxLWJmMzMtN2EzNDA0NmYyM2E0', CAST(N'2019-10-29T15:14:11.460' AS DateTime), CAST(N'2019-10-29T14:14:11.460' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (18, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NTQ4ZDlmMTktNWMwMy00ZmVkLWJlOGUtOWZhMmQxYzUzY2Zj', CAST(N'2019-10-29T15:43:05.277' AS DateTime), CAST(N'2019-10-29T14:43:05.277' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (19, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NDBiNmFkMWMtOTQyMy00ZDUwLWEyMjYtM2U2YzI5MThiNjA4', CAST(N'2019-10-29T15:43:19.417' AS DateTime), CAST(N'2019-10-29T14:43:19.417' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (20, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ZWM4YWE3OTctNjkxNy00MWM1LWIxYzgtNmE5MTdiZTFkN2U0', CAST(N'2019-10-29T15:44:10.440' AS DateTime), CAST(N'2019-10-29T14:44:10.440' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (21, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YmI3ZTQxYTgtNjQ2MC00YmFlLTg2ZmEtZWJlZmRjYWI2Yjdk', CAST(N'2019-10-29T15:44:38.447' AS DateTime), CAST(N'2019-10-29T14:44:38.447' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (22, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MzBmZDY5ZjYtNTU5Yi00ZjYzLWFkODEtMjJhODJlODI3NDQx', CAST(N'2019-10-29T15:45:49.047' AS DateTime), CAST(N'2019-10-29T14:45:49.047' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (23, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MjA1MWI5OGYtYjA1OS00ZWM0LTkzOTItOGI5YmJmZjc0Njc3', CAST(N'2019-10-29T16:05:04.363' AS DateTime), CAST(N'2019-10-29T15:05:04.363' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (24, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YjkxM2IzYmMtZTgyYS00YzFlLWE2MWYtMGViNzgwN2YxNGY3', CAST(N'2019-10-29T16:14:15.087' AS DateTime), CAST(N'2019-10-29T15:14:15.087' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (25, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ZGNkYjBlYzAtMmQwMC00YWFkLTliZmUtN2I5NWUyZTc1NWZi', CAST(N'2019-10-29T16:21:39.107' AS DateTime), CAST(N'2019-10-29T15:21:39.107' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (26, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6OWI5NTVmZjAtMDc3Ni00NWEwLWEzN2MtZjAyZGZkYTc2ZDA4', CAST(N'2019-10-29T16:21:55.240' AS DateTime), CAST(N'2019-10-29T15:21:55.240' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (27, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6Mzc4OTJhYzUtNDgzMi00NzE3LWExZDgtOWI1ZTdhMjg5MjIy', CAST(N'2019-10-29T16:26:01.887' AS DateTime), CAST(N'2019-10-29T15:26:01.887' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (28, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NWRiY2IzMWItOGI2Ni00MThhLTkyNGMtZDZlZmFiMmM0ZmM3', CAST(N'2019-10-29T16:28:16.763' AS DateTime), CAST(N'2019-10-29T15:28:16.763' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (29, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6OGE2MWZkZTMtMjY4OS00ZGNhLTkzZmUtNzlhZGJlNGFmMDM4', CAST(N'2019-10-30T10:06:50.723' AS DateTime), CAST(N'2019-10-30T09:06:50.723' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (30, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YTkzNmI2ZDItZjU1Ny00MzMxLWIyNDItODI0ODlmZTQyYjFi', CAST(N'2019-10-30T10:17:59.720' AS DateTime), CAST(N'2019-10-30T09:17:59.720' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (31, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ZmI3OGYzOGMtYWY4NC00NDZiLTljMmYtNGM5MGU2ZjZhMmZl', CAST(N'2019-10-30T10:18:22.070' AS DateTime), CAST(N'2019-10-30T09:18:22.070' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (32, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YjBkM2YxMzgtZjczYy00ZjRlLThlNTAtZTIyMjhlMjE5Y2U3', CAST(N'2019-10-30T10:19:04.903' AS DateTime), CAST(N'2019-10-30T09:19:04.903' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (33, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YTk1ZGYwOGMtMTRjNy00YjBiLWI0ZjEtMzg0YmFhNDQ3ZDIz', CAST(N'2019-10-30T10:21:18.647' AS DateTime), CAST(N'2019-10-30T09:21:18.647' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (34, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ZTNjMDVhNTctNmE4MS00ZWNjLWI1OGMtNGVmYjVhOGZhZWRl', CAST(N'2019-10-30T10:47:01.300' AS DateTime), CAST(N'2019-10-30T09:47:01.300' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (35, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ZTMyYjQyZTMtZjBiZi00NDAyLTg1YTEtYzAxNzExNzFjMzk0', CAST(N'2019-10-30T10:47:38.037' AS DateTime), CAST(N'2019-10-30T09:47:38.037' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (36, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6M2ZiZjkyZjEtMmEzYi00MzhjLWE4ZDUtNzQ3Zjk2MDc0MDVm', CAST(N'2019-10-30T10:48:03.523' AS DateTime), CAST(N'2019-10-30T09:48:03.523' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (37, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YWM3NzE5OWItODVhNi00M2YzLWI5MWItMWEyMzgyMjYwYmUx', CAST(N'2019-10-30T10:49:10.800' AS DateTime), CAST(N'2019-10-30T09:49:10.800' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (38, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ODA5NDZlMWQtNTY0NC00NTY0LWE0ZTYtZGU4YzRiMGZhYWZh', CAST(N'2019-10-30T10:51:03.647' AS DateTime), CAST(N'2019-10-30T09:51:03.647' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (39, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6Nzk5OTBlNGItZThlMS00OWQ3LTk3MGUtZjExMmJkZDNmODJi', CAST(N'2019-10-30T13:02:25.093' AS DateTime), CAST(N'2019-10-30T12:02:25.093' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (40, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ZjZkODUyYzItNzVlNy00YzQwLWE2NjYtOTA1YWZkZjA2N2U4', CAST(N'2019-10-30T13:02:25.093' AS DateTime), CAST(N'2019-10-30T12:02:25.093' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (41, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YzM5NGNlM2EtZjgwZi00MDU1LTgyMzQtN2ExZGQyOTFiM2Rk', CAST(N'2019-10-30T15:48:50.630' AS DateTime), CAST(N'2019-10-30T14:48:50.630' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (42, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YWY1YTFjMDEtOTFiMi00MzYwLWJhMjItZDA2N2MyNGI5YmYz', CAST(N'2019-10-30T16:06:27.697' AS DateTime), CAST(N'2019-10-30T15:06:27.697' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (43, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ZWQzZDJhZTgtYTJhZC00NTZhLTk5YTItYTFlYTA4NjY3YWM2', CAST(N'2019-10-31T10:31:28.640' AS DateTime), CAST(N'2019-10-31T09:31:28.640' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (44, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MmVlMTg1ZDgtYjBkYi00ZWNhLTliYjAtMjg1MDFmMGY0NmJl', CAST(N'2019-10-31T10:31:28.640' AS DateTime), CAST(N'2019-10-31T09:31:28.640' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (45, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YjU0NGEyZDItMTk4ZS00OGFiLWE5YzUtNTYyNjRlNDMxY2Fk', CAST(N'2019-10-31T10:31:28.640' AS DateTime), CAST(N'2019-10-31T09:31:28.640' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (46, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YTgwNmRhMmEtMjRlYy00MDM4LThhMGQtYzFiMWJkMTljOTk3', CAST(N'2019-10-31T10:32:14.163' AS DateTime), CAST(N'2019-10-31T09:32:14.163' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (47, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ZGNlYmExZDQtMTE1My00ZDFlLWI5NjMtOGY3MjdmODUzYTNh', CAST(N'2019-10-31T10:37:11.057' AS DateTime), CAST(N'2019-10-31T09:37:11.057' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (48, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YjM2NjFlZjUtZWVhMy00MzdkLTgzYzgtZWRlODc5YmQ3MDk4', CAST(N'2019-10-31T10:39:44.800' AS DateTime), CAST(N'2019-10-31T09:39:44.800' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (49, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ZjI1MGQ4NWYtMmMyZS00ZjExLTg2ZGQtYWU0ZmJlYTdjOWM4', CAST(N'2019-10-31T12:00:38.800' AS DateTime), CAST(N'2019-10-31T11:00:38.800' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (50, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MDVhMzAwODEtYjRiZi00MjQzLWI4OWQtZjlhMjgwODhmMTcx', CAST(N'2019-10-31T13:15:29.390' AS DateTime), CAST(N'2019-10-31T12:15:29.390' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (51, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ZWFjZDMwOWMtMGNlYS00NTBmLTg5M2ItMTkxOGYzODQ2YzNi', CAST(N'2019-10-31T15:39:57.627' AS DateTime), CAST(N'2019-10-31T14:39:57.627' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (52, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YmQ3MDNkOGQtYmFjYS00MTc0LThhZDUtNWM5YjAwZjQ4ODkx', CAST(N'2019-10-31T15:43:52.587' AS DateTime), CAST(N'2019-10-31T14:43:52.587' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (53, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ODVmNWYwOTAtN2E0NC00ZmU1LWE0OTQtMzg4MWNkMWQ4Mjg0', CAST(N'2019-10-31T15:57:07.073' AS DateTime), CAST(N'2019-10-31T14:57:07.073' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (54, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6OTU1YjUzYTctYzdkOS00NzU4LTkzMjItMWIyZmI0N2U3NWJk', CAST(N'2019-10-31T15:58:12.627' AS DateTime), CAST(N'2019-10-31T14:58:12.627' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (55, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MDEwODc4ZGQtN2FlOC00MTRhLWI3YjQtZmM2ZWE3NjMyMWU5', CAST(N'2019-10-31T16:06:57.430' AS DateTime), CAST(N'2019-10-31T15:06:57.430' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (56, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YTYyNjNjOGQtZmJkYi00YzUyLTk1MjktYmMzYmRlN2E4NWFi', CAST(N'2019-10-31T16:12:25.727' AS DateTime), CAST(N'2019-10-31T15:12:25.727' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (57, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NTIwZWQ0NDYtMzEyNy00ZjYxLWI3MjYtOTU2OGEwODdhMWIz', CAST(N'2019-10-31T16:13:34.540' AS DateTime), CAST(N'2019-10-31T15:13:34.540' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (58, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YWY5YjQ2YmEtM2FiMS00MmY5LWI4YmQtZjNlZTA1MTFhYTBi', CAST(N'2019-10-31T16:17:10.863' AS DateTime), CAST(N'2019-10-31T15:17:10.863' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (59, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MTdhNGEzM2UtZGQxYy00YjI2LTk4OTktMzRiMzM2NTlkOTBl', CAST(N'2019-10-31T16:17:22.943' AS DateTime), CAST(N'2019-10-31T15:17:22.943' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (60, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MGQ4YTlmMGItM2RjZS00NzdhLWI3ZTYtNDE5YTRkMzk2NWNh', CAST(N'2019-10-31T16:18:00.043' AS DateTime), CAST(N'2019-10-31T15:18:00.043' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (61, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6M2QxMDFkZDAtODI2Ny00OTA4LThlOWEtNjIzNTFlM2ViZTA2', CAST(N'2019-10-31T17:18:15.783' AS DateTime), CAST(N'2019-10-31T16:18:15.783' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (62, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NDgxZTk1MTgtNTkyYS00OTFhLTljMzctZDcwYTkxNzZhOTc4', CAST(N'2019-10-31T17:18:54.127' AS DateTime), CAST(N'2019-10-31T16:18:54.127' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (63, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MDA2MGRiOGEtMGIzOS00ZTUxLTkzZmUtNjE3ZDNmOTkxYzU0', CAST(N'2019-11-01T12:16:42.653' AS DateTime), CAST(N'2019-11-01T11:16:42.653' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (64, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6Yzg1M2M0MjQtYjYzNS00Mjg1LThjMWYtM2IzY2I4YzUxN2Yz', CAST(N'2019-11-01T12:17:30.080' AS DateTime), CAST(N'2019-11-01T11:17:30.080' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (65, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NzljZDc2MzQtODI5Mi00YmJkLWFkMWQtYTg1NWE0Nzg3Yjgx', CAST(N'2019-11-01T12:17:54.980' AS DateTime), CAST(N'2019-11-01T11:17:54.980' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (66, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YTMzNTUxMDgtYWVkMi00Y2E2LWI4YjYtNDhlODVlZjdlZTM0', CAST(N'2019-11-01T12:20:57.283' AS DateTime), CAST(N'2019-11-01T11:20:57.283' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (67, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NDg0MmJkMjktNDhiYi00NTcyLWJkMjgtMTY1NmIwZjZjYTEy', CAST(N'2019-11-01T12:22:55.220' AS DateTime), CAST(N'2019-11-01T11:22:55.220' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (68, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YWU1OWU5MzItODgwOS00Zjg0LWJlY2QtMThmZDAyNzM2OGZk', CAST(N'2019-11-01T12:24:22.967' AS DateTime), CAST(N'2019-11-01T11:24:22.967' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (69, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6Yzk2Mjc0N2ItZDFhMS00ZjVlLWEwYmEtNmE3NGNjYjVlMmJi', CAST(N'2019-11-01T12:25:25.853' AS DateTime), CAST(N'2019-11-01T11:25:25.853' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (70, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MWMyNTAwMTMtOTVjZS00MjFiLWJkMDAtZjQzZjlhMzEzMmVm', CAST(N'2019-11-01T12:26:07.483' AS DateTime), CAST(N'2019-11-01T11:26:07.483' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (71, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MGU5OTI3ODItMjQyNy00MTBhLWJmZWUtMjc2YWE1YTQ4ZWVh', CAST(N'2019-11-01T12:27:50.547' AS DateTime), CAST(N'2019-11-01T11:27:50.547' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (72, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ZGVhMmI2YjItMmNkZC00MmIxLTk5ZTktMzgyNTEwYzAyYTEz', CAST(N'2019-11-01T12:29:23.150' AS DateTime), CAST(N'2019-11-01T11:29:23.150' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (73, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NThjZGIyZmYtMzc3Mi00ZmQyLTg4ZGYtODJkZGI0ZDVjNDhi', CAST(N'2019-11-01T12:30:29.533' AS DateTime), CAST(N'2019-11-01T11:30:29.533' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (74, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NWY2ODkwZjUtMzI0MC00MGIwLThiMjctZWIyMTYzMDJlYTgw', CAST(N'2019-11-01T12:32:14.053' AS DateTime), CAST(N'2019-11-01T11:32:14.053' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (75, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NDAzNDg4OTctODEyYy00Y2JiLWFlODYtMzhhNGMwYzZmNGMw', CAST(N'2019-11-01T12:32:30.520' AS DateTime), CAST(N'2019-11-01T11:32:30.520' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (76, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NzdkYjM2ZWQtZWRiYi00NTIwLTkwMmMtMTNjYWJkYjRjOWFk', CAST(N'2019-11-01T12:34:14.400' AS DateTime), CAST(N'2019-11-01T11:34:14.400' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (77, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MGQ1NzA5YzctNjgxZS00NzA0LWIxZmEtODNlOWI1YjM5ZGU4', CAST(N'2019-11-01T12:34:45.673' AS DateTime), CAST(N'2019-11-01T11:34:45.673' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (78, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MzMxZDk3YTMtY2I2ZS00MGFjLTgxNTYtNmYwZGZiNDZiYjBj', CAST(N'2019-11-01T12:36:03.403' AS DateTime), CAST(N'2019-11-01T11:36:03.403' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (79, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6N2YzZGRlMTItNGZmMC00YzRhLTk1MDAtOGU4MDEwMmM2Njc4', CAST(N'2019-11-01T12:38:47.123' AS DateTime), CAST(N'2019-11-01T11:38:47.123' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (80, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ZmZjYjJiMmEtYmRkNy00Yjg3LTllZjItMDQ5ODI0NGQwYzFi', CAST(N'2019-11-01T12:45:03.173' AS DateTime), CAST(N'2019-11-01T11:45:03.173' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (81, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MDJlZTMxYWMtYWMyMi00NjAxLTllZDAtMjI5ZTNhZjRhMjhl', CAST(N'2019-11-01T12:45:37.813' AS DateTime), CAST(N'2019-11-01T11:45:37.813' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (82, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MjAwMTg2YjUtNGI5Yy00N2EzLWIwMTgtZjQzMzRmNTllZjBm', CAST(N'2019-11-01T12:51:04.127' AS DateTime), CAST(N'2019-11-01T11:51:04.127' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (83, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ZmQzZTkxNzYtNGU2Zi00N2Q2LWJiNDYtMjkwN2RkZTRiOTUw', CAST(N'2019-11-01T12:51:53.810' AS DateTime), CAST(N'2019-11-01T11:51:53.810' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (84, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YzlkZDljYWMtY2ZlMS00MDdmLThmMzEtMWJiODM0MmNmZDZm', CAST(N'2019-11-01T13:09:25.790' AS DateTime), CAST(N'2019-11-01T12:09:25.790' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (85, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MmQ4MzJlYTAtNjhlNi00NzBhLWFiNjgtOTdjZmQ1MjNjOGIy', CAST(N'2019-11-01T13:10:40.123' AS DateTime), CAST(N'2019-11-01T12:10:40.123' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (86, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YTk1YzA5ZTYtYTBmMC00NjcxLTg2MmQtNGU3YWRhNDdmNzMw', CAST(N'2019-11-01T13:12:02.557' AS DateTime), CAST(N'2019-11-01T12:12:02.560' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (87, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NzJmMTM0MGQtYjgzNS00MjNhLTgzODYtYjA4ZDRiMGNjOGFk', CAST(N'2019-11-01T13:12:02.557' AS DateTime), CAST(N'2019-11-01T12:12:02.560' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (88, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NWIzMjE0YmUtM2E4MS00ZWM4LWExMWQtMzVkYWFkOTYwYTNh', CAST(N'2019-11-01T17:22:21.680' AS DateTime), CAST(N'2019-11-01T16:22:21.680' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (89, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MjNjOGQ0OGEtYzkzZi00YTcxLWE1Y2YtOTFlNTg4NGE5NTYy', CAST(N'2019-11-01T17:28:22.477' AS DateTime), CAST(N'2019-11-01T16:28:22.477' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (90, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YTI4ZWY5NGMtMDUwMy00Mjc2LTg4NzAtMmVhMTlmOWZkMDJm', CAST(N'2019-11-01T17:29:04.340' AS DateTime), CAST(N'2019-11-01T16:29:04.340' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (91, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MGU1YWYyNjItMWIzZi00MWIyLTg2MTktZTdiZDMxYjQzNjIy', CAST(N'2019-11-01T17:29:26.273' AS DateTime), CAST(N'2019-11-01T16:29:26.273' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (92, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6N2VkOTFkYmEtZmM0NS00MDM5LTk3ZGUtZTYzYjFmOGY3YWM5', CAST(N'2019-11-01T17:43:14.567' AS DateTime), CAST(N'2019-11-01T16:43:14.567' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (93, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6YzI5NDJjOGQtZDY2YS00ZTQyLWI0MGYtNTAzM2NhYWY3Zjdi', CAST(N'2019-11-01T17:44:56.803' AS DateTime), CAST(N'2019-11-01T16:44:56.803' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (94, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6M2Y3Nzk2MGMtMTdjNC00YmYyLWFiMDMtMzdjOWYxNWY3YTMz', CAST(N'2019-11-01T17:45:19.173' AS DateTime), CAST(N'2019-11-01T16:45:19.173' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (95, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ZDYzMWUwMTUtNGIwYi00YTUxLTk1NWQtNmFhNjRmYjAwMTU1', CAST(N'2019-11-01T17:46:47.330' AS DateTime), CAST(N'2019-11-01T16:46:47.330' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (96, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6OTE3ZjFkOTctMWRjZC00MjkyLWJlYzMtM2Q3NDhhZGEwMGEx', CAST(N'2019-11-01T17:47:59.890' AS DateTime), CAST(N'2019-11-01T16:47:59.890' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (97, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MjEzYmZmMzktMWE4YS00MzMzLThhZDktMTI2ZGIyM2I2MjU0', CAST(N'2019-11-01T17:48:40.710' AS DateTime), CAST(N'2019-11-01T16:48:40.710' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (98, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NzdlMGM2MDItNmE3Mi00OTIxLWFlNjMtYWUxMTlkYTAyMzc1', CAST(N'2019-11-01T17:56:07.087' AS DateTime), CAST(N'2019-11-01T16:56:07.087' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (99, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MzY2Mjk3MjgtMTk4ZC00Nzg2LThhYmMtY2U2OGQ5N2YwN2Y5', CAST(N'2019-11-01T17:57:47.260' AS DateTime), CAST(N'2019-11-01T16:57:47.260' AS DateTime))
GO
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (100, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MDRjMWEyNmEtMTM3My00M2UwLTk1ZjEtYjljMzNjMThjNTM3', CAST(N'2019-11-01T17:59:02.663' AS DateTime), CAST(N'2019-11-01T16:59:02.663' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (101, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ODNlYjJiYTYtYjA3YS00MTEzLWJmOGYtMjA1NmMyMWQ5MDI1', CAST(N'2019-11-01T18:02:09.673' AS DateTime), CAST(N'2019-11-01T17:02:09.673' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (102, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MzUyZGJjZmMtN2NkYS00MDQ1LThlMzUtYWVlMjZiMjAxN2M3', CAST(N'2019-11-01T18:09:42.013' AS DateTime), CAST(N'2019-11-01T17:09:42.013' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (103, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6M2ViZThiNDItMTc5MS00N2FjLTgxNjctMGI0MGVkOGI0ZjU4', CAST(N'2019-11-01T18:12:31.813' AS DateTime), CAST(N'2019-11-01T17:12:31.813' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (104, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NmM1NzVlMTItY2NlNi00OWQ1LWJlOWQtOWZlMTI1NTFmZTI1', CAST(N'2019-11-01T18:13:56.253' AS DateTime), CAST(N'2019-11-01T17:13:56.253' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (105, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6NjBkMTMwNzEtNDFhMi00M2UwLWExOWMtYTY4ZjUxNDg0OTZl', CAST(N'2019-11-01T18:14:49.440' AS DateTime), CAST(N'2019-11-01T17:14:49.440' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (106, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ZTlkYjIxNWYtM2M3NS00M2ZjLWEzZmMtMGE1MGUyNzIxMmE2', CAST(N'2019-11-01T18:50:11.683' AS DateTime), CAST(N'2019-11-01T17:50:11.687' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (107, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MjBjZDIwNTctMzk5OS00OGU4LWFjZTYtMzFmMjY0N2U4MDBh', CAST(N'2019-11-01T18:51:44.203' AS DateTime), CAST(N'2019-11-01T17:51:44.203' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (108, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6ZmQxZjUxYzItMGE1NS00ODY3LWJhYWQtMjIxNTE2MWY2MDAz', CAST(N'2019-11-01T18:56:28.170' AS DateTime), CAST(N'2019-11-01T17:56:28.170' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (109, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MDdkYTMzMDAtNjhjYy00YzA5LTlmNzctNWU4MmM0NWIwOTc1', CAST(N'2019-11-01T19:07:07.900' AS DateTime), CAST(N'2019-11-01T18:07:07.900' AS DateTime))
INSERT [dbo].[accesstokens] ([id], [token], [expires], [created]) VALUES (110, N'RnJlZHJpay5saW5kZW4uam9oYW5zc29uQGhvdG1haWwuc2U6MDk3MWEzNjUtYWMxYS00M2YzLTk2MzYtOTA5NGU1Nzc4ODM1', CAST(N'2019-11-01T19:07:55.003' AS DateTime), CAST(N'2019-11-01T18:07:55.003' AS DateTime))
SET IDENTITY_INSERT [dbo].[accesstokens] OFF
SET IDENTITY_INSERT [dbo].[CinemaLocation] ON 

INSERT [dbo].[CinemaLocation] ([CinemaLocationID], [City], [CinemaAddress], [CinemaName]) VALUES (1, N'Göteborg', N'Skånegatan 16b', N'Bergakungen')
SET IDENTITY_INSERT [dbo].[CinemaLocation] OFF
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([MemberID], [Email], [FirstName], [LastName], [PhoneNumber], [Password], [JoinDate], [Admin]) VALUES (1, N'Fredrik.linden.johansson@hotmail.se', N'Fredrik', N'´Lindén Johansson', N'0722442242', N'hej', CAST(N'2012-06-18T22:34:09.000' AS DateTime), N'Admin')
INSERT [dbo].[Member] ([MemberID], [Email], [FirstName], [LastName], [PhoneNumber], [Password], [JoinDate], [Admin]) VALUES (2, N'hej@hej.se', N'hej', N'hej', N'hej', N'gej', CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'member')
INSERT [dbo].[Member] ([MemberID], [Email], [FirstName], [LastName], [PhoneNumber], [Password], [JoinDate], [Admin]) VALUES (3, N'jan.banan@hotmail.com', N'jan', N'banan', N'', N'bananer', CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'member')
INSERT [dbo].[Member] ([MemberID], [Email], [FirstName], [LastName], [PhoneNumber], [Password], [JoinDate], [Admin]) VALUES (4, N'jan.banan@hotmail.com', N'jan', N'banan', N'', N'bananer', CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'member')
INSERT [dbo].[Member] ([MemberID], [Email], [FirstName], [LastName], [PhoneNumber], [Password], [JoinDate], [Admin]) VALUES (5, N'jan.banan@hotmail.com', N'jan', N'banan', N'', N'bananer', CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'member')
INSERT [dbo].[Member] ([MemberID], [Email], [FirstName], [LastName], [PhoneNumber], [Password], [JoinDate], [Admin]) VALUES (6, N'jan.banan@hotmail.com', N'jan', N'banan', N'na', N'bananer', CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'member')
INSERT [dbo].[Member] ([MemberID], [Email], [FirstName], [LastName], [PhoneNumber], [Password], [JoinDate], [Admin]) VALUES (7, N'kalle@anka.se', N'kalle', N'anka', N'na', N'långben', CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'member')
INSERT [dbo].[Member] ([MemberID], [Email], [FirstName], [LastName], [PhoneNumber], [Password], [JoinDate], [Admin]) VALUES (8, N'kalle@anka.se', N'kalle', N'anka', N'na', N'långben', CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'member')
INSERT [dbo].[Member] ([MemberID], [Email], [FirstName], [LastName], [PhoneNumber], [Password], [JoinDate], [Admin]) VALUES (9, N'sven@hotmail.com', N'sven', N'eriksson', N'na', N'fotboll', CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'member')
INSERT [dbo].[Member] ([MemberID], [Email], [FirstName], [LastName], [PhoneNumber], [Password], [JoinDate], [Admin]) VALUES (10, N'qwe@asd.se', N'qwe', N'asd', N'na', N'qwe', CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'member')
INSERT [dbo].[Member] ([MemberID], [Email], [FirstName], [LastName], [PhoneNumber], [Password], [JoinDate], [Admin]) VALUES (11, N'qwe@qwe.se', N'qwe', N'qwe', N'qwe', N'qwe', CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'member')
INSERT [dbo].[Member] ([MemberID], [Email], [FirstName], [LastName], [PhoneNumber], [Password], [JoinDate], [Admin]) VALUES (12, N'abc@abc.se', N'abc', N'abc', N'na', N'abc', CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'member')
INSERT [dbo].[Member] ([MemberID], [Email], [FirstName], [LastName], [PhoneNumber], [Password], [JoinDate], [Admin]) VALUES (13, N'a@a.se', N'a', N'a', N'na', N'a', CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'member')
INSERT [dbo].[Member] ([MemberID], [Email], [FirstName], [LastName], [PhoneNumber], [Password], [JoinDate], [Admin]) VALUES (14, N'b@b.se', N'b', N'b', N'na', N'b', CAST(N'2019-10-22T00:00:00.000' AS DateTime), N'member')
INSERT [dbo].[Member] ([MemberID], [Email], [FirstName], [LastName], [PhoneNumber], [Password], [JoinDate], [Admin]) VALUES (15, N'emma@hotmail.com', N'emma', N'mossberg', N'', N'hej', CAST(N'2019-10-23T00:00:00.000' AS DateTime), N'member')
SET IDENTITY_INSERT [dbo].[Member] OFF
SET IDENTITY_INSERT [dbo].[MemberViewing] ON 

INSERT [dbo].[MemberViewing] ([MemberViewingID], [ViewingID], [MemberID], [Tickets]) VALUES (1, 1, 1, 2)
INSERT [dbo].[MemberViewing] ([MemberViewingID], [ViewingID], [MemberID], [Tickets]) VALUES (2, 1, 1, 2)
INSERT [dbo].[MemberViewing] ([MemberViewingID], [ViewingID], [MemberID], [Tickets]) VALUES (3, 1, 1, 2)
INSERT [dbo].[MemberViewing] ([MemberViewingID], [ViewingID], [MemberID], [Tickets]) VALUES (4, 4, 1, 2)
SET IDENTITY_INSERT [dbo].[MemberViewing] OFF
SET IDENTITY_INSERT [dbo].[MovieApi] ON 

INSERT [dbo].[MovieApi] ([MovieApiID], [MovieKey]) VALUES (1, N'474350')
INSERT [dbo].[MovieApi] ([MovieApiID], [MovieKey]) VALUES (2, N'301528')
INSERT [dbo].[MovieApi] ([MovieApiID], [MovieKey]) VALUES (3, N'419704')
INSERT [dbo].[MovieApi] ([MovieApiID], [MovieKey]) VALUES (4, N'582943')
SET IDENTITY_INSERT [dbo].[MovieApi] OFF
SET IDENTITY_INSERT [dbo].[Salon] ON 

INSERT [dbo].[Salon] ([SalonID], [CinemaLocationID], [SalonNumber], [MaxSeats]) VALUES (1, 1, 1, 90)
SET IDENTITY_INSERT [dbo].[Salon] OFF
SET IDENTITY_INSERT [dbo].[Viewing] ON 

INSERT [dbo].[Viewing] ([ViewingID], [Price], [ViewingDate], [MovieApiID], [SalonID]) VALUES (1, 130.0000, CAST(N'2019-11-18T19:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Viewing] ([ViewingID], [Price], [ViewingDate], [MovieApiID], [SalonID]) VALUES (2, 130.0000, CAST(N'2019-11-19T19:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[Viewing] ([ViewingID], [Price], [ViewingDate], [MovieApiID], [SalonID]) VALUES (3, 130.0000, CAST(N'2019-11-20T19:00:00.000' AS DateTime), 3, 1)
INSERT [dbo].[Viewing] ([ViewingID], [Price], [ViewingDate], [MovieApiID], [SalonID]) VALUES (4, 130.0000, CAST(N'2019-11-21T19:00:00.000' AS DateTime), 4, 1)
INSERT [dbo].[Viewing] ([ViewingID], [Price], [ViewingDate], [MovieApiID], [SalonID]) VALUES (5, 130.0000, CAST(N'2019-11-22T19:00:00.000' AS DateTime), 4, 1)
INSERT [dbo].[Viewing] ([ViewingID], [Price], [ViewingDate], [MovieApiID], [SalonID]) VALUES (6, 130.0000, CAST(N'2019-11-23T19:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Viewing] ([ViewingID], [Price], [ViewingDate], [MovieApiID], [SalonID]) VALUES (7, 130.0000, CAST(N'2019-11-24T19:00:00.000' AS DateTime), 3, 1)
SET IDENTITY_INSERT [dbo].[Viewing] OFF
ALTER TABLE [dbo].[MemberViewing]  WITH CHECK ADD FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[MemberViewing]  WITH CHECK ADD FOREIGN KEY([ViewingID])
REFERENCES [dbo].[Viewing] ([ViewingID])
GO
ALTER TABLE [dbo].[Salon]  WITH CHECK ADD FOREIGN KEY([CinemaLocationID])
REFERENCES [dbo].[CinemaLocation] ([CinemaLocationID])
GO
ALTER TABLE [dbo].[Viewing]  WITH CHECK ADD FOREIGN KEY([MovieApiID])
REFERENCES [dbo].[MovieApi] ([MovieApiID])
GO
ALTER TABLE [dbo].[Viewing]  WITH CHECK ADD FOREIGN KEY([SalonID])
REFERENCES [dbo].[Salon] ([SalonID])
GO
USE [master]
GO
ALTER DATABASE [Filmer] SET  READ_WRITE 
GO
