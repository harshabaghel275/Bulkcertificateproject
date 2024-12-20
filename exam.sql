USE [master]
GO
/****** Object:  Database [examsurevy]    Script Date: 12/7/2024 2:11:27 PM ******/
CREATE DATABASE [examsurevy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'examsurevy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\examsurevy.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'examsurevy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\examsurevy_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [examsurevy] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [examsurevy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [examsurevy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [examsurevy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [examsurevy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [examsurevy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [examsurevy] SET ARITHABORT OFF 
GO
ALTER DATABASE [examsurevy] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [examsurevy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [examsurevy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [examsurevy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [examsurevy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [examsurevy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [examsurevy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [examsurevy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [examsurevy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [examsurevy] SET  ENABLE_BROKER 
GO
ALTER DATABASE [examsurevy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [examsurevy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [examsurevy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [examsurevy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [examsurevy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [examsurevy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [examsurevy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [examsurevy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [examsurevy] SET  MULTI_USER 
GO
ALTER DATABASE [examsurevy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [examsurevy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [examsurevy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [examsurevy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [examsurevy] SET DELAYED_DURABILITY = DISABLED 
GO
USE [examsurevy]
GO
/****** Object:  Table [dbo].[AdminLogin]    Script Date: 12/7/2024 2:11:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminLogin](
	[id] [int] NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[rts] [datetime] NULL,
	[status] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Certificatelist]    Script Date: 12/7/2024 2:11:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificatelist](
	[id] [int] NULL,
	[uid] [int] NULL,
	[name] [nvarchar](max) NULL,
	[rts] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[contact]    Script Date: 12/7/2024 2:11:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact](
	[id] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[tellabout] [nvarchar](max) NULL,
	[rts] [datetime] NULL,
	[status] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[exam]    Script Date: 12/7/2024 2:11:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam](
	[id] [int] NULL,
	[subjectname] [nvarchar](max) NULL,
	[question] [nvarchar](max) NULL,
	[option1] [nvarchar](max) NULL,
	[option2] [nvarchar](max) NULL,
	[option3] [nvarchar](max) NULL,
	[option4] [nvarchar](max) NULL,
	[rigthanswer] [nvarchar](max) NULL,
	[status] [bit] NULL,
	[rts] [datetime] NULL,
	[sunjectid] [int] NULL,
	[correct_option] [nvarchar](max) NULL,
	[selectoption] [nvarchar](max) NULL,
	[userid] [nvarchar](max) NULL,
	[examid] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[examsubject]    Script Date: 12/7/2024 2:11:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[examsubject](
	[id] [int] NULL,
	[subjectname] [nvarchar](max) NULL,
	[status] [bit] NULL,
	[rts] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[register]    Script Date: 12/7/2024 2:11:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[register](
	[id] [int] NULL,
	[name] [nvarchar](max) NULL,
	[mobile] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
	[rts] [datetime] NULL,
	[userid] [int] NULL,
	[username] [nvarchar](max) NULL,
	[userinfo] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[result]    Script Date: 12/7/2024 2:11:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[result](
	[id] [int] NULL,
	[userid] [int] NULL,
	[selectoption] [nvarchar](max) NULL,
	[examid] [int] NULL,
	[rigthanswer] [nvarchar](max) NULL,
	[totslanswet] [nvarchar](max) NULL,
	[questionid] [nvarchar](max) NULL,
	[result] [nvarchar](max) NULL,
	[subjectname] [nvarchar](max) NULL,
	[totalquestion] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Registration]    Script Date: 12/7/2024 2:11:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Registration](
	[id] [int] NULL,
	[user_name] [nvarchar](max) NULL,
	[user_email] [nvarchar](max) NULL,
	[user_contact] [nvarchar](max) NULL,
	[user_pass] [nvarchar](max) NULL,
	[status] [bit] NULL,
	[rts] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[AdminLogin] ([id], [UserName], [Password], [rts], [status]) VALUES (1, N'Admin', N'admin', CAST(N'2024-11-28 13:15:39.270' AS DateTime), 1)
INSERT [dbo].[contact] ([id], [Name], [Email], [Phone], [tellabout], [rts], [status]) VALUES (1, N'harsha', N'harshabghel97@gmail.com', N'9799210731', N'hvhshvcjavafdvdjgagdvdh', CAST(N'2024-11-28 12:15:12.520' AS DateTime), 1)
INSERT [dbo].[contact] ([id], [Name], [Email], [Phone], [tellabout], [rts], [status]) VALUES (2, N'harsha', N'harshabghel97@gmail.com', N'9799210731', N'hvhshvcjavafdvdjgagdvdh', CAST(N'2024-11-28 12:16:19.587' AS DateTime), 1)
INSERT [dbo].[contact] ([id], [Name], [Email], [Phone], [tellabout], [rts], [status]) VALUES (3, N'harsha', N'harshabghel97@gmail.com', N'9799210731', N'hvhshvcjavafdvdjgagdvdh', CAST(N'2024-11-28 12:16:56.403' AS DateTime), 1)
INSERT [dbo].[contact] ([id], [Name], [Email], [Phone], [tellabout], [rts], [status]) VALUES (4, N'harsha', N'harshabghel97@gmail.com', N'9799210731', N'hvhshvcjavafdvdjgagdvdh', CAST(N'2024-11-28 12:18:30.050' AS DateTime), 1)
INSERT [dbo].[contact] ([id], [Name], [Email], [Phone], [tellabout], [rts], [status]) VALUES (5, N'harsha', N'harshabghel97@gmail.com', N'9799210731', N'hvhshvcjavafdvdjgagdvdh', CAST(N'2024-11-28 12:19:39.363' AS DateTime), 1)
INSERT [dbo].[contact] ([id], [Name], [Email], [Phone], [tellabout], [rts], [status]) VALUES (6, N'harsha', N'harshabghel97@gmail.com', N'9799210731', N'hvhshvcjavafdvdjgagdvdh', CAST(N'2024-11-28 12:19:52.610' AS DateTime), 1)
INSERT [dbo].[contact] ([id], [Name], [Email], [Phone], [tellabout], [rts], [status]) VALUES (7, N'harsha', N'harshabghel97@gmail.com', N'9799210731', N'hvhshvcjavafdvdjgagdvdh', CAST(N'2024-11-28 12:20:05.823' AS DateTime), 1)
INSERT [dbo].[contact] ([id], [Name], [Email], [Phone], [tellabout], [rts], [status]) VALUES (8, N'harsha', N'harshabghel97@gmail.com', N'9799210731', N'hvhshvcjavafdvdjgagdvdh', CAST(N'2024-11-28 12:21:55.227' AS DateTime), 1)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (1, N'1', N'Which word is a noun?', N'spoke', N'speaks', N'spoken', N'speaking', N'spoke', 1, CAST(N'2024-11-27 15:00:56.883' AS DateTime), NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (2, N'1', N'Fill in the blank: "They ___ not understand the problem."', N'does', N'do', N'did', N'doing', N'do', 1, CAST(N'2024-11-27 15:01:52.020' AS DateTime), NULL, N'2', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (3, N'1', N'Select the correct sentence.', N'The books is on the table.', N'The book is on the table.', N'The books are on the table.', N'The book are on the table.', N'The book is on the table.', 1, CAST(N'2024-11-27 15:02:32.083' AS DateTime), NULL, N'2', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (4, N'1', N'Choose the right article: "___ orange is sour."', N'A', N'An', N'The', N'No article', N'The', 1, CAST(N'2024-11-27 15:03:02.880' AS DateTime), NULL, N'3', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (5, N'1', N'What is the comparative form of "good"?', N'best', N'gooder', N'better', N'more good', N'better', 1, CAST(N'2024-11-27 15:03:35.400' AS DateTime), NULL, N'3', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (6, N'1', N'Fill in the blank: "He ___ never been to London."', N'has', N'have', N'had', N'having', N'has', 1, CAST(N'2024-11-27 15:04:05.350' AS DateTime), NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (7, N'1', N'What is the plural of "child"?', N'child', N'children', N'childs', N'childrens', N'children', 1, CAST(N'2024-11-27 15:05:37.940' AS DateTime), NULL, N'2', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (8, N'1', N'Choose the correct sentence.', N'She can sings very well.', N'She can sing very well.', N'She can singing very well.', N'She can sang very well.', N'She can sing very well.', 1, CAST(N'2024-11-27 15:06:16.480' AS DateTime), NULL, N'2', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (9, N'1', N'Fill in the blank: "They ___ to the beach every summer."', N'goes', N'going', N'gone', N'go', N'go', 1, CAST(N'2024-11-27 15:06:57.023' AS DateTime), NULL, N'4', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (10, N'1', N'What is the past tense of "read"?', N'reads', N'read', N'reading', N'readed', N'read', 1, CAST(N'2024-11-27 15:07:35.480' AS DateTime), NULL, N'2', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (11, N'3', N'What does CPU stand for?', N'Central Processing Unit', N'Central Process Unit', N'Computer Personal Unit', N'Central Processor Unit', N'Central Processing Unit', 1, CAST(N'2024-11-27 15:10:01.790' AS DateTime), NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (12, N'3', N'Which of the following is an output device?', N'Keyboard', N'Mouse', N'Printer', N'Scanner', N'Printer', 1, CAST(N'2024-11-27 15:11:49.203' AS DateTime), NULL, N'3', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (13, N'3', N'What is the main function of RAM?', N'To store data permanently', N'To process data', N'To store data temporarily', N'To control peripherals', N'To store data temporarily', 1, CAST(N'2024-11-27 15:13:01.477' AS DateTime), NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (14, N'3', N'Which of the following is a type of software?', N'Hardware', N'System Software', N'Peripheral', N'Network', N'System Software', 1, CAST(N'2024-11-27 15:14:34.547' AS DateTime), NULL, N'2', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (15, N'3', N'Which of these is a web browser?', N'Microsoft Word', N'Google Chrome', N'Adobe Photoshop', N'Skype', N'Google Chrome', 1, CAST(N'2024-11-27 15:15:46.663' AS DateTime), NULL, N'2', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (16, N'3', N'What does USB stand for?', N'Universal Serial Bus', N'Universal Service Bus', N'United Serial Bus', N'United Service Bus', N'Universal Serial Bus', 1, CAST(N'2024-11-27 15:16:53.743' AS DateTime), NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (17, N'3', N'What is the function of a router in a network?', N'To store data', N'To store data', N'To connect different networks', N'To display data', N'To connect different networks', 1, CAST(N'2024-11-27 15:17:55.700' AS DateTime), NULL, N'3', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (18, N'3', N'What does HTML stand for?', N'HyperText Markup Language', N'Hyperlink Markup Language', N'HyperText Mark Language', N'Hyperlink Text Markup Language', N'HyperText Markup Language', 1, CAST(N'2024-11-27 15:19:29.420' AS DateTime), NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (19, N'3', N'Which part of the computer is considered the brain?', N'Hard Drive', N'RAM', N'Motherboard', N'CPU', N'Motherboard', 1, CAST(N'2024-11-27 15:21:08.113' AS DateTime), NULL, N'3', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (20, N'3', N'What is the purpose of a firewall?', N'To monitor and control incoming and outgoing network traffic', N'To speed up the computer', N'To store data', N'To display data', N'To monitor and control incoming', 1, CAST(N'2024-11-27 15:22:18.910' AS DateTime), NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (21, N'4', N'How can you add a caption to an image?', N'References tab > Insert Caption', N'Insert tab > Caption', N'Home tab > Caption', N'Design tab > Caption', N'References tab > Insert Caption', 1, CAST(N'2024-11-27 15:28:21.927' AS DateTime), NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (22, N'4', N'What does the "Page Color" option do?', N'Changes the background color of the page', N'Alters text color', N'Adjusts margin size', N'Adds a watermark', N'Changes the background color of the page', 1, CAST(N'2024-11-27 15:29:03.363' AS DateTime), NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (23, N'4', N'How can you split the document window?', N'View tab > Split', N'Layout tab > Split', N'Design tab > Split', N'Home tab > Split', N'Home tab > Split', 1, CAST(N'2024-11-27 15:29:38.657' AS DateTime), NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (24, N'4', N'What does the "Quick Parts" feature allow you to do?', N'Insert reusable content', N'Change text formatting', N'Add document properties', N'Insert hyperlinks', N'Insert reusable content', 1, CAST(N'2024-11-27 15:30:23.160' AS DateTime), NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (25, N'4', N'What does the "Hyperlink" feature enable you to do?', N'Link to websites or documents', N'Add text formatting', N'Create text boxes', N'Insert tables', N'Link to websites or documents', 1, CAST(N'2024-11-27 15:31:30.780' AS DateTime), NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (27, N'4', N'What is the purpose of the "Change Case" feature?', N'Alters text capitalization', N'Formats paragraphs', N'Adjusts line spacing', N'Changes document style', N'Alters text capitalization', 1, CAST(N'2024-11-27 15:32:35.103' AS DateTime), NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (28, N'4', N'How do you add a custom header or footer?', N'Insert tab > Header/Footer', N'Home tab > Header/Footer', N'Layout tab > Header/Footer', N'Design tab > Header/Footer', N'Insert tab > Header/Footer', 1, CAST(N'2024-11-27 15:33:33.067' AS DateTime), NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (29, N'4', N'What is the "Track Changes" feature used for?', N'Monitoring document edits', N'Highlighting errors', N'Changing text formatting', N'Adding comments', N'Monitoring document edits', 1, CAST(N'2024-11-27 15:35:14.847' AS DateTime), NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (26, N'4', N'How do you create a new document using a template?', N'File tab > New > Choose Template', N'Home tab > New Document', N'Insert tab > New Document', N'Design tab > New Document', N'File tab > New > Choose Template', 1, CAST(N'2024-11-27 15:32:03.010' AS DateTime), NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (30, N'4', N'How do you insert a blank page in Word?', N'Ctrl + Enter', N'Insert tab > Blank Page', N'Home tab > Blank Page', N'Layout tab > Blank Page', N'Insert tab > Blank Page', 1, CAST(N'2024-11-27 15:36:40.730' AS DateTime), NULL, N'2', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (31, N'2', N'Who painted the ceiling of the Sistine Chapel?', N'Leonardo da Vinci', N'Michelangelo', N' Raphael', N'Caravaggio', N' Michelangelo', 1, CAST(N'2024-11-27 15:40:09.927' AS DateTime), NULL, N'2', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (33, N'2', N'Mercury', N'Venus', N'Jupiter', N'Mars', N'Venus', N'Jupiter', 1, CAST(N'2024-11-27 15:42:20.280' AS DateTime), NULL, N'2', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (34, N'2', N'Who wrote the play "Macbeth"?', N'William Shakespeare', N'Christopher Marlowe', N'Ben Jonson', N'John Webster', N' William Shakespeare', 1, CAST(N'2024-11-27 15:43:36.680' AS DateTime), NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (35, N'2', N'What is the largest country by area?', N'Canada', N' China', N'United States', N' Russia', N' Russia', 1, CAST(N'2024-11-27 15:44:39.277' AS DateTime), NULL, N'4', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (36, N'2', N'What is the primary function of red blood cells?', N'Fighting infections', N'Transporting oxygen', N' Clotting blood', N' Regulating body temperature', N' Transporting oxygen', 1, CAST(N'2024-11-27 15:45:30.467' AS DateTime), NULL, N'2', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (37, N'2', N'Who was the first President of the United States?', N'Thomas Jefferson', N'John Adams', N'George Washington', N'Abraham Lincoln', N'George Washington', 1, CAST(N'2024-11-27 15:48:09.823' AS DateTime), NULL, N'3', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (38, N'2', N'Which continent is the Great Wall of China located in?', N' Europe', N'Africa', N'Asia', N'South America', N'Asia', 1, CAST(N'2024-11-27 15:49:37.480' AS DateTime), NULL, N'3', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (39, N'2', N'What is the capital of Spain?', N' Barcelona', N'Madrid', N'Valencia', N'Seville', N'Madrid', 1, CAST(N'2024-11-27 15:50:45.303' AS DateTime), NULL, N'2', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (40, N'2', N'Who wrote "Jane Eyre"?', N'Emily Brontë', N'Mary Shelley', N'Jane Austen', N'Charlotte Brontë', N' Charlotte Brontë', 1, CAST(N'2024-11-27 15:51:33.970' AS DateTime), NULL, N'4', NULL, NULL, NULL)
INSERT [dbo].[exam] ([id], [subjectname], [question], [option1], [option2], [option3], [option4], [rigthanswer], [status], [rts], [sunjectid], [correct_option], [selectoption], [userid], [examid]) VALUES (32, N'2', N'What is the capital of Germany?', N' Munich', N' Frankfurt', N'Hamburg', N'Berlin', N' Berlin', 1, CAST(N'2024-11-27 15:41:01.040' AS DateTime), NULL, N'4', NULL, NULL, NULL)
INSERT [dbo].[examsubject] ([id], [subjectname], [status], [rts]) VALUES (1, N'General English', 1, CAST(N'2024-11-18 12:36:11.847' AS DateTime))
INSERT [dbo].[examsubject] ([id], [subjectname], [status], [rts]) VALUES (2, N'General Knowledge & Current Affairs', 1, CAST(N'2024-11-18 12:36:39.113' AS DateTime))
INSERT [dbo].[examsubject] ([id], [subjectname], [status], [rts]) VALUES (3, N'Basic computer', 1, CAST(N'2024-11-18 16:11:54.157' AS DateTime))
INSERT [dbo].[examsubject] ([id], [subjectname], [status], [rts]) VALUES (4, N'RS -CIT', 1, CAST(N'2024-11-19 13:14:42.053' AS DateTime))
INSERT [dbo].[register] ([id], [name], [mobile], [email], [password], [rts], [userid], [username], [userinfo], [status]) VALUES (1, N'harshabghel', N'9799210732', N'harshabghel97@gmail.com', N'12345', CAST(N'2024-12-06 13:48:30.740' AS DateTime), NULL, NULL, NULL, N'1')
INSERT [dbo].[register] ([id], [name], [mobile], [email], [password], [rts], [userid], [username], [userinfo], [status]) VALUES (2, N'harshabghel', N'9799210732', N'harshabghel97@gmail.com', N'12345', CAST(N'2024-12-06 13:48:38.843' AS DateTime), NULL, NULL, NULL, N'1')
INSERT [dbo].[register] ([id], [name], [mobile], [email], [password], [rts], [userid], [username], [userinfo], [status]) VALUES (3, N'nikhil', N'9799210731', N'nikhilrupani17@gmail.com', N'12345', CAST(N'2024-12-06 13:56:39.950' AS DateTime), NULL, NULL, NULL, N'1')
INSERT [dbo].[register] ([id], [name], [mobile], [email], [password], [rts], [userid], [username], [userinfo], [status]) VALUES (4, N'harshabghel', N'8529153771', N'harshitabaghel193@gmail.com', N'54321', CAST(N'2024-12-07 13:15:53.670' AS DateTime), NULL, NULL, NULL, N'1')
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 1, N'1', 1, NULL, N'1', NULL, NULL, NULL, 1)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 1, N'2', 1, NULL, N'1', NULL, NULL, NULL, 2)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 1, N'3', 1, NULL, N'0', NULL, NULL, NULL, 3)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 1, N'3', 1, NULL, N'1', NULL, NULL, NULL, 4)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 1, N'3', 1, NULL, N'1', NULL, NULL, NULL, 5)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 1, N'3', 1, NULL, N'0', NULL, NULL, NULL, 6)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 1, N'1', 1, NULL, N'0', NULL, NULL, NULL, 7)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 1, N'2', 1, NULL, N'1', NULL, NULL, NULL, 8)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 1, N'4', 1, NULL, N'1', NULL, NULL, NULL, 9)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 1, N'1', 1, NULL, N'0', NULL, NULL, NULL, 10)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 4, N'1', 4, NULL, N'1', NULL, NULL, NULL, 21)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 4, N'2', 4, NULL, N'0', NULL, NULL, NULL, 22)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 4, N'3', 4, NULL, N'0', NULL, NULL, NULL, 23)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 4, N'2', 4, NULL, N'0', NULL, NULL, NULL, 24)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 4, N'2', 4, NULL, N'0', NULL, NULL, NULL, 25)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 4, N'2', 4, NULL, N'0', NULL, NULL, NULL, 27)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 4, N'2', 4, NULL, N'0', NULL, NULL, NULL, 28)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 4, N'3', 4, NULL, N'0', NULL, NULL, NULL, 29)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 4, N'1', 4, NULL, N'1', NULL, NULL, NULL, 26)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 4, N'4', 4, NULL, N'0', NULL, NULL, NULL, 30)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 3, N'2', 2, NULL, N'1', NULL, NULL, NULL, 31)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 3, N'4', 2, NULL, N'0', NULL, NULL, NULL, 33)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 3, N'1', 2, NULL, N'1', NULL, NULL, NULL, 34)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 3, N'2', 2, NULL, N'0', NULL, NULL, NULL, 35)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 3, N'3', 2, NULL, N'0', NULL, NULL, NULL, 36)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 3, N'2', 2, NULL, N'0', NULL, NULL, NULL, 37)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 3, N'2', 2, NULL, N'0', NULL, NULL, NULL, 38)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 3, N'3', 2, NULL, N'0', NULL, NULL, NULL, 39)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 3, N'1', 2, NULL, N'0', NULL, NULL, NULL, 40)
INSERT [dbo].[result] ([id], [userid], [selectoption], [examid], [rigthanswer], [totslanswet], [questionid], [result], [subjectname], [totalquestion]) VALUES (NULL, 3, N'4', 2, NULL, N'1', NULL, NULL, NULL, 32)
INSERT [dbo].[User_Registration] ([id], [user_name], [user_email], [user_contact], [user_pass], [status], [rts]) VALUES (1, N'HARSHABAGHEL', N'harshabaghel@97', N'9799210731', N'12345', 1, CAST(N'2024-11-21 12:32:58.670' AS DateTime))
INSERT [dbo].[User_Registration] ([id], [user_name], [user_email], [user_contact], [user_pass], [status], [rts]) VALUES (2, N'HARSHABAGHEL', N'harshabaghel96@gmail.com', N'9799210731', N'12345', 1, CAST(N'2024-11-21 12:48:03.180' AS DateTime))
USE [master]
GO
ALTER DATABASE [examsurevy] SET  READ_WRITE 
GO
