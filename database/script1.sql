USE [ICBWebsiteDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 13/03/2018 21:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Role] [tinyint] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Email] [varchar](500) NOT NULL,
	[Fullname] [nvarchar](250) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[IsLocked] [bit] NULL,
	[PhoneNumber] [varchar](15) NULL,
	[LastLoginTime] [datetime] NULL,
	[LastMordifiedTime] [datetime] NULL,
	[ImageURL] [nvarchar](500) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 13/03/2018 21:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Order] [int] NULL,
	[NameENG] [varchar](500) NULL,
	[TitleENG] [varchar](500) NULL,
	[Active] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 13/03/2018 21:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Fullname] [nvarchar](500) NULL,
	[Website] [nvarchar](500) NULL,
	[Email] [nvarchar](500) NULL,
	[PhoneNumber] [varchar](15) NULL,
	[Address] [nvarchar](500) NULL,
	[Thumbnail] [nvarchar](500) NULL,
	[Icon] [nvarchar](500) NULL,
	[Order] [int] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Document]    Script Date: 13/03/2018 21:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Path] [nvarchar](500) NOT NULL,
	[Caption] [nvarchar](500) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UserIDCreated] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Content] [ntext] NULL,
	[UpdateTime] [datetime] NULL,
	[UserUpdate] [int] NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 13/03/2018 21:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Address] [nvarchar](500) NULL,
	[Email] [nvarchar](500) NOT NULL,
	[PhoneNumber] [varchar](15) NULL,
	[Theme] [nvarchar](500) NULL,
	[Content] [ntext] NULL,
	[Status] [int] NOT NULL,
	[ContentFeedback] [ntext] NULL,
	[Answered] [bit] NOT NULL,
	[CreateTime] [datetime] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[News]    Script Date: 13/03/2018 21:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](500) NOT NULL,
	[ThumbnailURL] [nvarchar](500) NULL,
	[PostedDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[Category] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[ContentReview] [nvarchar](500) NULL,
	[Content] [ntext] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleManager]    Script Date: 13/03/2018 21:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleManager](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[Addition] [bit] NOT NULL,
	[Edit] [bit] NOT NULL,
	[Delete] [bit] NOT NULL,
	[View] [bit] NOT NULL,
	[CanActive] [bit] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_RoleManager] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service]    Script Date: 13/03/2018 21:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[NameENG] [varchar](500) NULL,
	[Title] [nvarchar](500) NULL,
	[TitleENG] [nvarchar](500) NULL,
	[ImageURL] [nvarchar](500) NULL,
	[ThumbnailURL] [nvarchar](500) NULL,
	[Caption] [nvarchar](500) NULL,
	[CaptionENG] [varchar](500) NULL,
	[Introduction] [ntext] NULL,
	[Procedure] [ntext] NULL,
	[DocumentArrayID] [nvarchar](500) NULL,
	[CategoryID] [int] NOT NULL,
	[HasChild] [bit] NULL,
	[ServiceID] [int] NOT NULL,
	[Status] [int] NULL,
	[CreateTime] [datetime] NULL,
	[LastMordifiedTime] [datetime] NULL,
	[ViewCounter] [bigint] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 13/03/2018 21:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[NameENG] [varchar](500) NULL,
	[Address] [nvarchar](500) NULL,
	[Tel] [varchar](15) NULL,
	[Fax] [varchar](15) NULL,
	[Hotline] [varchar](15) NULL,
	[Email] [nvarchar](500) NULL,
	[Website] [nvarchar](500) NULL,
	[Category] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Content] [ntext] NULL,
	[ContentENG] [ntext] NULL,
	[Caption] [ntext] NULL,
	[Description] [ntext] NULL,
	[ImageURL] [nvarchar](500) NULL,
 CONSTRAINT [PK_SystemConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [Username], [Password], [Role], [CreateTime], [Email], [Fullname], [IsActive], [IsDeleted], [IsLocked], [PhoneNumber], [LastLoginTime], [LastMordifiedTime], [ImageURL]) VALUES (1, N'khanhnd', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2017-10-03 16:58:21.033' AS DateTime), N'khanhngdinh@gmail.com', N'Nguyễn Đình Khánh', 1, 0, 0, N'42424242424', NULL, NULL, NULL)
INSERT [dbo].[Account] ([ID], [Username], [Password], [Role], [CreateTime], [Email], [Fullname], [IsActive], [IsDeleted], [IsLocked], [PhoneNumber], [LastLoginTime], [LastMordifiedTime], [ImageURL]) VALUES (4, N'dungtt', N'e10adc3949ba59abbe56e057f20f883e', 1, CAST(N'2017-10-01 00:00:00.000' AS DateTime), N'dungtt@gmail.com', N'Thân Thị Dung', 1, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([ID], [Username], [Password], [Role], [CreateTime], [Email], [Fullname], [IsActive], [IsDeleted], [IsLocked], [PhoneNumber], [LastLoginTime], [LastMordifiedTime], [ImageURL]) VALUES (6, N'admin', N'e10adc3949ba59abbe56e057f20f883e', 4, CAST(N'2018-01-09 00:00:00.000' AS DateTime), N'khanhd@gmail.com', N'Nguyễn Văn A', 1, 0, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([ID], [Username], [Password], [Role], [CreateTime], [Email], [Fullname], [IsActive], [IsDeleted], [IsLocked], [PhoneNumber], [LastLoginTime], [LastMordifiedTime], [ImageURL]) VALUES (10, N'nhatnm', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2018-01-27 00:00:00.000' AS DateTime), N'nhatnm@gmail.com', N'Nguyễn Minh Nhật 1', 0, 0, 0, N'7683492391', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (1, N'Chứng nhận hệ thống', N'Chứng nhận hệ thống', NULL, N'ENG', N'ENG', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (4, N'nhóm 2', N'mô tả nhóm 2', NULL, N'group 2', N'title 2', 0)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (5, N'Nhóm 0a sd', N'Mô tả 0 asda sd', NULL, N'Group 0d asd á', N'Title 0 dsa d á', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (6, N'Nhóm 1', N'Mô tả 1', 1, N'Group 1', N'Title 1', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (7, N'Nhóm 2', N'Mô tả 2', 2, N'Group 2', N'Title 2', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (8, N'Nhóm 3', N'Mô tả 3', 3, N'Group 3', N'Title 3', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (9, N'Nhóm 4', N'Mô tả 4', 4, N'Group 4', N'Title 4', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (10, N'Nhóm 5', N'Mô tả 5', 5, N'Group 5', N'Title 5', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (11, N'Nhóm 6', N'Mô tả 6', 6, N'Group 6', N'Title 6', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (12, N'Nhóm 7', N'Mô tả 7', 7, N'Group 7', N'Title 7', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (13, N'Nhóm 8', N'Mô tả 8', 8, N'Group 8', N'Title 8', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (14, N'Nhóm 9', N'Mô tả 9', 9, N'Group 9', N'Title 9', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (15, N'Nhóm 10', N'Mô tả 10', 10, N'Group 10', N'Title 10', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (16, N'Nhóm 11', N'Mô tả 11', 11, N'Group 11', N'Title 11', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (17, N'Nhóm 12', N'Mô tả 12', 12, N'Group 12', N'Title 12', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (18, N'Nhóm 13', N'Mô tả 13', 13, N'Group 13', N'Title 13', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (19, N'Nhóm 14', N'Mô tả 14', 14, N'Group 14', N'Title 14', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (20, N'Nhóm 15', N'Mô tả 15', 15, N'Group 15', N'Title 15', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (21, N'Nhóm 16', N'Mô tả 16', 16, N'Group 16', N'Title 16', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (22, N'Nhóm 17', N'Mô tả 17', 17, N'Group 17', N'Title 17', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (23, N'Nhóm 18', N'Mô tả 18', 18, N'Group 18', N'Title 18', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (24, N'Nhóm 19', N'Mô tả 19', 19, N'Group 19', N'Title 19', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (25, N'Nhóm 20', N'Mô tả 20', 20, N'Group 20', N'Title 20', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (26, N'Nhóm 21', N'Mô tả 21', 21, N'Group 21', N'Title 21', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (27, N'Nhóm 22', N'Mô tả 22', 22, N'Group 22', N'Title 22', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (28, N'Nhóm 23', N'Mô tả 23', 23, N'Group 23', N'Title 23', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (29, N'Nhóm 24', N'Mô tả 24', 24, N'Group 24', N'Title 24', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (30, N'Nhóm 25', N'Mô tả 25', 25, N'Group 25', N'Title 25', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (31, N'Nhóm 26', N'Mô tả 26', 26, N'Group 26', N'Title 26', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (32, N'Nhóm 27', N'Mô tả 27', 27, N'Group 27', N'Title 27', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (33, N'Nhóm 28', N'Mô tả 28', 28, N'Group 28', N'Title 28', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (34, N'Nhóm 29', N'Mô tả 29', 29, N'Group 29', N'Title 29', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (35, N'Nhóm 30', N'Mô tả 30', 30, N'Group 30', N'Title 30', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (36, N'Nhóm 31', N'Mô tả 31', 31, N'Group 31', N'Title 31', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (37, N'Nhóm 32', N'Mô tả 32', 32, N'Group 32', N'Title 32', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (38, N'Nhóm 33', N'Mô tả 33', 33, N'Group 33', N'Title 33', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (39, N'Nhóm 34', N'Mô tả 34', 34, N'Group 34', N'Title 34', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (40, N'Nhóm 35', N'Mô tả 35', 35, N'Group 35', N'Title 35', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (41, N'Nhóm 36', N'Mô tả 36', 36, N'Group 36', N'Title 36', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (42, N'Nhóm 37', N'Mô tả 37', 37, N'Group 37', N'Title 37', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (43, N'Nhóm 38', N'Mô tả 38', 38, N'Group 38', N'Title 38', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (44, N'Nhóm 39', N'Mô tả 39', 39, N'Group 39', N'Title 39', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (45, N'Nhóm 40', N'Mô tả 40', 40, N'Group 40', N'Title 40', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (46, N'Nhóm 41', N'Mô tả 41', 41, N'Group 41', N'Title 41', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (47, N'Nhóm 42', N'Mô tả 42', 42, N'Group 42', N'Title 42', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (48, N'Nhóm 43', N'Mô tả 43', 43, N'Group 43', N'Title 43', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (49, N'Nhóm 44', N'Mô tả 44', 44, N'Group 44', N'Title 44', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (50, N'Nhóm 45', N'Mô tả 45', 45, N'Group 45', N'Title 45', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (51, N'Nhóm 46', N'Mô tả 46', 46, N'Group 46', N'Title 46', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (52, N'Nhóm 47', N'Mô tả 47', 47, N'Group 47', N'Title 47', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (53, N'Nhóm 48', N'Mô tả 48', 48, N'Group 48', N'Title 48', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (54, N'Nhóm 49', N'Mô tả 49', 49, N'Group 49', N'Title 49', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (55, N'Nhóm 50', N'Mô tả 50', 50, N'Group 50', N'Title 50', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (56, N'Nhóm 51', N'Mô tả 51', 51, N'Group 51', N'Title 51', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (57, N'Nhóm 52', N'Mô tả 52', 52, N'Group 52', N'Title 52', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (58, N'Nhóm 53', N'Mô tả 53', 53, N'Group 53', N'Title 53', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (59, N'Nhóm 54', N'Mô tả 54', 54, N'Group 54', N'Title 54', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (60, N'Nhóm 55', N'Mô tả 55', 55, N'Group 55', N'Title 55', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (61, N'Nhóm 56', N'Mô tả 56', 56, N'Group 56', N'Title 56', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (62, N'Nhóm 57', N'Mô tả 57', 57, N'Group 57', N'Title 57', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (63, N'Nhóm 58', N'Mô tả 58', 58, N'Group 58', N'Title 58', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (64, N'Nhóm 59', N'Mô tả 59', 59, N'Group 59', N'Title 59', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (65, N'Nhóm 60', N'Mô tả 60', 60, N'Group 60', N'Title 60', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (67, N'Nhóm 62', N'Mô tả 62', 62, N'Group 62', N'Title 62', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (68, N'Nhóm 63', N'Mô tả 63', 63, N'Group 63', N'Title 63', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (69, N'Nhóm 64', N'Mô tả 64', 64, N'Group 64', N'Title 64', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (70, N'Nhóm 65', N'Mô tả 65', 65, N'Group 65', N'Title 65', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (71, N'Nhóm 66', N'Mô tả 66', 66, N'Group 66', N'Title 66', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (72, N'Nhóm 67', N'Mô tả 67', 67, N'Group 67', N'Title 67', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (73, N'Nhóm 68', N'Mô tả 68', 68, N'Group 68', N'Title 68', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (74, N'Nhóm 69', N'Mô tả 69', 69, N'Group 69', N'Title 69', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (75, N'Nhóm 70', N'Mô tả 70', 70, N'Group 70', N'Title 70', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (76, N'Nhóm 71', N'Mô tả 71', 71, N'Group 71', N'Title 71', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (77, N'Nhóm 72', N'Mô tả 72', 72, N'Group 72', N'Title 72', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (78, N'Nhóm 73', N'Mô tả 73', 73, N'Group 73', N'Title 73', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (79, N'Nhóm 74', N'Mô tả 74', 74, N'Group 74', N'Title 74', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (80, N'Nhóm 75', N'Mô tả 75', 75, N'Group 75', N'Title 75', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (81, N'Nhóm 76', N'Mô tả 76', 76, N'Group 76', N'Title 76', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (82, N'Nhóm 77', N'Mô tả 77', 77, N'Group 77', N'Title 77', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (83, N'Nhóm 78', N'Mô tả 78', 78, N'Group 78', N'Title 78', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (84, N'Nhóm 79', N'Mô tả 79', 79, N'Group 79', N'Title 79', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (85, N'Nhóm 80', N'Mô tả 80', 80, N'Group 80', N'Title 80', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (86, N'Nhóm 81', N'Mô tả 81', 81, N'Group 81', N'Title 81', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (87, N'Nhóm 82', N'Mô tả 82', 82, N'Group 82', N'Title 82', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (88, N'Nhóm 83', N'Mô tả 83', 83, N'Group 83', N'Title 83', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (89, N'Nhóm 84', N'Mô tả 84', 84, N'Group 84', N'Title 84', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (90, N'Nhóm 85', N'Mô tả 85', 85, N'Group 85', N'Title 85', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (91, N'Nhóm 86', N'Mô tả 86', 86, N'Group 86', N'Title 86', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (92, N'Nhóm 87', N'Mô tả 87', 87, N'Group 87', N'Title 87', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (93, N'Nhóm 88', N'Mô tả 88', 88, N'Group 88', N'Title 88', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (94, N'Nhóm 89', N'Mô tả 89', 89, N'Group 89', N'Title 89', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (95, N'Nhóm 90', N'Mô tả 90', 90, N'Group 90', N'Title 90', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (96, N'Nhóm 91', N'Mô tả 91', 91, N'Group 91', N'Title 91', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (97, N'Nhóm 92', N'Mô tả 92', 92, N'Group 92', N'Title 92', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (98, N'Nhóm 93', N'Mô tả 93', 93, N'Group 93', N'Title 93', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (99, N'Nhóm 94', N'Mô tả 94', 94, N'Group 94', N'Title 94', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (100, N'Nhóm 95', N'Mô tả 95', 95, N'Group 95', N'Title 95', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (101, N'Nhóm 96', N'Mô tả 96', 96, N'Group 96', N'Title 96', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (102, N'Nhóm 97', N'Mô tả 97', 97, N'Group 97', N'Title 97', 1)
GO
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (103, N'Nhóm 98', N'Mô tả 98', 98, N'Group 98', N'Title 98', 1)
INSERT [dbo].[Category] ([ID], [Name], [Title], [Order], [NameENG], [TitleENG], [Active]) VALUES (104, N'Nhóm 99', N'Mô tả 99', 99, N'Group 99', N'Title 99', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID], [Name], [Title], [Fullname], [Website], [Email], [PhoneNumber], [Address], [Thumbnail], [Icon], [Order], [Status]) VALUES (1, N'Công ty cổ phần phát triển giải pháp phần mềm Việt', N'Công ty cổ phần phát triển giải pháp phần mềm Việt', NULL, N'Hà Nội', N'dungtt01@gmail.com', N'0123654789', N'Hà Nội', N'/Uploads/images/Koala.jpg', NULL, NULL, 1)
INSERT [dbo].[Customer] ([ID], [Name], [Title], [Fullname], [Website], [Email], [PhoneNumber], [Address], [Thumbnail], [Icon], [Order], [Status]) VALUES (2, N'Khách hàng 01', N'Khách hàng 01', NULL, N'Hà Nội', N'kh0121@gmail.com', N'0125632548', N'Hà Nội', N'/Uploads/images/bfi_thumb/2816239243_c185caa78a_b-2xau0i28piaw9cbwa4tfka.jpg', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Document] ON 

INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (1, N'Path 0', N'caption 0', CAST(N'2017-10-14 22:26:05.810' AS DateTime), 1, 1, 2, N'Description 0', N'Content 0', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (2, N'Path 1', N'caption 1', CAST(N'2017-10-14 22:26:06.157' AS DateTime), 1, 1, 2, N'Description 1', N'Content 1', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (3, N'Path 2', N'caption 2', CAST(N'2017-10-14 22:26:06.177' AS DateTime), 1, 1, 2, N'Description 2', N'Content 2', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (4, N'Path 3', N'caption 3', CAST(N'2017-10-14 22:26:06.180' AS DateTime), 1, 1, 2, N'Description 3', N'Content 3', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (5, N'Path 4', N'caption 4', CAST(N'2017-10-14 22:26:06.183' AS DateTime), 1, 1, 2, N'Description 4', N'Content 4', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (6, N'Path 5', N'caption 5', CAST(N'2017-10-14 22:26:06.183' AS DateTime), 1, 1, 2, N'Description 5', N'Content 5', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (7, N'Path 6', N'caption 6', CAST(N'2017-10-14 22:26:06.187' AS DateTime), 1, 1, 2, N'Description 6', N'Content 6', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (8, N'Path 7', N'caption 7', CAST(N'2017-10-14 22:26:06.187' AS DateTime), 1, 1, 2, N'Description 7', N'Content 7', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (9, N'Path 8', N'caption 8', CAST(N'2017-10-14 22:26:06.190' AS DateTime), 1, 1, 2, N'Description 8', N'Content 8', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (10, N'Path 9', N'caption 9', CAST(N'2017-10-14 22:26:06.190' AS DateTime), 1, 1, 2, N'Description 9', N'Content 9', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (11, N'Path 10', N'caption 10', CAST(N'2017-10-14 22:26:06.193' AS DateTime), 1, 1, 2, N'Description 10', N'Content 10', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (12, N'Path 11', N'caption 11', CAST(N'2017-10-14 22:26:06.193' AS DateTime), 1, 1, 2, N'Description 11', N'Content 11', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (13, N'Path 12', N'caption 12', CAST(N'2017-10-14 22:26:06.197' AS DateTime), 1, 1, 2, N'Description 12', N'Content 12', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (14, N'Path 13', N'caption 13', CAST(N'2017-10-14 22:26:06.197' AS DateTime), 1, 1, 2, N'Description 13', N'Content 13', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (15, N'Path 14', N'caption 14', CAST(N'2017-10-14 22:26:06.200' AS DateTime), 1, 1, 2, N'Description 14', N'Content 14', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (16, N'Path 15', N'caption 15', CAST(N'2017-10-14 22:26:06.200' AS DateTime), 1, 1, 2, N'Description 15', N'Content 15', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (17, N'Path 16', N'caption 16', CAST(N'2017-10-14 22:26:06.203' AS DateTime), 1, 1, 2, N'Description 16', N'Content 16', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (18, N'Path 17', N'caption 17', CAST(N'2017-10-14 22:26:06.203' AS DateTime), 1, 1, 2, N'Description 17', N'Content 17', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (19, N'Path 18', N'caption 18', CAST(N'2017-10-14 22:26:06.207' AS DateTime), 1, 1, 2, N'Description 18', N'Content 18', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (20, N'Path 19', N'caption 19', CAST(N'2017-10-14 22:26:06.207' AS DateTime), 1, 1, 2, N'Description 19', N'Content 19', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (21, N'Path 20', N'caption 20', CAST(N'2017-10-14 22:26:06.210' AS DateTime), 1, 1, 2, N'Description 20', N'Content 20', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (22, N'Path 21', N'caption 21', CAST(N'2017-10-14 22:26:06.210' AS DateTime), 1, 1, 2, N'Description 21', N'Content 21', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (23, N'Path 22', N'caption 22', CAST(N'2017-10-14 22:26:06.213' AS DateTime), 1, 1, 2, N'Description 22', N'Content 22', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (24, N'Path 23', N'caption 23', CAST(N'2017-10-14 22:26:06.213' AS DateTime), 1, 1, 2, N'Description 23', N'Content 23', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (25, N'Path 24', N'caption 24', CAST(N'2017-10-14 22:26:06.217' AS DateTime), 1, 1, 2, N'Description 24', N'Content 24', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (26, N'Path 25', N'caption 25', CAST(N'2017-10-14 22:26:06.217' AS DateTime), 1, 1, 2, N'Description 25', N'Content 25', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (27, N'Path 26', N'caption 26', CAST(N'2017-10-14 22:26:06.220' AS DateTime), 1, 1, 2, N'Description 26', N'Content 26', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (28, N'Path 27', N'caption 27', CAST(N'2017-10-14 22:26:06.220' AS DateTime), 1, 1, 2, N'Description 27', N'Content 27', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (29, N'Path 28', N'caption 28', CAST(N'2017-10-14 22:26:06.223' AS DateTime), 1, 1, 2, N'Description 28', N'Content 28', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (242, N'/Uploads/images/Koala.jpg', N'asd adas d', CAST(N'2017-10-20 15:07:18.000' AS DateTime), 4, 0, 2, N'a đâsd', N'adasdas dsa', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (243, N'/Uploads/images/Koala.jpg', N'àafaf', CAST(N'2017-10-20 15:56:08.000' AS DateTime), 1, 0, 2, N'âfaf', NULL, NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (245, N'/Uploads/images/bfi_thumb/2816239243_c185caa78a_b-2xau0i28nijqt0jxfagqh6.jpg', N'adasda', CAST(N'2017-10-20 15:58:14.000' AS DateTime), 4, 0, 2, N'adasd', NULL, NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (246, N'/Uploads/images/bfi_thumb/2816239243_c185caa78a_b-2xau0i28nijqt0jxfagqh6.jpg', N'ádad', CAST(N'2017-10-20 15:59:15.000' AS DateTime), 1, 0, 2, N'adad', N'<p>khnahs</p>
', CAST(N'2018-01-18 10:15:11.447' AS DateTime), 1)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (247, N'/Uploads/images/bfi_thumb/2816239243_c185caa78a_b-2xau0i28nijqt0jxfagqh6.jpg', N'a11111', CAST(N'2017-10-20 16:00:42.000' AS DateTime), 1, 0, 2, N'a f f ff f f f  ff  ff f f  gggg  gg', N'<p>&aacute;d đ d d đ<img alt="" src="/Uploads/images/bfi_thumb/2816239243_c185caa78a_b-2xau0i28nijqt0jxfagqh6.jpg" style="height:116px; width:119px" />&nbsp; &nbsp;asdas d&aacute; d&aacute; da sdas d&aacute;&nbsp;</p>
', CAST(N'2018-01-18 16:04:55.887' AS DateTime), 1)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (248, N'Path 0', N'Caption 0', CAST(N'2017-10-23 19:33:32.353' AS DateTime), 1, 1, 1, N'Description 0', N'Content 0', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (249, N'Path 1', N'Caption 1', CAST(N'2017-10-23 19:33:33.137' AS DateTime), 1, 1, 1, N'Description 1', N'Content 1', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (250, N'Path 2', N'Caption 2', CAST(N'2017-10-23 19:33:33.143' AS DateTime), 1, 1, 1, N'Description 2', N'Content 2', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (251, N'Path 3', N'Caption 3', CAST(N'2017-10-23 19:33:33.143' AS DateTime), 1, 1, 1, N'Description 3', N'Content 3', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (252, N'Path 4', N'Caption 4', CAST(N'2017-10-23 19:33:33.147' AS DateTime), 1, 1, 1, N'Description 4', N'Content 4', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (253, N'Path 5', N'Caption 5', CAST(N'2017-10-23 19:33:33.147' AS DateTime), 1, 1, 1, N'Description 5', N'Content 5', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (254, N'Path 6', N'Caption 6', CAST(N'2017-10-23 19:33:33.173' AS DateTime), 1, 1, 1, N'Description 6', N'Content 6', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (255, N'Path 7', N'Caption 7', CAST(N'2017-10-23 19:33:33.197' AS DateTime), 1, 1, 1, N'Description 7', N'Content 7', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (256, N'Path 8', N'Caption 8', CAST(N'2017-10-23 19:33:33.197' AS DateTime), 1, 1, 1, N'Description 8', N'Content 8', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (257, N'Path 9', N'Caption 9', CAST(N'2017-10-23 19:33:33.197' AS DateTime), 1, 1, 1, N'Description 9', N'Content 9', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (258, N'Path 10', N'Caption 10', CAST(N'2017-10-23 19:33:33.200' AS DateTime), 1, 1, 1, N'Description 10', N'Content 10', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (259, N'Path 11', N'Caption 11', CAST(N'2017-10-23 19:33:33.200' AS DateTime), 1, 1, 1, N'Description 11', N'Content 11', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (260, N'Path 12', N'Caption 12', CAST(N'2017-10-23 19:33:33.200' AS DateTime), 1, 1, 1, N'Description 12', N'Content 12', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (261, N'Path 13', N'Caption 13', CAST(N'2017-10-23 19:33:33.207' AS DateTime), 1, 1, 1, N'Description 13', N'Content 13', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (262, N'Path 14', N'Caption 14', CAST(N'2017-10-23 19:33:33.210' AS DateTime), 1, 1, 1, N'Description 14', N'Content 14', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (263, N'Path 15', N'Caption 15', CAST(N'2017-10-23 19:33:33.213' AS DateTime), 1, 1, 1, N'Description 15', N'Content 15', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (264, N'Path 16', N'Caption 16', CAST(N'2017-10-23 19:33:33.213' AS DateTime), 1, 1, 1, N'Description 16', N'Content 16', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (265, N'Path 17', N'Caption 17', CAST(N'2017-10-23 19:33:33.217' AS DateTime), 1, 0, 1, N'Description 17 d asds ada', N'Content 17', CAST(N'2017-10-23 22:52:02.603' AS DateTime), 1)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (267, N'Path 19', N'Caption 19', CAST(N'2017-10-23 19:33:33.217' AS DateTime), 1, 1, 1, N'Description 19', N'Content 19', NULL, 0)
INSERT [dbo].[Document] ([ID], [Path], [Caption], [CreateTime], [UserIDCreated], [Status], [CategoryID], [Description], [Content], [UpdateTime], [UserUpdate]) VALUES (268, N'/Uploads/files/CV-Nguyễn Đình Khánhdocx.pdf', N'sad á ', CAST(N'2017-10-23 21:51:12.890' AS DateTime), 1, 1, 1, N's sd ss', NULL, CAST(N'2017-10-23 22:52:26.363' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Document] OFF
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([ID], [Name], [Address], [Email], [PhoneNumber], [Theme], [Content], [Status], [ContentFeedback], [Answered], [CreateTime], [UserID]) VALUES (3, N'khánh', NULL, N'khanh@gmail.com', N'099090909', N'khánh', N'dakdl;akd;la', 0, NULL, 0, CAST(N'2017-11-27 21:13:59.917' AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Address], [Email], [PhoneNumber], [Theme], [Content], [Status], [ContentFeedback], [Answered], [CreateTime], [UserID]) VALUES (4, N'da', NULL, N'dá', N'sdas', N'dád', N'ấdad', 0, NULL, 0, CAST(N'2017-11-27 21:27:50.540' AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Address], [Email], [PhoneNumber], [Theme], [Content], [Status], [ContentFeedback], [Answered], [CreateTime], [UserID]) VALUES (5, N'da', NULL, N'dá', N'sdas', N'dád', N'ấdad', 0, NULL, 0, CAST(N'2017-11-27 21:28:34.577' AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Address], [Email], [PhoneNumber], [Theme], [Content], [Status], [ContentFeedback], [Answered], [CreateTime], [UserID]) VALUES (6, N'da', NULL, N'dá', N'sdas', N'dád', N'ấdad', 0, NULL, 0, CAST(N'2017-11-27 21:28:48.637' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (2, N'caption 1', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.273' AS DateTime), 1, 1, 1, N'content review 1', N'Content 1')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (4, N'caption 3', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.280' AS DateTime), 1, 1, 1, N'content review 3', N'Content 3')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (5, N'caption 4', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.280' AS DateTime), 1, 1, 1, N'content review 4', N'Content 4')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (6, N'caption 5', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.280' AS DateTime), 1, 1, 1, N'content review 5', N'Content 5')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (7, N'caption 6', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.283' AS DateTime), 1, 1, 1, N'content review 6', N'Content 6')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (8, N'caption 7', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.283' AS DateTime), 1, 1, 1, N'content review 7', N'Content 7')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (9, N'caption 8', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.283' AS DateTime), 1, 1, 1, N'content review 8', N'Content 8')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (10, N'caption 9', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.287' AS DateTime), 1, 1, 1, N'content review 9', N'Content 9')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (11, N'caption 10', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.287' AS DateTime), 1, 1, 1, N'content review 10', N'Content 10')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (12, N'caption 11', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.317' AS DateTime), 1, 1, 1, N'content review 11', N'Content 11')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (13, N'caption 12', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.317' AS DateTime), 1, 1, 1, N'content review 12', N'Content 12')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (14, N'caption 13', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.320' AS DateTime), 1, 1, 1, N'content review 13', N'Content 13')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (15, N'caption 14', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.320' AS DateTime), 1, 1, 1, N'content review 14', N'Content 14')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (16, N'caption 15', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.323' AS DateTime), 1, 1, 1, N'content review 15', N'Content 15')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (17, N'caption 16', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.327' AS DateTime), 1, 1, 1, N'content review 16', N'Content 16')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (18, N'caption 17', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.327' AS DateTime), 1, 1, 1, N'content review 17', N'Content 17')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (19, N'caption 18', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.327' AS DateTime), 1, 1, 1, N'content review 18', N'Content 18')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (20, N'caption 19', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.330' AS DateTime), 1, 1, 1, N'content review 19', N'Content 19')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (21, N'caption 20', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.333' AS DateTime), 1, 1, 1, N'content review 20', N'Content 20')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (22, N'caption 21', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.333' AS DateTime), 1, 1, 1, N'content review 21', N'Content 21')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (23, N'caption 22', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.333' AS DateTime), 1, 1, 1, N'content review 22', N'Content 22')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (24, N'caption 23', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.337' AS DateTime), 1, 1, 1, N'content review 23', N'Content 23')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (25, N'caption 24', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.337' AS DateTime), 1, 1, 1, N'content review 24', N'Content 24')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (26, N'caption 25', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.340' AS DateTime), 1, 1, 1, N'content review 25', N'Content 25')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (27, N'caption 26', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.340' AS DateTime), 1, 1, 1, N'content review 26', N'Content 26')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (28, N'caption 27', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.343' AS DateTime), 1, 1, 1, N'content review 27', N'Content 27')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (29, N'caption 28', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.343' AS DateTime), 1, 1, 1, N'content review 28', N'Content 28')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (30, N'caption 29', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-10-25 20:52:03.347' AS DateTime), 1, 1, 1, N'content review 29', N'Content 29')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (62, N'Danh sách các khách hàng đã bị ICB cấp thu hồi, hủy bỏ chứng nhận', N'/Uploads/Images/bfi_thumb/Driving-in-Leather-Driving-Gloves-2xau0hk5nf1kd588clkc96.jpg', CAST(N'2017-11-15 15:24:31.000' AS DateTime), 1, 0, 1, N'ádad', N'<p>Aenean dui lectus, accumsan nec nulla sit amet, consectetur iaculis neque. Ut nec odio sem. Donec aliquam posuere imperdiet. Morbi luctus dolor id fringilla sagittis. Nulla fermentum risus nec accumsan mollis. Integer sit amet dui non tellus faucibus luctus vel ac neque. Praesent in adipiscing odio. Fusce egestas, ante vel varius vehicula, ipsum augue tincidunt est, sed rutrum enim neque venenatis enim. Aenean vel vestibulum lacus. Curabitur vel eros at nunc ultricies malesuada. Praesent vitae dolor lobortis, cursus nulla sed, euismod quam. Quisque scelerisque velit a mollis sodales.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Integer tempus laoreet lorem, quis auctor ante interdum id. Vivamus facilisis leo sed diam suscipit congue. Nam dolor est, imperdiet non urna sed, eleifend consequat magna. In hac habitasse platea dictumst. Curabitur lobortis diam suscipit lorem tristique, eu porttitor lorem fermentum. Morbi vehicula, tellus sit amet laoreet fermentum, leo urna commodo justo, at faucibus mi turpis ut eros. Aliquam id volutpat ligula. Phasellus quis odio convallis tortor posuere convallis ut vitae elit. Sed dapibus gravida augue et aliquet.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Curabitur diam enim, suscipit ac elit non, imperdiet ornare urna. Nunc in tempor dolor, eget gravida odio. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam lacinia consectetur urna. Etiam nulla ipsum, tempus ut viverra vel, imperdiet sed nibh. Ut leo mauris, laoreet eget diam in, tristique feugiat metus. Sed placerat dolor in lacus aliquet consequat nec placerat velit. Pellentesque tincidunt pellentesque sem. Morbi eu leo ac augue vestibulum accumsan. Etiam venenatis euismod condimentum. Quisque nec libero ut justo laoreet congue. Mauris ut augue varius, egestas arcu eu, rhoncus augue. Vivamus in dui in nisl tempus hendrerit at eu libero.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Etiam sem ante, rhoncus vel tincidunt ac, dapibus ut felis. Nam pharetra nunc sed diam varius tincidunt. Nunc pellentesque velit eleifend leo pharetra vehicula. Nunc vitae ante in diam euismod elementum ut in mi. Etiam vel dictum sem, at faucibus neque. In vitae auctor enim. Aenean id lectus quis orci fermentum condimentum vitae sed sapien. Proin mauris sapien, tincidunt ac purus et, tempor faucibus dui. Proin sed condimentum eros, id hendrerit turpis. Maecenas diam justo, laoreet at sodales ut, facilisis ac nibh. Sed cursus, orci sed vestibulum pharetra, risus ipsum commodo quam, eget egestas leo sapien eu elit. Nulla luctus enim eget elit auctor facilisis. Suspendisse luctus ornare est, a egestas nunc pulvinar vitae. Proin tellus mi, dictum quis ligula id, viverra mollis nisl. Curabitur sollicitudin aliquam dolor, ut vulputate sapien. Sed sit amet neque erat.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Donec semper purus arcu, eget blandit erat tincidunt nec. Pellentesque ornare, tellus ut rutrum mattis, elit nisl hendrerit lorem, quis interdum orci urna nec sapien. Aliquam rutrum nunc id nisl blandit fringilla. Cras scelerisque eget augue in blandit. Integer elementum vulputate ante ac vestibulum. Nunc vitae justo sit amet neque fringilla ullamcorper vitae in leo. Pellentesque tempor laoreet pellentesque. Nunc eget cursus leo, vitae condimentum eros.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nullam ultricies nisi ut diam tincidunt rhoncus. Nulla commodo quam velit, nec iaculis nisl luctus a. Fusce et ullamcorper augue, eu tristique justo. Nullam ultrices orci ante, in malesuada nisl rutrum sit amet. Integer eleifend non orci at elementum. Aenean pretium bibendum purus, pulvinar mattis neque varius sit amet. Phasellus pharetra elit ac molestie imperdiet. Maecenas et enim nibh. Fusce vitae ultricies massa. Suspendisse potenti. Vestibulum ultricies sem nec felis faucibus egestas sed eu enim. Aliquam ornare dapibus ipsum, in pretium ligula ornare a.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nunc nec ullamcorper risus. Phasellus iaculis augue justo, egestas molestie nulla suscipit vel. Vestibulum mattis ipsum ultrices, posuere erat eget, elementum lorem. Nulla id nisi ultrices, hendrerit tellus et, rutrum nunc. Suspendisse potenti. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam feugiat lorem sit amet velit viverra, euismod pellentesque nisi bibendum. Phasellus semper libero lacus, eu posuere nibh semper ut. Suspendisse potenti. Curabitur blandit ac ligula ut sodales. Mauris hendrerit dolor eu lacus eleifend, eget aliquam justo adipiscing.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Donec urna ligula, ullamcorper in dictum et, congue in enim. Maecenas quis interdum elit. Cras eleifend malesuada augue sed lacinia. Maecenas congue ultrices massa at fermentum. Ut eu malesuada arcu. Vivamus convallis consectetur lorem, ac pulvinar ligula venenatis quis. Nulla iaculis semper sem in adipiscing. Duis ultricies orci eu tincidunt iaculis. Praesent aliquet sollicitudin adipiscing. Quisque libero odio, egestas vitae felis non, pulvinar eleifend lectus. Maecenas ac malesuada nisl, vitae mollis augue. Sed at mollis libero. Maecenas pharetra mi eu tortor placerat, vitae consectetur risus dictum. Pellentesque id cursus massa.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sed sit amet erat eu libero lobortis dignissim vitae quis leo. Duis orci neque, gravida sit amet mi eget, auctor lobortis turpis. Quisque sit amet malesuada nulla. Sed accumsan, arcu ut interdum vestibulum, est dui dignissim est, vel laoreet libero urna a lacus. Integer vitae porttitor quam, vitae sagittis quam. Vivamus hendrerit tellus felis, quis dignissim sapien laoreet sed. Donec id nulla sed mi convallis pellentesque eget sed tellus. Ut eu viverra orci. Integer euismod eros quis neque aliquet vehicula. Maecenas tempor at velit in accumsan. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mauris ullamcorper tortor vel eros molestie feugiat. Vestibulum interdum mauris est, ac scelerisque dui viverra eu. Aliquam neque diam, dictum a eros ut, pretium faucibus nunc. In luctus mi augue, at consequat felis cursus quis. Etiam nec pharetra tortor, id tempor velit. In dapibus erat turpis, vel interdum lacus hendrerit a. Sed odio mauris, aliquam id consectetur at, commodo tincidunt augue.</p>
')
INSERT [dbo].[News] ([ID], [Caption], [ThumbnailURL], [PostedDate], [UserID], [Category], [Status], [ContentReview], [Content]) VALUES (63, N'asdas', N'/Uploads/images/Koala.jpg', CAST(N'2017-11-29 22:22:12.000' AS DateTime), 1, 0, 1, N'dasdasd', N'<p>asdsadsada</p>
')
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[RoleManager] ON 

INSERT [dbo].[RoleManager] ([ID], [AccountId], [Addition], [Edit], [Delete], [View], [CanActive], [ModuleId], [Status]) VALUES (1, 1, 1, 1, 1, 1, 1, 3, 1)
INSERT [dbo].[RoleManager] ([ID], [AccountId], [Addition], [Edit], [Delete], [View], [CanActive], [ModuleId], [Status]) VALUES (2, 1, 1, 1, 1, 1, 1, 2, 1)
INSERT [dbo].[RoleManager] ([ID], [AccountId], [Addition], [Edit], [Delete], [View], [CanActive], [ModuleId], [Status]) VALUES (3, 1, 1, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[RoleManager] ([ID], [AccountId], [Addition], [Edit], [Delete], [View], [CanActive], [ModuleId], [Status]) VALUES (4, 1, 1, 1, 1, 1, 1, 0, 1)
SET IDENTITY_INSERT [dbo].[RoleManager] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Name], [NameENG], [Title], [TitleENG], [ImageURL], [ThumbnailURL], [Caption], [CaptionENG], [Introduction], [Procedure], [DocumentArrayID], [CategoryID], [HasChild], [ServiceID], [Status], [CreateTime], [LastMordifiedTime], [ViewCounter], [UserID]) VALUES (3, N'Name 0', NULL, N'Title 0', NULL, NULL, N'/Images/ne.jpg', N'caption 0', NULL, NULL, NULL, NULL, 1, 1, 0, 1, CAST(N'2017-10-30 21:04:51.500' AS DateTime), NULL, 0, 1)
INSERT [dbo].[Service] ([ID], [Name], [NameENG], [Title], [TitleENG], [ImageURL], [ThumbnailURL], [Caption], [CaptionENG], [Introduction], [Procedure], [DocumentArrayID], [CategoryID], [HasChild], [ServiceID], [Status], [CreateTime], [LastMordifiedTime], [ViewCounter], [UserID]) VALUES (4, N'Name 1', NULL, N'Name 1', NULL, NULL, N'/Images/ne.jpg', N'Name 1', NULL, NULL, N'<p>nội dung mới</p>
', NULL, 1, 0, 3, 1, CAST(N'2017-10-30 21:04:51.763' AS DateTime), CAST(N'2017-11-26 10:34:07.937' AS DateTime), 0, 1)
INSERT [dbo].[Service] ([ID], [Name], [NameENG], [Title], [TitleENG], [ImageURL], [ThumbnailURL], [Caption], [CaptionENG], [Introduction], [Procedure], [DocumentArrayID], [CategoryID], [HasChild], [ServiceID], [Status], [CreateTime], [LastMordifiedTime], [ViewCounter], [UserID]) VALUES (5, N'Name 2', NULL, N'Title 2', NULL, NULL, N'/Images/ne.jpg', N'caption 2', NULL, NULL, NULL, NULL, 1, 0, 3, 1, CAST(N'2017-10-30 21:04:51.770' AS DateTime), NULL, 0, 1)
INSERT [dbo].[Service] ([ID], [Name], [NameENG], [Title], [TitleENG], [ImageURL], [ThumbnailURL], [Caption], [CaptionENG], [Introduction], [Procedure], [DocumentArrayID], [CategoryID], [HasChild], [ServiceID], [Status], [CreateTime], [LastMordifiedTime], [ViewCounter], [UserID]) VALUES (6, N'Name 3', NULL, N'Title 3', NULL, NULL, N'/Images/ne.jpg', N'caption 3', NULL, NULL, NULL, NULL, 1, 0, 3, 1, CAST(N'2017-10-30 21:04:51.790' AS DateTime), NULL, 0, 1)
INSERT [dbo].[Service] ([ID], [Name], [NameENG], [Title], [TitleENG], [ImageURL], [ThumbnailURL], [Caption], [CaptionENG], [Introduction], [Procedure], [DocumentArrayID], [CategoryID], [HasChild], [ServiceID], [Status], [CreateTime], [LastMordifiedTime], [ViewCounter], [UserID]) VALUES (7, N'Name 4', NULL, N'Title 4', NULL, NULL, N'/Images/ne.jpg', N'caption 4', NULL, NULL, NULL, NULL, 1, 0, 3, 1, CAST(N'2017-10-30 21:04:51.790' AS DateTime), NULL, 0, 1)
INSERT [dbo].[Service] ([ID], [Name], [NameENG], [Title], [TitleENG], [ImageURL], [ThumbnailURL], [Caption], [CaptionENG], [Introduction], [Procedure], [DocumentArrayID], [CategoryID], [HasChild], [ServiceID], [Status], [CreateTime], [LastMordifiedTime], [ViewCounter], [UserID]) VALUES (12, N'Name 9', NULL, N'Title 9', NULL, NULL, N'/Images/ne.jpg', N'caption 9', NULL, NULL, NULL, NULL, 1, 1, 0, 1, CAST(N'2017-10-30 21:04:51.800' AS DateTime), NULL, 0, 1)
INSERT [dbo].[Service] ([ID], [Name], [NameENG], [Title], [TitleENG], [ImageURL], [ThumbnailURL], [Caption], [CaptionENG], [Introduction], [Procedure], [DocumentArrayID], [CategoryID], [HasChild], [ServiceID], [Status], [CreateTime], [LastMordifiedTime], [ViewCounter], [UserID]) VALUES (13, N'Name 10', NULL, N'Title 10', NULL, NULL, N'/Images/ne.jpg', N'caption 10', NULL, NULL, NULL, NULL, 1, 0, 12, 1, CAST(N'2017-10-30 21:04:51.803' AS DateTime), NULL, 0, 1)
INSERT [dbo].[Service] ([ID], [Name], [NameENG], [Title], [TitleENG], [ImageURL], [ThumbnailURL], [Caption], [CaptionENG], [Introduction], [Procedure], [DocumentArrayID], [CategoryID], [HasChild], [ServiceID], [Status], [CreateTime], [LastMordifiedTime], [ViewCounter], [UserID]) VALUES (14, N'Name 11', NULL, N'Title 11', NULL, NULL, N'/Images/ne.jpg', N'caption 11', NULL, NULL, NULL, NULL, 1, 0, 12, 1, CAST(N'2017-10-30 21:04:51.807' AS DateTime), NULL, 0, 1)
INSERT [dbo].[Service] ([ID], [Name], [NameENG], [Title], [TitleENG], [ImageURL], [ThumbnailURL], [Caption], [CaptionENG], [Introduction], [Procedure], [DocumentArrayID], [CategoryID], [HasChild], [ServiceID], [Status], [CreateTime], [LastMordifiedTime], [ViewCounter], [UserID]) VALUES (15, N'Name 12', NULL, N'Title 12', NULL, NULL, N'/Images/ne.jpg', N'caption 12', NULL, NULL, NULL, NULL, 1, 0, 12, 1, CAST(N'2017-10-30 21:04:51.807' AS DateTime), NULL, 0, 1)
INSERT [dbo].[Service] ([ID], [Name], [NameENG], [Title], [TitleENG], [ImageURL], [ThumbnailURL], [Caption], [CaptionENG], [Introduction], [Procedure], [DocumentArrayID], [CategoryID], [HasChild], [ServiceID], [Status], [CreateTime], [LastMordifiedTime], [ViewCounter], [UserID]) VALUES (16, N'Name 13', NULL, N'Title 13', NULL, NULL, N'/Images/ne.jpg', N'caption 13', NULL, NULL, NULL, NULL, 1, 0, 12, 1, CAST(N'2017-10-30 21:04:51.807' AS DateTime), NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[SystemConfig] ON 

INSERT [dbo].[SystemConfig] ([ID], [Name], [NameENG], [Address], [Tel], [Fax], [Hotline], [Email], [Website], [Category], [Status], [Content], [ContentENG], [Caption], [Description], [ImageURL]) VALUES (1, N'CÔNG TY CỔ PHẦN CHỨNG NHẬN QUỐC TẾ', N'dsaa á', N'Thượng Cốc - Phúc Thọ - Hà Nội', N'01635805335', NULL, N'012364569875', N'khanhngdinh@gmail.com', N'chungnhanquocte.vn', 0, 1, NULL, NULL, NULL, NULL, N'/Uploads/files/icblogo.png')
INSERT [dbo].[SystemConfig] ([ID], [Name], [NameENG], [Address], [Tel], [Fax], [Hotline], [Email], [Website], [Category], [Status], [Content], [ContentENG], [Caption], [Description], [ImageURL]) VALUES (8, N'/Uploads/files/banner-1.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SystemConfig] ([ID], [Name], [NameENG], [Address], [Tel], [Fax], [Hotline], [Email], [Website], [Category], [Status], [Content], [ContentENG], [Caption], [Description], [ImageURL]) VALUES (11, N'https://cdn.flipsnack.com/widget/v2/widget.html?hash=fhk8y3nu&forcewm=1&forceWidget=1&forceSmall=1&rmm=1&novignette=1&t=1370335360', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, NULL, N'Hồ sơ năng lực - Công ty cổ phần chứng nhận quốc tế(ICB)', N'<p>- Đ&agrave;o tạo, Đ&aacute;nh gi&aacute;, Chứng nhận c&aacute;c Hệ thống quản l&yacute; theo ti&ecirc;u chuẩn Quốc tế : ISO 9000, ISO 14000, ISO 22000, HACCP, SA 8000, WRAP, OHSAS 18000 . . .</p>

<p>- Đ&aacute;nh gi&aacute; chứng nhận chất lượng sản phẩm, tư vấn c&ocirc;ng bố Hợp chuẩn, Hợp quy chất lượng sản phẩm, điều kiện sản xuất - Đ&aacute;nh gi&aacute; Nh&agrave; cung ứng , Nh&agrave; thầu phụ theo y&ecirc;u cầu của Tổ chức</p>
', NULL)
INSERT [dbo].[SystemConfig] ([ID], [Name], [NameENG], [Address], [Tel], [Fax], [Hotline], [Email], [Website], [Category], [Status], [Content], [ContentENG], [Caption], [Description], [ImageURL]) VALUES (12, N'Giới thiệu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, N'<p>Tổ chức chứng nhận quốc tế ICB được th&agrave;nh lập v&agrave;o năm 2011, l&agrave; tổ chức chứng nhận độc lập. ICB tiến h&agrave;nh c&aacute;c hoạt động chứng nhận c&aacute;c sản phẩm, h&agrave;ng h&oacute;a, dịch vụ v&agrave; qu&aacute; tr&igrave;nh ph&ugrave; hợp theo c&aacute;c ti&ecirc;u chuẩn v&agrave; quy chuẩn của ICB tu&acirc;n theo Th&ocirc;ng lệ quốc tế, Luật chất lượng sản phẩm h&agrave;ng h&oacute;a, Luật ti&ecirc;u chuẩn v&agrave; quy chuẩn kỹ thuật.</p>

<p>+ ICB được Cục An to&agrave;n Lao động &ndash; Bộ Lao động &ndash; Thương binh v&agrave; X&atilde; hội tin tưởng chỉ định l&agrave; tổ chức đ&aacute;nh gi&aacute; hợp quy c&aacute;c sản phẩm h&agrave;ng h&oacute;a nh&oacute;m 2 do BLĐTBXH quản l&yacute; (chi tiết xem danh mục đ&iacute;nh k&egrave;m)</p>

<p>+ ICB đ&atilde; được Tổng Cục Ti&ecirc;u Chuẩn Đo Lường Chất Lượng của Bộ Khoa Học C&ocirc;ng Nghệ c&ocirc;ng nhận đủ năng lực tiến h&agrave;nh hoạt động chứng nhận sản phẩm tại Việt Nam.</p>

<p>+ ICB cũng đ&atilde; được Tổ Chức C&ocirc;ng Nhận Chất Lượng (BoA), Diễn Đ&agrave;n C&aacute;c Tổ Chức C&ocirc;ng Nhận Quốc Tế (IAF) c&ocirc;ng nhận đủ năng lực tiến h&agrave;nh hoạt động chứng nhận tr&ecirc;n to&agrave;n thế giới.</p>

<p>&nbsp;</p>

<p>+ ICB : Tập hợp c&aacute;c chuy&ecirc;n gia h&agrave;ng đầu về quản l&yacute;;</p>

<p>+ ICB : Tập hợp c&aacute;c chuy&ecirc;n gia kỹ thuật trong từng lĩnh vực chuy&ecirc;n biệt:</p>
', NULL, NULL, NULL, NULL)
INSERT [dbo].[SystemConfig] ([ID], [Name], [NameENG], [Address], [Tel], [Fax], [Hotline], [Email], [Website], [Category], [Status], [Content], [ContentENG], [Caption], [Description], [ImageURL]) VALUES (13, N'/Uploads/files/banner-3.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SystemConfig] OFF
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_Account] FOREIGN KEY([UserIDCreated])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Account]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Account] FOREIGN KEY([UserID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Account]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Account] FOREIGN KEY([UserID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Account]
GO
ALTER TABLE [dbo].[RoleManager]  WITH CHECK ADD  CONSTRAINT [FK_RoleManager_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[RoleManager] CHECK CONSTRAINT [FK_RoleManager_Account]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Account] FOREIGN KEY([UserID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Account]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Category]
GO
