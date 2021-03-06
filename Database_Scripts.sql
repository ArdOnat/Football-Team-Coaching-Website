USE [FootballSiteManagement]
GO
/****** Object:  StoredProcedure [dbo].[buyPlayer]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[buyPlayer] @playerID int,@Team int
as
	select Footballers_ID,Testimonial from tbl_Footballers where Footballers_ID=@playerID AND Team != @Team

GO
/****** Object:  StoredProcedure [dbo].[checkregister]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[checkregister] @username nvarchar(50)
as 
SELECT * FROM [FootballSiteManagement].[dbo].[tbl_User] WHERE User_Name = @username

GO
/****** Object:  StoredProcedure [dbo].[displayFixture]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[displayFixture] @League int
as
	select * from tbl_Match left join tbl_Teams on tbl_Match.Home_Team=tbl_Teams.Team_ID  where tbl_Match.League=@League

GO
/****** Object:  StoredProcedure [dbo].[displayTeams]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[displayTeams]
as
	select * from tbl_Teams LEFT JOIN tbl_League on tbl_Teams.League=tbl_League.League_ID

GO
/****** Object:  StoredProcedure [dbo].[findTransferBudget]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[findTransferBudget] @Team int
as
	select Transfer_Budget from tbl_Teams where Team_ID=@Team

GO
/****** Object:  StoredProcedure [dbo].[getPlayersPastTeam]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getPlayersPastTeam] @playerID int
as
	select Team from tbl_Footballers where Footballers_ID=@playerID

GO
/****** Object:  StoredProcedure [dbo].[listLeagues]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[listLeagues]
as
       select * from tbl_League

GO
/****** Object:  StoredProcedure [dbo].[listnotchoosenteams]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[listnotchoosenteams] 
as
select * from [showNotSelectedTeams]

GO
/****** Object:  StoredProcedure [dbo].[listTeam]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listTeam] @Team int
as
      select * from tbl_Footballers left join tbl_Teams on tbl_Footballers.Team=tbl_Teams.Team_ID where Team=@Team

GO
/****** Object:  StoredProcedure [dbo].[login]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[login] @username nvarchar(50),@password nvarchar(50)
as 
SELECT * FROM tbl_User WHERE User_Name = @username AND Password =@password

GO
/****** Object:  StoredProcedure [dbo].[register]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[register] @username nvarchar(50),@password nvarchar(50),@age int,@birthdate date,@email nvarchar(50),@team int,@userid int
as
	insert into tbl_User values(@userid,@username,@password,@age,@birthdate,@email,@team);

GO
/****** Object:  StoredProcedure [dbo].[returnUserInfos]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[returnUserInfos] @Team int
as
 select * from tbl_Teams left join tbl_League on tbl_Teams.League=tbl_League.League_ID where Team_ID=@Team

GO
/****** Object:  StoredProcedure [dbo].[returnuserid]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[returnuserid]
as
	select UserID from [FootballSiteManagement].[dbo].[tbl_User] ORDER BY UserID DESC 

GO
/****** Object:  StoredProcedure [dbo].[searchplayer]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[searchplayer] @playername nvarchar(50),@playersurname nvarchar(50),@playerage int,@position nvarchar(50)
as 
SELECT Footballers_ID,Footballers_Name,Footballers_Surname,Age,Position,Team_Name,Testimonial,transferlist FROM [FootballSiteManagement].[dbo].[tbl_Footballers] LEFT JOIN tbl_Teams on tbl_Footballers.Team=tbl_Teams.Team_ID WHERE Footballers_Name = @playername OR Footballers_Surname =@playersurname OR Age =@playerage OR Position=@position

GO
/****** Object:  StoredProcedure [dbo].[searchTransferablePlayers]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[searchTransferablePlayers]
as
	select Footballers_ID,Footballers_Name,Footballers_Surname,Age,Position,Team,Testimonial,transferlist from tbl_Footballers where transferlist=1

GO
/****** Object:  StoredProcedure [dbo].[sellPlayer]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sellPlayer] @playerID int
as
	update tbl_Footballers set transferlist=1 where Footballers_ID=@playerID

GO
/****** Object:  StoredProcedure [dbo].[transferPlayer]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[transferPlayer] @playerID int,@Team int
as
	update tbl_Footballers set Team=@Team,transferlist=0 where Footballers_ID=@playerID

GO
/****** Object:  StoredProcedure [dbo].[updateTransferBudget]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[updateTransferBudget] @Team int,@kalan Money
as
	update tbl_Teams set Transfer_Budget=@kalan where  Team_ID=@Team

GO
/****** Object:  Table [dbo].[tbl_Coach]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Coach](
	[Coach_ID] [int] NOT NULL,
	[Coach_Name] [nvarchar](50) NOT NULL,
	[Coach_Surname] [nvarchar](50) NOT NULL,
	[Coach_Age] [int] NULL,
	[Salary] [money] NULL,
	[Team] [int] NULL,
 CONSTRAINT [PK_tbl_Coach] PRIMARY KEY CLUSTERED 
(
	[Coach_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Footballers]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Footballers](
	[Footballers_ID] [int] NOT NULL,
	[Footballers_Name] [nvarchar](50) NOT NULL,
	[Footballers_Surname] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Salary] [money] NULL,
	[Country] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Dominant_Foot] [nvarchar](50) NULL,
	[Goal_Number] [int] NULL,
	[Testimonial] [money] NULL,
	[Team] [int] NULL,
	[transferlist] [int] NULL,
 CONSTRAINT [PK_tbl_Footballers] PRIMARY KEY CLUSTERED 
(
	[Footballers_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_League]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_League](
	[League_ID] [int] NOT NULL,
	[League_Name] [nvarchar](50) NOT NULL,
	[Foundation_Year] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Sponsor] [nvarchar](50) NULL,
	[President] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_League] PRIMARY KEY CLUSTERED 
(
	[League_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Match]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Match](
	[Match_ID] [int] NOT NULL,
	[Match_Date] [date] NOT NULL,
	[Home_Team] [int] NOT NULL,
	[Away_Team] [int] NOT NULL,
	[Referee] [int] NOT NULL,
	[Stadium] [int] NULL,
	[League] [int] NULL,
 CONSTRAINT [PK_tbl_Match] PRIMARY KEY CLUSTERED 
(
	[Match_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Referee]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Referee](
	[Referee_ID] [int] NOT NULL,
	[Referee_Name] [nvarchar](50) NOT NULL,
	[Referee_Surname] [nvarchar](50) NOT NULL,
	[Age] [int] NULL,
	[Salary] [money] NULL,
 CONSTRAINT [PK_tbl_Referee] PRIMARY KEY CLUSTERED 
(
	[Referee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Stadium]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Stadium](
	[Stadium_ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Capacity] [int] NULL,
	[Owner_Team] [int] NULL,
	[City] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Stadium] PRIMARY KEY CLUSTERED 
(
	[Stadium_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Teams]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Teams](
	[Team_ID] [int] NOT NULL,
	[Team_Name] [nvarchar](50) NOT NULL,
	[Foundation_Year] [nvarchar](50) NULL,
	[City] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Transfer_Budget] [money] NOT NULL,
	[Monthly_Exponse] [money] NULL,
	[Championship_Number] [int] NOT NULL,
	[President] [nvarchar](50) NOT NULL,
	[Colour1] [nvarchar](50) NOT NULL,
	[Colour2] [nvarchar](50) NOT NULL,
	[League] [int] NOT NULL,
	[Selected] [int] NULL,
	[Stadium] [int] NULL,
 CONSTRAINT [PK_tbl_Teams] PRIMARY KEY CLUSTERED 
(
	[Team_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[UserID] [int] NOT NULL,
	[User_Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Age] [int] NULL,
	[BirthDate] [date] NULL,
	[EMail] [nvarchar](50) NOT NULL,
	[Team] [int] NOT NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[showNotSelectedTeams]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[showNotSelectedTeams] as
select Team_ID,Team_Name,tbl_Teams.Foundation_Year,tbl_Teams.Country,Transfer_Budget,League_Name 
from tbl_Teams left join tbl_League on tbl_Teams.League=tbl_League.League_ID where Selected=0
GO
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (1, N'FERNANDO', N'MUSLERA', 31, 3750000.0000, N'URUGUAY', CAST(0xB4100B00 AS Date), N'KALECİ', N'R', 0, 11000000.0000, 1, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (2, N'SERDAR', N'AZİZ', 27, 2000000.0000, N'TÜRKİYE', CAST(0xEA160B00 AS Date), N'DEFANS', N'R', 3, 4000000.0000, 1, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (3, N'MAICON', N'ROQUE', 29, 3500000.0000, N'BREZİLYA', CAST(0xE9130B00 AS Date), N'DEFANS', N'R', 4, 20000000.0000, 1, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (4, N'MARIANO', N'FERERIA', 31, 2800000.0000, N'BREZİLYA', CAST(0xBB100B00 AS Date), N'DEFANS', N'R', 1, 6000000.0000, 1, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (5, N'MARTİN', N'LİNNES', 26, 1400000.0000, N'NORVEÇ', CAST(0x36180B00 AS Date), N'DEFANS', N'R', 0, 5000000.0000, 1, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (6, N'SELÇUK', N'İNAN', 32, 2850000.0000, N'TÜRKİYE', CAST(0xC90E0B00 AS Date), N'ORTA SAHA', N'R', 0, 4000000.0000, 1, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (7, N'SOFIANE', N'FEGHOULİ', 27, 3600000.0000, N'CEZAYİR', CAST(0xBD150B00 AS Date), N'ORTA SAHA', N'R', 2, 9000000.0000, 1, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (8, N'GARRY', N'RODRIUGES', 26, 2250000.0000, N'YEŞİL BURUN ADALARI', CAST(0x0D170B00 AS Date), N'ORTA SAHA', N'R', 3, 7000000.0000, 1, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (9, N'YOUNES', N'BELHANDA', 27, 3350000.0000, N'FAS', CAST(0xFA150B00 AS Date), N'ORTA SAHA', N'R', 1, 12000000.0000, 1, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (10, N'BAFETİMBİ', N'GOMİS', 32, 3480000.0000, N'FRANSA', CAST(0x7A0F0B00 AS Date), N'FORVET', N'R', 11, 9000000.0000, 1, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (11, N'VOLKAN', N'DEMİREL', 36, 2250000.0000, N'TÜRKİYE', CAST(0x170A0B00 AS Date), N'KALECİ', N'R', 0, 2500000.0000, 2, 1)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (12, N'MAURİCİO', N'İSLA', 29, 1400000.0000, N'ŞİLİ', CAST(0x8B130B00 AS Date), N'DEFANS', N'R', 1, 3000000.0000, 2, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (13, N'ROMAN', N'NEUSTADTER', 29, 2400000.0000, N'RUSYA', CAST(0x18130B00 AS Date), N'DEFANS', N'L', 1, 3000000.0000, 2, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (14, N'MARTİN', N'SKRTEL', 32, 3120000.0000, N'SLOVAKYA', CAST(0x900E0B00 AS Date), N'DEFANS', N'R', 0, 6000000.0000, 1, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (15, N'MEHMET', N'TOPAL', 31, 2900000.0000, N'TÜRKİYE', CAST(0x4B100B00 AS Date), N'ORTA SAHA', N'R', 1, 4000000.0000, 2, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (16, N'MEHMET', N'EKİCİ', 27, 2000000.0000, N'TÜRKİYE', CAST(0x16160B00 AS Date), N'ORTA SAHA', N'R', 1, 5500000.0000, 2, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (17, N'JOSEF', N'SOUZA', 28, 3200000.0000, N'BREZİLYA', CAST(0x7F140B00 AS Date), N'ORTA SAHA', N'R', 2, 9000000.0000, 2, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (18, N'MATHİEU', N'VALBUENA', 33, 3000000.0000, N'FRANSA', CAST(0x420E0B00 AS Date), N'ORTA SAHA', N'R', 4, 11000000.0000, 2, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (19, N'ROBERTO', N'SOLDADO', 32, 4000000.0000, N'İSPANYA', CAST(0x330F0B00 AS Date), N'FORVET', N'L', 3, 7000000.0000, 2, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (20, N'ROBİN VAN', N'PERSİE', 34, 5000000.0000, N'HOLLANDA', CAST(0x9F0C0B00 AS Date), N'FORVET', N'L', 0, 6000000.0000, 2, 1)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (21, N'FABRİCİO ', N'RAMİREZ', 29, 2300000.0000, N'İSPANYA', CAST(0xE7120B00 AS Date), N'KALECİ', N'R', 0, 4500000.0000, 3, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (22, N'ADRİANO', N'CORREİA', 33, 1800000.0000, N'BREZİLYA', CAST(0x5E0E0B00 AS Date), N'DEFANS', N'L', 1, 3000000.0000, 3, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (23, N'KEPLER', N'PEPE', 34, 6000000.0000, N'PORTEKİZ', CAST(0xFE0B0B00 AS Date), N'DEFANS', N'R', 1, 10000000.0000, 3, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (24, N'DUSKO', N'TOSİC', 32, 2200000.0000, N'SIRBİSTAN', CAST(0xB30E0B00 AS Date), N'DEFANS', N'L', 1, 3000000.0000, 3, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (25, N'GÖKHAN', N'GÖNÜL', 32, 1700000.0000, N'TÜRKİYE', CAST(0xA40E0B00 AS Date), N'DEFANS', N'R', 1, 2500000.0000, 3, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (26, N'ATİBA', N'HUTCHİNSON', 34, 1200000.0000, N'KANADA', CAST(0xEC0B0B00 AS Date), N'ORTA SAHA', N'R', 0, 3000000.0000, 3, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (27, N'OĞUZHAN', N'ÖZYAKUP', 25, 1300000.0000, N'TÜRKİYE', CAST(0xA7190B00 AS Date), N'ORTA SAHA', N'R', 1, 11000000.0000, 3, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (28, N'RİCARDO', N'QUARESMA', 34, 4000000.0000, N'PORTEKİZ', CAST(0xD20C0B00 AS Date), N'ORTA SAHA', N'R', 3, 9000000.0000, 3, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (29, N'ANDERSON', N'TALİSCA', 23, 2400000.0000, N'BREZİLYA', CAST(0x971B0B00 AS Date), N'ORTA SAHA', N'L', 6, 20000000.0000, 3, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (30, N'CENK', N'TOSUN', 26, 2300000.0000, N'TÜRKİYE', CAST(0xCD170B00 AS Date), N'FORVET', N'R', 9, 15000000.0000, 3, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (31, N'SASO', N'FORNEZZİ', 34, 420000.0000, N'SLOVENYA', CAST(0xB10B0B00 AS Date), N'KALECİ', N'L', 0, 2000000.0000, 4, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (32, N'ONDREJ', N'CELUSTKA', 28, 650000.0000, N'ÇEK CUMHURİYETİ', CAST(0xFE140B00 AS Date), N'DEFANS', N'R', 1, 2000000.0000, 4, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (33, N'DİEGO', N'ANGELO', 31, 1100000.0000, N'BREZİLYA', CAST(0x3D100B00 AS Date), N'DEFANS', N'L', 1, 2500000.0000, 4, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (34, N'JOHAN', N'DJOUROU', 30, 2400000.0000, N'FİLDİŞİ SAHİLLERİ', CAST(0x8C110B00 AS Date), N'DEFANS', N'R', 0, 4000000.0000, 4, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (35, N'SAKIB', N'AYTAÇ', 25, 1000000.0000, N'TÜRKİYE', CAST(0x77180B00 AS Date), N'DEFANS', N'L', 1, 3000000.0000, 4, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (36, N'CHARLES DA ', N'SİLVA', 32, 1500000.0000, N'BREZİLYA', CAST(0xCD0E0B00 AS Date), N'ORTA SAHA', N'R', 1, 2750000.0000, 4, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (37, N'MAİCON', N'MARQUES', 27, 2250000.0000, N'BREZİLYA', CAST(0xF3150B00 AS Date), N'ORTA SAHA', N'R', 2, 4500000.0000, 4, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (38, N'DENİZ', N'KADAH', 31, 2250000.0000, N'TÜRKİYE', CAST(0x4A100B00 AS Date), N'ORTA SAHA', N'R', 4, 3500000.0000, 4, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (39, N'SAMİR', N'NASRİ', 30, 6500000.0000, N'FRANSA', CAST(0x2B120B00 AS Date), N'ORTA SAHA', N'R', 3, 16000000.0000, 4, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (40, N'SAMUEL', N'ETO''O', 36, 6000000.0000, N'KAMERUN', CAST(0x30090B00 AS Date), N'FORVET', N'R', 5, 7500000.0000, 4, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (41, N'ONUR', N'KIVRAK', 29, 2750000.0000, N'TÜRKİYE', CAST(0xE8120B00 AS Date), N'KALECİ', N'R', 0, 5000000.0000, 5, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (42, N'UĞUR', N'DEMİROK', 29, 2000000.0000, N'TÜRKİYE', CAST(0xA5130B00 AS Date), N'DEFANS', N'R', 2, 3500000.0000, 5, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (43, N'EMMANUEL', N'MAS', 28, 3500000.0000, N'ARJANTİN', CAST(0x64140B00 AS Date), N'DEFANS', N'R', 1, 4000000.0000, 5, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (44, N'JAN', N'DURİCA', 36, 1500000.0000, N'SLOVAKYA', CAST(0x430A0B00 AS Date), N'DEFANS', N'L', 3, 2200000.0000, 5, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (45, N'MUSTAFA', N'AKBAŞ', 27, 500000.0000, N'TÜRKİYE', CAST(0x58160B00 AS Date), N'DEFANS', N'L', 0, 1200000.0000, 5, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (46, N'JOSE', N'SOSA', 32, 3000000.0000, N'ARJANTİN', CAST(0x4A0F0B00 AS Date), N'ORTA SAHA', N'R', 2, 5000000.0000, 5, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (47, N'YUSUF', N'YAZICI', 20, 1000000.0000, N'TÜRKİYE', CAST(0xDC1F0B00 AS Date), N'ORTA SAHA', N'L', 5, 10000000.0000, 5, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (48, N'OLCAY', N'ŞAHAN', 30, 1000000.0000, N'TÜRKİYE', CAST(0x0C120B00 AS Date), N'ORTA SAHA', N'R', 4, 2500000.0000, 5, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (49, N'BURAK', N'YILMAZ', 32, 3500000.0000, N'TÜRKİYE', CAST(0x640F0B00 AS Date), N'FORVET', N'R', 12, 8000000.0000, 5, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (50, N'HUGO', N'RODALLEGA', 32, 4500000.0000, N'KOLOMBİYA', CAST(0x6E0F0B00 AS Date), N'FORVET', N'R', 2, 7500000.0000, 5, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (51, N'VOLKAN', N'BABACAN', 29, 3000000.0000, N'TÜRKİYE', CAST(0xC7130B00 AS Date), N'KALECİ', N'R', 0, 5000000.0000, 6, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (52, N'GAEL', N'CLİCHY', 32, 3350000.0000, N'FRANSA', CAST(0x6F0F0B00 AS Date), N'DEFANS', N'L', 1, 7500000.0000, 6, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (53, N'JUNİOR', N'CAİÇARA', 28, 2000000.0000, N'BREZİLYA', CAST(0xCA140B00 AS Date), N'DEFANS', N'R', 1, 3000000.0000, 6, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (54, N'ALEXANDRU', N'EPUREANU', 31, 1500000.0000, N'MOLDOVA', CAST(0x1B110B00 AS Date), N'DEFANS', N'R', 1, 2200000.0000, 6, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (55, N'KERİM', N'FREİ', 24, 1100000.0000, N'TÜRKİYE', CAST(0x4D1B0B00 AS Date), N'ORTA SAHA', N'R', 4, 3500000.0000, 6, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (56, N'EDİN', N'VİSCA', 27, 2750000.0000, N'BOSNA HERSEK', CAST(0xF2150B00 AS Date), N'ORTA SAHA', N'R', 5, 4500000.0000, 6, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (57, N'EMRE', N'BELÖZOĞLU', 37, 1200000.0000, N'TÜRKİYE', CAST(0x78080B00 AS Date), N'ORTA SAHA', N'L', 2, 2250000.0000, 6, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (58, N'YUSUF', N'ASLAN', 21, 500000.0000, N'TÜRKİYE', CAST(0x291F0B00 AS Date), N'ORTA SAHA', N'R', 2, 2500000.0000, 6, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (59, N'ELJERO', N'ELİA', 30, 1200000.0000, N'HOLLANDA', CAST(0xA6110B00 AS Date), N'ORTA SAHA', N'R', 2, 4500000.0000, 6, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (60, N'EMMANUEL', N'ADEBAYOR', 33, 5850000.0000, N'TOGO', CAST(0x6B0D0B00 AS Date), N'FORVET', N'R', 7, 5000000.0000, 6, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (61, N'HARUN', N'TEKİN', 28, 1100000.0000, N'TÜRKİYE', CAST(0xFD140B00 AS Date), N'KALECİ', N'R', 0, 2500000.0000, 7, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (62, N'AZİZ', N'BEHİCH', 26, 1200000.0000, N'AVUSTRALYA', CAST(0x20170B00 AS Date), N'DEFANS', N'R', 1, 2750000.0000, 7, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (63, N'ERTUĞRUL', N'ERSOY', 20, 750000.0000, N'TÜRKİYE', CAST(0xEB1F0B00 AS Date), N'DEFANS', N'R', 0, 1250000.0000, 7, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (64, N'CRİSTİAN', N'TAROUCO', 29, 1250000.0000, N'BREZİLYA', CAST(0x2F130B00 AS Date), N'DEFANS', N'R', 1, 2500000.0000, 7, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (65, N'WİLLİAM', N'EKONG', 24, 1300000.0000, N'HOLLANDA', CAST(0xFE1A0B00 AS Date), N'DEFANS', N'R', 0, 2200000.0000, 7, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (66, N'PABLO', N'BATALLA', 33, 3000000.0000, N'ARJANTİN', CAST(0x420D0B00 AS Date), N'ORTA SAHA', N'R', 5, 7500000.0000, 7, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (67, N'JİRES', N'EKOKO', 29, 1300000.0000, N'DEMOKRATİK KONGO', CAST(0xEF120B00 AS Date), N'ORTA SAHA', N'R', 1, 2250000.0000, 7, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (68, N'RİCARDO', N'FATY', 31, 1200000.0000, N'SENEGAL', CAST(0xE5100B00 AS Date), N'ORTA SAHA', N'R', 0, 2250000.0000, 7, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (69, N'JOSHUA', N'JOHN', 29, 1100000.0000, N'HOLLANDA', CAST(0xFA130B00 AS Date), N'ORTA SAHA', N'R', 0, 2500000.0000, 7, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (70, N'DENİZ', N'YILMAZ', 29, 1250000.0000, N'AZERBAYCAN', CAST(0x20130B00 AS Date), N'FORVET', N'R', 2, 2500000.0000, 7, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (71, N'ALBERTO', N'BASTOS', 35, 519000.0000, N'PORTEKİZ', CAST(0xD10A0B00 AS Date), N'KALECİ', N'R', 0, 1500000.0000, 8, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (72, N'SABRİ', N'SARIOĞLU', 33, 1250000.0000, N'TÜRKİYE', CAST(0x020E0B00 AS Date), N'DEFANS', N'R', 2, 2250000.0000, 8, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (73, N'HAKAN', N'ÇİNEMRE', 23, 750000.0000, N'TÜRKİYE', CAST(0xA41B0B00 AS Date), N'DEFANS', N'R', 0, 1250000.0000, 8, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (74, N'ADAMA', N'TRAORE', 27, 1500000.0000, N'FİLDİŞİ SAHİLLERİ', CAST(0xE4150B00 AS Date), N'DEFANS', N'L', 1, 2250000.0000, 8, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (75, N'MATHİEU', N'PEYBERNES', 27, 1200000.0000, N'FRANSA', CAST(0xE8160B00 AS Date), N'DEFANS', N'R', 0, 2500000.0000, 8, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (76, N'SELÇUK', N'ŞAHİN', 36, 950000.0000, N'TÜRKİYE', CAST(0x0A090B00 AS Date), N'ORTA SAHA', N'R', 0, 1250000.0000, 8, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (77, N'ANDRE', N'CASTRO', 29, 643200.0000, N'PORTEKİZ', CAST(0x44130B00 AS Date), N'ORTA SAHA', N'R', 4, 2500000.0000, 8, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (78, N'EZEQUİL', N'SCARİONE', 32, 750000.0000, N'ARJANTİN', CAST(0x630F0B00 AS Date), N'ORTA SAHA', N'R', 4, 2500000.0000, 8, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (79, N'YOAN', N'GOUFFRAN', 31, 1020000.0000, N'FRANSA', CAST(0x9E100B00 AS Date), N'ORTA SAHA', N'R', 2, 4000000.0000, 8, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (80, N'ADİS', N'JAHOVİC', 30, 1500000.0000, N'MAKEDONYA', CAST(0xC7110B00 AS Date), N'FORVET', N'R', 13, 4000000.0000, 8, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (81, N'GİANLUİGİ', N'BUFFON', 39, 4000000.0000, N'İTALYA', CAST(0xBF040B00 AS Date), N'KALECİ', N'R', 0, 10000000.0000, 9, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (82, N'BENEDİKT', N'HÖWEDES', 29, 3500000.0000, N'ALMANYA', CAST(0x23130B00 AS Date), N'DEFANS', N'L', 1, 8000000.0000, 9, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (83, N'GİORGİO', N'CHİELLİNİ', 33, 3000000.0000, N'İTALYA', CAST(0x150E0B00 AS Date), N'DEFANS', N'L', 1, 12000000.0000, 9, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (84, N'ANDREA', N'BARZAGLİ', 36, 1700000.0000, N'İTALYA', CAST(0x6B090B00 AS Date), N'DEFANS', N'R', 0, 4500000.0000, 9, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (85, N'DOUGLAS', N'COSTA', 27, 4500000.0000, N'BREZİLYA', CAST(0xC3160B00 AS Date), N'ORTA SAHA', N'L', 4, 20000000.0000, 9, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (86, N'SAMİ', N'KHEDİRA', 30, 5000000.0000, N'ALMANYA', CAST(0xD8110B00 AS Date), N'ORTA SAHA', N'R', 1, 16000000.0000, 9, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (87, N'KWADWO', N'ASAMOAH', 29, 2300000.0000, N'GANA', CAST(0x3F140B00 AS Date), N'ORTA SAHA', N'L', 2, 8000000.0000, 9, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (88, N'MİRALEM', N'PJANİC', 27, 4500000.0000, N'BOSNA HERSEK', CAST(0x1E160B00 AS Date), N'ORTA SAHA', N'R', 4, 15000000.0000, 9, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (89, N'GONZALO', N'HİGUAİN', 30, 5500000.0000, N'ARJANTİN', CAST(0xD2120B00 AS Date), N'FORVET', N'R', 14, 92000000.0000, 9, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (90, N'PAULO', N'DYBALA', 24, 2200000.0000, N'ARJANTİN', CAST(0x491B0B00 AS Date), N'FORVET', N'L', 11, 60000000.0000, 9, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (91, N'GİANLUİGİ', N'DONNARUMMA', 18, 1800000.0000, N'İTALYA', CAST(0xD1220B00 AS Date), N'KALECİ', N'L', 0, 25000000.0000, 10, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (92, N'LEONARDO', N'BONUCCİ', 30, 1700000.0000, N'İTALYA', CAST(0xF3110B00 AS Date), N'DEFANS', N'R', 1, 10000000.0000, 10, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (93, N'ANDREA', N'CONTİ', 23, 1500000.0000, N'İTALYA', CAST(0xB41B0B00 AS Date), N'DEFANS', N'R', 0, 2500000.0000, 10, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (94, N'RİCARDO', N'RODRİGUEZ', 25, 2500000.0000, N'İSVİÇRE', CAST(0x8A190B00 AS Date), N'DEFANS', N'R', 0, 7000000.0000, 10, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (95, N'CRİSTİAN', N'ZAPATA', 31, 1500000.0000, N'KOLOMBİYA', CAST(0x1E110B00 AS Date), N'DEFANS', N'R', 0, 4000000.0000, 10, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (96, N'HAKAN', N'ÇALHANOĞLU', 23, 5000000.0000, N'TÜRKİYE', CAST(0x9E1B0B00 AS Date), N'ORTA SAHA', N'R', 4, 22500000.0000, 10, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (97, N'LUCAS', N'BİGLİA', 31, 1200000.0000, N'ARJANTİN', CAST(0x2B100B00 AS Date), N'ORTA SAHA', N'R', 1, 5000000.0000, 10, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (98, N'GİACOMO', N'BONAVENTURA', 28, 1000000.0000, N'İTALYA', CAST(0x3F150B00 AS Date), N'ORTA SAHA', N'R', 2, 7500000.0000, 10, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (99, N'NİKOLA', N'KALİNİC', 29, 1750000.0000, N'HIRVATİSTAN', CAST(0xEC120B00 AS Date), N'FORVET', N'R', 8, 11000000.0000, 10, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (100, N'ANDRE', N'SİLVA', 22, 2200000.0000, N'PORTEKİZ', CAST(0x1A1E0B00 AS Date), N'FORVET', N'R', 7, 15000000.0000, 10, 0)
GO
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (101, N'SAMİR', N'HANDANOVİC', 33, 1850000.0000, N'SLOVENYA', CAST(0xF60D0B00 AS Date), N'KALECİ', N'R', 0, 4000000.0000, 11, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (102, N'MİLAN', N'SKRİNİAR', 22, 2000000.0000, N'SLOVAKYA', CAST(0x0E1D0B00 AS Date), N'DEFANS', N'R', 0, 3000000.0000, 11, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (103, N'JOAO', N'CANCELO', 23, 1750000.0000, N'PORTEKİZ', CAST(0x0A1C0B00 AS Date), N'DEFANS', N'R', 1, 3500000.0000, 11, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (104, N'YUTO', N'NAGATOMO', 31, 800000.0000, N'JAPONYA', CAST(0x0C110B00 AS Date), N'DEFANS', N'L', 1, 3500000.0000, 11, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (105, N'DALBERT', N'ESTEVAO', 24, 1200000.0000, N'BREZİLYA', CAST(0x051B0B00 AS Date), N'DEFANS', N'R', 0, 2750000.0000, 11, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (106, N'İVAN', N'PERİSİC', 28, 3250000.0000, N'HIRVATİSTAN', CAST(0x76140B00 AS Date), N'ORTA SAHA', N'R', 4, 15000000.0000, 11, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (107, N'ANTONİO', N'CANDREVA', 30, 850000.0000, N'İTALYA', CAST(0xB5110B00 AS Date), N'ORTA SAHA', N'R', 1, 4200000.0000, 11, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (108, N'JOAO', N'MARİO', 24, 3750000.0000, N'PORTEKİZ', CAST(0x1D1A0B00 AS Date), N'ORTA SAHA', N'R', 6, 22500000.0000, 11, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (109, N'MARCELO', N'BROZOVİC', 25, 3750000.0000, N'HIRVATİSTAN', CAST(0xDD190B00 AS Date), N'ORTA SAHA', N'R', 4, 14500000.0000, 11, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (110, N'MAURO', N'İCARDİ', 24, 3200000.0000, N'ARJANTİN', CAST(0x3C1A0B00 AS Date), N'FORVET', N'R', 9, 25000000.0000, 11, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (111, N'PEPE', N'REİNA', 35, 850000.0000, N'İSPANYA', CAST(0x4B0B0B00 AS Date), N'KALECİ', N'R', 0, 2500000.0000, 12, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (112, N'KALİDOU', N'KOULİBALY', 26, 3000000.0000, N'FRANSA', CAST(0xDA170B00 AS Date), N'DEFANS', N'R', 1, 7000000.0000, 12, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (113, N'FAOUZİ', N'GHOULAM', 26, 3500000.0000, N'CEZAYİR', CAST(0x4F170B00 AS Date), N'DEFANS', N'R', 0, 6500000.0000, 12, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (114, N'RAUL', N'ALBİOL', 32, 2500000.0000, N'İSPANYA', CAST(0x970F0B00 AS Date), N'DEFANS', N'R', 1, 6000000.0000, 12, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (115, N'ALLAN', N'MARQUES', 26, 2250000.0000, N'BREZİLYA', CAST(0x37170B00 AS Date), N'ORTA SAHA', N'R', 2, 7000000.0000, 12, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (116, N'JORGİNHO', N'LUİZ', 25, 2600000.0000, N'İTALYA', CAST(0x91180B00 AS Date), N'ORTA SAHA', N'R', 1, 7000000.0000, 12, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (117, N'MAREK', N'HAMSİK', 30, 4100000.0000, N'SLOVAKYA', CAST(0x4A120B00 AS Date), N'ORTA SAHA', N'R', 5, 15000000.0000, 12, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (118, N'JOSE', N'CALLEJON', 30, 3500000.0000, N'İSPANYA', CAST(0xA4110B00 AS Date), N'FORVET', N'R', 6, 15000000.0000, 12, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (119, N'LORENZO', N'İNSİGNE', 26, 4500000.0000, N'İTALYA', CAST(0xCA170B00 AS Date), N'FORVET', N'R', 7, 27000000.0000, 12, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (120, N'DRİES', N'MERTENS', 30, 4000000.0000, N'BELÇİKA', CAST(0xF8110B00 AS Date), N'FORVET', N'R', 8, 12000000.0000, 12, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (121, N'ALİSSON', N'BECKER', 25, 2200000.0000, N'BREZİLYA', CAST(0xB0190B00 AS Date), N'KALECİ', N'R', 0, 3000000.0000, 13, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (122, N'FEDERİCO', N'FAZİO', 30, 2200000.0000, N'ARJANTİN', CAST(0xC6110B00 AS Date), N'DEFANS', N'R', 1, 3500000.0000, 13, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (123, N'KOSTAS', N'MANOLAS', 26, 2200000.0000, N'YUNANİSTAN', CAST(0xD4170B00 AS Date), N'DEFANS', N'R', 1, 4500000.0000, 13, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (124, N'ALEXSANDAR', N'KOLAROV', 32, 5000000.0000, N'SIRBİSTAN', CAST(0xDA0F0B00 AS Date), N'DEFANS', N'L', 2, 11000000.0000, 13, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (125, N'JUAN', N'JESUS', 26, 1700000.0000, N'BREZİLYA', CAST(0xD0170B00 AS Date), N'DEFANS', N'L', 0, 5000000.0000, 13, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (126, N'KEVİN', N'STROOTMAN', 27, 3250000.0000, N'HOLLANDA', CAST(0xEE150B00 AS Date), N'ORTA SAHA', N'R', 2, 17000000.0000, 13, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (127, N'CENGİZ', N'ÜNDER', 20, 1250000.0000, N'TÜRKİYE', CAST(0x82200B00 AS Date), N'ORTA SAHA', N'L', 2, 15000000.0000, 13, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (128, N'ALESSANDRO', N'FLORENZİ', 26, 3600000.0000, N'İTALYA', CAST(0x75170B00 AS Date), N'ORTA SAHA', N'R', 1, 15000000.0000, 13, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (129, N'RADJA', N'NAİNGGOLAN', 29, 5000000.0000, N'BELÇİKA', CAST(0x64130B00 AS Date), N'ORTA SAHA', N'R', 4, 25000000.0000, 13, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (130, N'EDİN', N'DZEKO', 31, 5000000.0000, N'BOSNA HERSEK', CAST(0x59100B00 AS Date), N'FORVET', N'R', 8, 10000000.0000, 13, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (131, N'MATTİA', N'PERİN', 25, 1200000.0000, N'İTALYA', CAST(0xD7190B00 AS Date), N'KALECİ', N'R', 0, 4000000.0000, 14, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (132, N'ARMANDO', N'IZZO', 25, 1450000.0000, N'İTALYA', CAST(0xDA180B00 AS Date), N'DEFANS', N'L', 1, 4000000.0000, 14, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (133, N'LUCA', N'ROSSETTİNİ', 32, 900000.0000, N'İTALYA', CAST(0x210F0B00 AS Date), N'DEFANS', N'R', 0, 2200000.0000, 14, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (134, N'DAVİDE', N'BİRASCHİ', 23, 1100000.0000, N'İTALYA', CAST(0x2E1C0B00 AS Date), N'DEFANS', N'R', 1, 2300000.0000, 14, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (135, N'RİCARDO', N'CENTRUİON', 24, 2400000.0000, N'İTALYA', CAST(0x1D1A0B00 AS Date), N'ORTA SAHA', N'R', 2, 4200000.0000, 14, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (136, N'ADEL', N'TAARABT', 28, 4000000.0000, N'FAS', CAST(0xE5140B00 AS Date), N'ORTA SAHA', N'R', 2, 6800000.0000, 14, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (137, N'LUCA', N'RİGONİ', 33, 850000.0000, N'İTALYA', CAST(0x880E0B00 AS Date), N'ORTA SAHA', N'L', 0, 2300000.0000, 14, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (138, N'MİGUEL', N'VELOSO', 31, 1250000.0000, N'PORTEKİZ', CAST(0x90100B00 AS Date), N'ORTA SAHA', N'R', 1, 2200000.0000, 14, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (139, N'GORAN', N'PANDEV', 34, 2750000.0000, N'MAKEDONYA', CAST(0x910C0B00 AS Date), N'FORVET', N'L', 5, 4200000.0000, 14, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (140, N'PİETRO', N'PELLEGRİ', 16, 250000.0000, N'İTALYA', CAST(0xC0250B00 AS Date), N'FORVET', N'R', 0, 1000000.0000, 14, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (141, N'SALVATORE', N'SİRİGU', 30, 3000000.0000, N'İTALYA', CAST(0x86110B00 AS Date), N'KALECİ', N'R', 0, 8500000.0000, 15, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (142, N'NİKOLAS', N'N''KOULOU', 27, 2500000.0000, N'KAMERUN', CAST(0x18160B00 AS Date), N'DEFANS', N'R', 0, 10000000.0000, 15, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (143, N'ANTONİA', N'BARRECA', 22, 1250000.0000, N'İTALYA', CAST(0x311D0B00 AS Date), N'DEFANS', N'L', 1, 4500000.0000, 15, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (144, N'LORENZO DE', N'SİLVESTRİ', 29, 1000000.0000, N'İTALYA', CAST(0x77130B00 AS Date), N'DEFANS', N'R', 0, 3500000.0000, 15, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (145, N'NİCOLAS', N'BURDİSSO', 36, 2000000.0000, N'ARJANTİN', CAST(0x46090B00 AS Date), N'DEFANS', N'R', 1, 1200000.0000, 15, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (146, N'IAGO', N'FALQUE', 27, 2400000.0000, N'İSPANYA', CAST(0xC6150B00 AS Date), N'ORTA SAHA', N'R', 2, 3500000.0000, 15, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (147, N'DANİELE', N'BASELLİ', 25, 3200000.0000, N'İTALYA', CAST(0xE4180B00 AS Date), N'ORTA SAHA', N'R', 3, 6500000.0000, 15, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (148, N'ANDREA', N'BELOTTİ', 23, 2800000.0000, N'İTALYA', CAST(0x6C1B0B00 AS Date), N'FORVET', N'R', 2, 7500000.0000, 15, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (149, N'ADAM', N'LJAJİC', 26, 4000000.0000, N'SIRBİSTAN', CAST(0x3C180B00 AS Date), N'FORVET', N'L', 4, 8500000.0000, 15, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (150, N'M''BAYE', N'NİANG', 23, 4500000.0000, N'FRANSA', CAST(0xD81C0B00 AS Date), N'FORVET', N'R', 6, 12250000.0000, 15, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (151, N'ANTONİA', N'MİRANTE', 34, 1200000.0000, N'İTALYA', CAST(0x820C0B00 AS Date), N'KALECİ', N'R', 0, 2250000.0000, 16, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (152, N'ADAM', N'MASİNA', 23, 1400000.0000, N'FAS', CAST(0x791B0B00 AS Date), N'DEFANS', N'L', 1, 2500000.0000, 16, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (153, N'VASİLİS', N'TOROSİDİS', 32, 2750000.0000, N'YUNANİSTAN', CAST(0x410F0B00 AS Date), N'DEFANS', N'R', 0, 3500000.0000, 16, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (154, N'EMİL', N'KRAFTH', 23, 2200000.0000, N'İSVEÇ', CAST(0x4D1C0B00 AS Date), N'DEFANS', N'R', 1, 4500000.0000, 16, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (155, N'DOMENİCO', N'MAİETTA', 35, 1200000.0000, N'İTALYA', CAST(0x2F0B0B00 AS Date), N'DEFANS', N'L', 0, 1500000.0000, 16, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (156, N'SİMONE', N'VERDİ', 25, 2850000.0000, N'İTALYA', CAST(0x5E190B00 AS Date), N'ORTA SAHA', N'R', 2, 5500000.0000, 16, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (157, N'GODFRED', N'DONSAH', 21, 1500000.0000, N'GANA', CAST(0xF01E0B00 AS Date), N'ORTA SAHA', N'R', 1, 9000000.0000, 16, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (158, N'SAPHİR', N'TAİDER', 25, 1200000.0000, N'FRANSA', CAST(0xD8180B00 AS Date), N'ORTA SAHA ', N'L', 2, 4500000.0000, 16, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (159, N'FEDERİCO DE', N'FRANCESCO', 23, 1850000.0000, N'İTALYA', CAST(0x1C1C0B00 AS Date), N'FORVET', N'R', 3, 3500000.0000, 16, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (160, N'RODRİGO', N'PALACİO', 35, 3500000.0000, N'ARJANTİN', CAST(0x7C0A0B00 AS Date), N'FORVET', N'R', 4, 2500000.0000, 16, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (161, N'DAVİD DE', N'GEA', 27, 12000000.0000, N'İSPANYA', CAST(0xF9160B00 AS Date), N'KALECİ', N'R', 0, 45000000.0000, 17, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (162, N'LUKE', N'SHAW', 22, 3500000.0000, N'İNGİLTERE', CAST(0xA51D0B00 AS Date), N'DEFANS', N'L', 1, 15000000.0000, 17, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (163, N'ERİC', N'BAİLLY', 23, 3500000.0000, N'FİLDİŞİ SAHİLLERİ', CAST(0xDD1B0B00 AS Date), N'DEFANS', N'R', 0, 12500000.0000, 17, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (164, N'MARCOS', N'ROJO', 27, 4000000.0000, N'ARJANTİN', CAST(0x11160B00 AS Date), N'DEFANS', N'L', 0, 12500000.0000, 17, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (165, N'CHRİS', N'SMALLİNG', 28, 4000000.0000, N'İNGİLTERE', CAST(0x9B150B00 AS Date), N'DEFANS', N'R', 1, 15000000.0000, 17, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (166, N'PAUL', N'POGBA', 24, 18000000.0000, N'FRANSA', CAST(0x541A0B00 AS Date), N'ORTA SAHA', N'R', 4, 105000000.0000, 17, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (167, N'HENRİH', N'MHİTARYAN', 28, 5500000.0000, N'ERMENİSTAN', CAST(0x6E140B00 AS Date), N'ORTA SAHA', N'R', 2, 22500000.0000, 17, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (168, N'JUAN', N'MATA', 29, 10000000.0000, N'İSPANYA', CAST(0x5E130B00 AS Date), N'ORTA SAHA', N'L', 3, 30000000.0000, 17, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (169, N'ZLATAN', N'İBRAHİMOVİC', 36, 12000000.0000, N'İSVEÇ', CAST(0xFF090B00 AS Date), N'FORVET', N'R', 7, 15000000.0000, 17, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (170, N'ROMELU', N'LUKAKU', 24, 10000000.0000, N'BELÇİKA', CAST(0x8F1A0B00 AS Date), N'FORVET', N'L', 8, 45000000.0000, 17, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (171, N'CLAUDİO', N'BRAVO', 34, 3500000.0000, N'ŞİLİ', CAST(0x2C0C0B00 AS Date), N'KALECİ', N'R', 0, 10000000.0000, 18, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (172, N'VİNCENT', N'KOMPANY', 31, 11000000.0000, N'BELÇİKA', CAST(0x71100B00 AS Date), N'DEFANS', N'R', 1, 25000000.0000, 18, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (173, N'JOHN', N'STONES', 23, 4500000.0000, N'İNGİLTERE', CAST(0x9E1A0B00 AS Date), N'DEFANS', N'R', 0, 25000000.0000, 18, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (174, N'BENJAMİN', N'MENDY', 23, 4500000.0000, N'FRANSA', CAST(0x3D1C0B00 AS Date), N'DEFANS', N'L', 1, 30000000.0000, 18, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (175, N'KYLE', N'WALKER', 27, 6000000.0000, N'İNGİLTERE', CAST(0x56160B00 AS Date), N'DEFANS', N'R', 2, 35000000.0000, 18, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (176, N'YAYA', N'TOURE', 34, 12500000.0000, N'FİLDİŞİ SAHİLLERİ', CAST(0x4A0C0B00 AS Date), N'ORTA SAHA', N'R', 2, 25000000.0000, 18, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (177, N'LEROY', N'SANE', 21, 6500000.0000, N'ALMANYA', CAST(0x5C1E0B00 AS Date), N'ORTA SAHA', N'L', 6, 55000000.0000, 18, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (178, N'KEVİN DE', N'BRUYNE', 26, 12000000.0000, N'BELÇİKA', CAST(0xE2170B00 AS Date), N'ORTA SAHA', N'R', 7, 60000000.0000, 18, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (179, N'GABRİEL', N'JESUS', 20, 3500000.0000, N'BREZİLYA', CAST(0x1C200B00 AS Date), N'FORVET', N'R', 3, 30000000.0000, 18, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (180, N'SERGİO', N'AGUERO', 29, 13500000.0000, N'ARJANTİN', CAST(0x81130B00 AS Date), N'FORVET', N'R', 15, 75000000.0000, 18, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (181, N'SİMON', N'MİGNOLET', 29, 4500000.0000, N'BELÇİKA', CAST(0x29130B00 AS Date), N'KALECİ', N'R', 0, 14000000.0000, 19, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (182, N'DEJAN', N'LOVREN', 28, 6500000.0000, N'HIRVATİSTAN', CAST(0x0F150B00 AS Date), N'DEFANS', N'L', 0, 12000000.0000, 19, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (183, N'JOE', N'GOMEZ', 20, 2500000.0000, N'İNGİLTERE', CAST(0x4E200B00 AS Date), N'DEFANS', N'R', 0, 15000000.0000, 19, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (184, N'NATHANİEL', N'CLYNE', 26, 3000000.0000, N'İNGİLTERE', CAST(0x8E170B00 AS Date), N'DEFANS', N'R', 0, 10000000.0000, 19, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (185, N'ADAM', N'LALLANA', 29, 8500000.0000, N'İNGİLTERE', CAST(0x6A130B00 AS Date), N'ORTA SAHA', N'R', 3, 18000000.0000, 19, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (186, N'ALEX OXLADE', N'CHAMBERLAİN', 24, 6000000.0000, N'İNGİLTERE', CAST(0xED1A0B00 AS Date), N'ORTA SAHA', N'R', 5, 35000000.0000, 19, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (187, N'PHİLİPPE', N'COUTİNHO', 25, 5500000.0000, N'BREZİLYA', CAST(0x40190B00 AS Date), N'ORTA SAHA', N'R', 6, 32500000.0000, 19, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (188, N'MUHAMMED', N'SALAH', 25, 5500000.0000, N'MISIR', CAST(0x43190B00 AS Date), N'FORVET', N'R', 7, 35000000.0000, 19, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (189, N'SADİO', N'MANE', 25, 5500000.0000, N'SENEGAL', CAST(0x01190B00 AS Date), N'FORVET', N'R', 6, 35000000.0000, 19, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (190, N'ROBERTO', N'FİRMİNO', 26, 5600000.0000, N'BREZİLYA', CAST(0x42180B00 AS Date), N'FORVET', N'R', 8, 38000000.0000, 19, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (191, N'THİBAUT', N'COURTOİS', 25, 4500000.0000, N'BELÇİKA', CAST(0x20190B00 AS Date), N'KALECİ', N'L', 0, 25000000.0000, 20, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (192, N'DAVİD', N'LUİZ', 30, 10000000.0000, N'BREZİLYA', CAST(0xEA110B00 AS Date), N'DEFANS', N'R', 2, 40000000.0000, 20, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (193, N'GARY', N'CAHİLL', 32, 5000000.0000, N'İNGİLTERE', CAST(0x01100B00 AS Date), N'DEFANS', N'L', 0, 15000000.0000, 20, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (194, N'CESAR', N'AZPİLİCUETA', 28, 4500000.0000, N'İSPANYA', CAST(0x45150B00 AS Date), N'DEFANS', N'R', 1, 22000000.0000, 20, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (195, N'EDEN', N'HAZARD', 26, 14000000.0000, N'BELÇİKA', CAST(0x36170B00 AS Date), N'ORTA SAHA', N'R', 6, 75000000.0000, 20, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (196, N'TİEMOUE', N'BAKAYOKO', 23, 3500000.0000, N'FRANSA', CAST(0x5C1C0B00 AS Date), N'ORTA SAHA', N'R', 1, 30000000.0000, 20, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (197, N'N''GOLO', N'KANTE', 26, 6000000.0000, N'FRANSA', CAST(0x87170B00 AS Date), N'ORTA SAHA', N'R', 0, 40000000.0000, 20, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (198, N'CESC', N'FABREGAS', 30, 8000000.0000, N'İSPANYA', CAST(0xF6110B00 AS Date), N'ORTA SAHA', N'R', 3, 35000000.0000, 20, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (199, N'ALVARO', N'MORATA', 25, 4500000.0000, N'İSPANYA', CAST(0xC5190B00 AS Date), N'FORVET', N'R', 6, 45000000.0000, 20, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (200, N'DİEGO', N'COSTA', 29, 10000000.0000, N'BREZİLYA', CAST(0x00140B00 AS Date), N'FORVET', N'R', 8, 50000000.0000, 20, 0)
GO
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (201, N'PETR', N'CECH', 35, 7500000.0000, N'ÇEK CUMHURİYETİ', CAST(0xE40A0B00 AS Date), N'KALECİ', N'L', 0, 10000000.0000, 21, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (202, N'HECTOR', N'BELLERİN', 22, 4500000.0000, N'İSPANYA', CAST(0x321D0B00 AS Date), N'DEFANS', N'R', 2, 35000000.0000, 21, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (203, N'LAURENT', N'KOSCİELNY', 32, 3500000.0000, N'FRANSA', CAST(0x9D0F0B00 AS Date), N'DEFANS', N'R', 2, 25000000.0000, 21, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (204, N'SHKODRAN', N'MUSTAFİ', 25, 3500000.0000, N'ALMANYA', CAST(0x08190B00 AS Date), N'DEFANS', N'R', 1, 40000000.0000, 21, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (205, N'MESUT', N'ÖZİL', 29, 11000000.0000, N'ALMANYA', CAST(0x08140B00 AS Date), N'ORTA SAHA', N'L', 6, 65000000.0000, 21, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (206, N'AARON', N'RAMSEY', 26, 8500000.0000, N'İNGİLTERE', CAST(0x2A170B00 AS Date), N'ORTA SAHA', N'R', 4, 35000000.0000, 21, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (207, N'SANTİ', N'CAZORLA', 33, 4500000.0000, N'İSPANYA', CAST(0x8D0E0B00 AS Date), N'ORTA SAHA', N'R', 2, 25000000.0000, 21, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (208, N'OLİVİER', N'GİROUD', 31, 5000000.0000, N'FRANSA', CAST(0x1E110B00 AS Date), N'FORVET', N'L', 6, 20000000.0000, 21, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (209, N'ALEXDRA', N'LACAZETTE', 26, 6000000.0000, N'FRANSA', CAST(0xC3170B00 AS Date), N'FORVET', N'R', 9, 45000000.0000, 21, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (210, N'ALEXİS', N'SANCHEZ', 29, 15000000.0000, N'ŞİLİ', CAST(0x49140B00 AS Date), N'FORVET', N'R', 10, 60000000.0000, 21, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (211, N'HUGO', N'LLORİS', 30, 6000000.0000, N'FRANSA', CAST(0x75110B00 AS Date), N'KALECİ', N'L', 0, 25000000.0000, 22, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (212, N'DANNY', N'ROSE', 27, 4500000.0000, N'İNGİLTERE', CAST(0x79160B00 AS Date), N'DEFANS', N'L', 1, 12500000.0000, 22, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (213, N'SERGE', N'AURİER', 24, 4500000.0000, N'FRANSA', CAST(0x031A0B00 AS Date), N'DEFANS', N'R', 0, 25000000.0000, 22, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (214, N'JAN', N'VERTONGHEN', 30, 5000000.0000, N'BELÇİKA', CAST(0xEC110B00 AS Date), N'DEFANS', N'L', 1, 20000000.0000, 22, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (215, N'TOBY', N'ALDERWEİRELD', 28, 6000000.0000, N'BELÇİKA', CAST(0x92140B00 AS Date), N'DEFANS', N'R', 4, 30000000.0000, 22, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (216, N'DELE', N'ALLİ', 21, 4500000.0000, N'İNGİLTERE', CAST(0xB71E0B00 AS Date), N'ORTA SAHA', N'R', 5, 60000000.0000, 22, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (217, N'CHRİSTİAN', N'ERİKSEN', 25, 8500000.0000, N'DANİMARKA', CAST(0xC9180B00 AS Date), N'ORTA SAHA', N'R', 4, 35000000.0000, 22, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (218, N'MUSA', N'DEMBELE', 30, 6000000.0000, N'BELÇİKA', CAST(0x3F120B00 AS Date), N'ORTA SAHA', N'L', 2, 15000000.0000, 22, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (219, N'HARRY', N'KANE', 24, 12000000.0000, N'İNGİLTERE', CAST(0xFA1A0B00 AS Date), N'FORVET', N'R', 11, 55000000.0000, 22, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (220, N'FERNANDO', N'LLORENTE', 32, 5000000.0000, N'İSPANYA', CAST(0xD90E0B00 AS Date), N'FORVET', N'R', 5, 35000000.0000, 22, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (221, N'JORDAN', N'PİCKFORD', 23, 3500000.0000, N'İNGİLTERE', CAST(0xB91B0B00 AS Date), N'KALECİ', N'R', 0, 15000000.0000, 23, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (222, N'ASHLEY', N'WİLLİAMS', 33, 3500000.0000, N'İNGİLTERE', CAST(0x0A0E0B00 AS Date), N'DEFANS', N'L', 1, 8000000.0000, 23, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (223, N'SEAMUS', N'COLEMAN', 29, 5000000.0000, N'İRLANDA', CAST(0x04140B00 AS Date), N'DEFANS', N'R', 0, 12000000.0000, 23, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (224, N'LEİGHTON', N'BAİNES', 33, 2500000.0000, N'İNGİLTERE', CAST(0x8C0E0B00 AS Date), N'DEFANS', N'L', 0, 8500000.0000, 23, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (225, N'MORGAN', N'SCHNEİDERLİN', 28, 5500000.0000, N'FRANSA', CAST(0x8D150B00 AS Date), N'ORTA SAHA', N'R', 3, 21000000.0000, 23, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (226, N'ROSS', N'BARKLEY', 24, 4500000.0000, N'İNGİLTERE', CAST(0x5D1B0B00 AS Date), N'ORTA SAHA', N'R', 2, 25000000.0000, 23, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (227, N'DAVY', N'KLAASSEN', 24, 5000000.0000, N'HOLLANDA', CAST(0x3E1A0B00 AS Date), N'ORTA SAHA', N'R', 5, 30000000.0000, 23, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (228, N'KEVİN', N'MİRALLAS', 30, 4500000.0000, N'BELÇİKA', CAST(0x90120B00 AS Date), N'FORVET', N'R', 4, 25000000.0000, 23, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (229, N'SANDRO', N'RAMİREZ', 22, 2850000.0000, N'İSPANYA', CAST(0xA21D0B00 AS Date), N'FORVET', N'L', 1, 19000000.0000, 23, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (230, N'WAYNE', N'ROONEY', 32, 16000000.0000, N'İNGİLTERE', CAST(0xC90F0B00 AS Date), N'FORVET', N'R', 8, 45000000.0000, 23, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (231, N'ROBBİN', N'RUİTER', 30, 1500000.0000, N'HOLLANDA', CAST(0xCE110B00 AS Date), N'KALECİ', N'R', 0, 3500000.0000, 24, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (232, N'LAMİNE', N'KONE', 28, 2500000.0000, N'FRANSA', CAST(0x75140B00 AS Date), N'DEFANS', N'R', 1, 4500000.0000, 24, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (233, N'JOHN', N'O''SHEA', 36, 2500000.0000, N'İRLANDA', CAST(0x46090B00 AS Date), N'DEFANS', N'L', 0, 2250000.0000, 24, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (234, N'PADDY', N'MCNAİR', 22, 2500000.0000, N'KUZEY İRLANDA', CAST(0x591D0B00 AS Date), N'DEFANS', N'R', 1, 8500000.0000, 24, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (235, N'BRYAN', N'OVİEDO', 27, 3500000.0000, N'KOSTA RİKA', CAST(0xF3150B00 AS Date), N'DEFANS', N'R', 0, 6500000.0000, 24, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (236, N'DUNCAN', N'WATMORE', 23, 4000000.0000, N'İNGİLTERE', CAST(0xBA1B0B00 AS Date), N'ORTA SAHA', N'R', 2, 12500000.0000, 24, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (237, N'DİDİER İBRAHİM', N'N''DONG', 23, 3500000.0000, N'GABON', CAST(0x1F1C0B00 AS Date), N'ORTA SAHA', N'R', 3, 15000000.0000, 24, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (238, N'LEE', N'CATTERMOLE', 29, 3500000.0000, N'İNGİLTERE', CAST(0x38130B00 AS Date), N'ORTA SAHA', N'R', 3, 10000000.0000, 24, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (239, N'LEWIS', N'GRABBAN', 29, 3500000.0000, N'İNGİLTERE', CAST(0xF3120B00 AS Date), N'FORVET', N'R', 4, 10000000.0000, 24, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (240, N'JAMES', N'VAUGHAN', 29, 4000000.0000, N'İNGİLTERE', CAST(0xAB130B00 AS Date), N'FORVET', N'L', 4, 12500000.0000, 24, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (241, N'KEYLOR', N'NAVAS', 31, 3500000.0000, N'KOSTA RİKA', CAST(0x6A110B00 AS Date), N'KALECİ', N'R', 0, 15000000.0000, 25, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (242, N'SERGİO', N'RAMOS', 31, 8000000.0000, N'İSPANYA', CAST(0x66100B00 AS Date), N'DEFANS', N'R', 3, 55000000.0000, 25, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (243, N'MARCELO', N'SİLVA', 29, 7500000.0000, N'BREZİLYA', CAST(0x6C130B00 AS Date), N'DEFANS', N'L', 3, 50000000.0000, 25, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (244, N'RAPHAEL', N'VARANE', 24, 6000000.0000, N'FRANSA', CAST(0x7D1A0B00 AS Date), N'DEFANS', N'R', 1, 65000000.0000, 25, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (245, N'LUKA', N'MODRİC', 32, 8500000.0000, N'HIRVATİSTAN', CAST(0x9C0F0B00 AS Date), N'ORTA SAHA', N'R', 4, 55000000.0000, 25, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (246, N'TONİ', N'KROOS', 27, 14000000.0000, N'ALMANYA', CAST(0xC6150B00 AS Date), N'ORTA SAHA', N'R', 4, 75000000.0000, 25, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (247, N'FRANCİSCO', N'İSCO', 25, 7500000.0000, N'İSPANYA', CAST(0x0C190B00 AS Date), N'ORTA SAHA', N'R', 4, 65000000.0000, 25, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (248, N'KARİM', N'BENZEMA', 30, 10000000.0000, N'FRANSA', CAST(0xDB120B00 AS Date), N'FORVET', N'R', 8, 80000000.0000, 25, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (249, N'GARETH', N'BALE', 28, 15000000.0000, N'GALLER', CAST(0x1A150B00 AS Date), N'FORVET', N'L', 2, 100000000.0000, 25, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (250, N'CRİSTİANO', N'RONALDO', 32, 32000000.0000, N'PORTEKİZ', CAST(0xC40E0B00 AS Date), N'FORVET', N'R', 12, 250000000.0000, 25, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (251, N'MARC-ANDRE TER', N'STEGEN', 25, 6000000.0000, N'ALMANYA', CAST(0x15190B00 AS Date), N'KALECİ', N'R', 0, 20000000.0000, 26, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (252, N'SAMUEL', N'UMTİTİ', 24, 4500000.0000, N'KAMERUN', CAST(0x481B0B00 AS Date), N'DEFANS', N'L', 1, 35000000.0000, 26, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (253, N'JORDİ', N'ALBA', 28, 5000000.0000, N'İSPANYA', CAST(0xA5140B00 AS Date), N'DEFANS', N'L', 2, 40000000.0000, 26, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (254, N'GERARD', N'PİQUE', 30, 7500000.0000, N'İSPANYA', CAST(0x9B110B00 AS Date), N'DEFANS', N'R', 1, 40000000.0000, 26, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (255, N'ARDA', N'TURAN', 30, 8000000.0000, N'TÜRKİYE', CAST(0x98110B00 AS Date), N'ORTA SAHA', N'R', 7, 42000000.0000, 26, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (256, N'ANDRES', N'İNİESTA', 33, 8500000.0000, N'İSPANYA', CAST(0xB60D0B00 AS Date), N'ORTA SAHA', N'R', 5, 55000000.0000, 26, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (257, N'İVAN', N'RAKİTİC', 29, 8000000.0000, N'HIRVATİSTAN', CAST(0x2D130B00 AS Date), N'ORTA SAHA', N'R', 4, 55000000.0000, 26, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (258, N'LİONEL', N'MESSİ', 30, 40000000.0000, N'ARJANTİN', CAST(0x29120B00 AS Date), N'FORVET', N'L', 16, 275000000.0000, 26, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (259, N'LUİS', N'SUAREZ', 30, 25000000.0000, N'URUGUAY', CAST(0x92110B00 AS Date), N'FORVET', N'R', 10, 85000000.0000, 26, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (260, N'OUSMANE', N'DEMBELE', 20, 7500000.0000, N'FRANSA', CAST(0x46200B00 AS Date), N'FORVET', N'L', 4, 55000000.0000, 26, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (261, N'JAN', N'OBLAK', 24, 4500000.0000, N'SLOVENYA', CAST(0x111A0B00 AS Date), N'KALECİ', N'R', 0, 20000000.0000, 27, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (262, N'JOSE', N'GİMENEZ', 22, 3500000.0000, N'URUGUAY', CAST(0xF81C0B00 AS Date), N'DEFANS', N'R', 0, 35000000.0000, 27, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (263, N'DİEGO', N'GODİN', 31, 3500000.0000, N'URUGUAY', CAST(0x3C100B00 AS Date), N'DEFANS', N'R', 1, 30000000.0000, 27, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (264, N'FİLİPE', N'LUİS', 32, 6000000.0000, N'BREZİLYA', CAST(0x7D0F0B00 AS Date), N'DEFANS', N'L', 2, 15000000.0000, 27, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (265, N'JUAN', N'FRANCİSCO', 32, 4500000.0000, N'İSPANYA', CAST(0xA90E0B00 AS Date), N'DEFANS', N'R', 1, 12500000.0000, 27, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (266, N'JORGE', N'KOKE', 25, 4000000.0000, N'İSPANYA', CAST(0xA4180B00 AS Date), N'ORTA SAHA', N'R', 2, 25000000.0000, 27, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (267, N'YANNİCK', N'CARRASCO', 24, 4500000.0000, N'BELÇİKA', CAST(0x011B0B00 AS Date), N'ORTA SAHA', N'R', 4, 40000000.0000, 27, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (268, N'SAUL', N'NİGUEZ', 23, 3500000.0000, N'İSPANYA', CAST(0xBC1C0B00 AS Date), N'ORTA SAHA', N'L', 3, 45000000.0000, 27, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (269, N'FERNANDO', N'TORRES', 33, 4500000.0000, N'İSPANYA', CAST(0x820D0B00 AS Date), N'FORVET', N'R', 6, 50000000.0000, 27, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (270, N'ANTONİE', N'GRİEZMANN', 26, 7000000.0000, N'FRANSA', CAST(0x7F170B00 AS Date), N'FORVET', N'L', 10, 75000000.0000, 27, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (271, N'NORBERTO MURARA', N'NETO', 28, 2500000.0000, N'BREZİLYA', CAST(0x1D150B00 AS Date), N'KALECİ', N'R', 0, 8000000.0000, 28, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (272, N'MARTİN', N'MONTOYA', 26, 3200000.0000, N'İSPANYA', CAST(0x97170B00 AS Date), N'DEFANS', N'R', 1, 9500000.0000, 28, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (273, N'JOSE LUİS', N'GAYA', 22, 3200000.0000, N'İSPANYA', CAST(0x751D0B00 AS Date), N'DEFANS', N'R', 0, 12000000.0000, 28, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (274, N'EZEQUİEL', N'GARAY', 31, 5500000.0000, N'ARJANTİN', CAST(0x28110B00 AS Date), N'DEFANS', N'R', 1, 8500000.0000, 28, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (275, N'DANİEL', N'PAREJO', 28, 3850000.0000, N'İSPANYA', CAST(0xBF140B00 AS Date), N'ORTA SAHA', N'R', 4, 15000000.0000, 28, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (276, N'FABİAN', N'ORELLENA', 31, 2700000.0000, N'ŞİLİ', CAST(0x28100B00 AS Date), N'ORTA SAHA', N'R', 2, 10000000.0000, 28, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (277, N'GOEFFREY', N'KONDOGBİA', 24, 3000000.0000, N'FRANSA', CAST(0x381A0B00 AS Date), N'ORTA SAHA', N'L', 1, 22000000.0000, 28, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (278, N'ANDREAS', N'PEREİRA', 21, 2500000.0000, N'BELÇİKA', CAST(0x521E0B00 AS Date), N'ORTA SAHA', N'R', 4, 35000000.0000, 28, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (279, N'SİMONE', N'ZAZA', 26, 2750000.0000, N'İTALYA', CAST(0xDF170B00 AS Date), N'FORVET', N'L', 4, 12000000.0000, 28, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (280, N'GONÇALO', N'GUEDES', 21, 2250000.0000, N'PORTEKİZ', CAST(0x9C1F0B00 AS Date), N'FORVET', N'R', 2, 22000000.0000, 28, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (281, N'KEPA', N'ARRİZABALAGA', 23, 2250000.0000, N'İSPANYA', CAST(0x8B1C0B00 AS Date), N'KALECİ', N'R', 0, 11000000.0000, 29, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (282, N'YERAY', N'ALVAREZ', 22, 2200000.0000, N'İSPANYA', CAST(0xFD1C0B00 AS Date), N'DEFANS', N'R', 1, 4500000.0000, 29, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (283, N'AYMERİC', N'LAPORTE', 23, 2200000.0000, N'FRANSA', CAST(0x0A1C0B00 AS Date), N'DEFANS', N'R', 0, 3750000.0000, 29, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (284, N'MİKEL', N'BALENZİAGA', 29, 3500000.0000, N'İSPANYA', CAST(0x23130B00 AS Date), N'DEFANS', N'L', 1, 4500000.0000, 29, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (285, N'MİKEL SAN', N'JOSE', 28, 4000000.0000, N'İSPANYA', CAST(0xEB140B00 AS Date), N'DEFANS', N'R', 0, 4500000.0000, 29, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (286, N'ANDER', N'ITTURRASPE', 28, 3500000.0000, N'İSPANYA', CAST(0x98140B00 AS Date), N'ORTA SAHA', N'R', 2, 5500000.0000, 29, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (287, N'RAUL', N'GARCİA', 31, 4000000.0000, N'İSPANYA', CAST(0xCD100B00 AS Date), N'ORTA SAHA', N'L', 3, 3500000.0000, 29, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (288, N'OSCAR DE', N'MARCOS', 28, 4500000.0000, N'İSPANYA', CAST(0xBD140B00 AS Date), N'ORTA SAHA', N'R', 4, 5500000.0000, 29, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (289, N'ARİTZ', N'ADURİZ', 36, 2200000.0000, N'İSPANYA', CAST(0x15090B00 AS Date), N'FORVET', N'R', 5, 2200000.0000, 29, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (290, N'İNAKİ', N'WİLLİAMS', 23, 3200000.0000, N'İSPANYA', CAST(0x1D1C0B00 AS Date), N'FORVET', N'R', 4, 14000000.0000, 29, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (291, N'GERENİMO ', N'RULLİ', 25, 3500000.0000, N'ARJANTİN', CAST(0x29190B00 AS Date), N'KALECİ', N'R', 0, 7500000.0000, 30, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (292, N'İNİGO', N'MARTİNEZ', 26, 3750000.0000, N'İSPANYA', CAST(0xB8170B00 AS Date), N'DEFANS', N'R', 1, 7500000.0000, 30, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (293, N'ALVARO', N'ODRİOZOLA', 22, 2200000.0000, N'İSPANYA', CAST(0x401E0B00 AS Date), N'DEFANS', N'L', 0, 3500000.0000, 30, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (294, N'KEVİN', N'RODRİGUES', 23, 2300000.0000, N'FRANSA', CAST(0xB71B0B00 AS Date), N'DEFANS', N'R', 1, 3450000.0000, 30, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (295, N'CARLOS', N'MARTİNEZ', 31, 3000000.0000, N'İSPANYA', CAST(0x7B100B00 AS Date), N'DEFANS', N'R', 2, 4500000.0000, 30, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (296, N'ASİER', N'İLLARAMENDİ', 27, 3500000.0000, N'İSPANYA', CAST(0x05160B00 AS Date), N'ORTA SAHA', N'R', 3, 6500000.0000, 30, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (297, N'ADNAN', N'JANUZAJ', 22, 3500000.0000, N'BELÇİKA', CAST(0x081D0B00 AS Date), N'ORTA SAHA', N'R', 5, 11000000.0000, 30, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (298, N'SERGİO', N'CANALES', 26, 3750000.0000, N'İSPANYA', CAST(0x5E170B00 AS Date), N'ORTA SAHA', N'L', 1, 8000000.0000, 30, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (299, N'CARLOS', N'VELA', 28, 4500000.0000, N'MEKSİKA', CAST(0x91140B00 AS Date), N'FORVET', N'R', 6, 12000000.0000, 30, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (300, N'WİLLİAN', N'JOSE', 26, 2500000.0000, N'BREZİLYA', CAST(0x76180B00 AS Date), N'FORVET', N'R', 4, 11000000.0000, 30, 0)
GO
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (301, N'SERGİO', N'RİCO', 24, 2650000.0000, N'İSPANYA', CAST(0xFE1A0B00 AS Date), N'KALECİ', N'R', 0, 7800000.0000, 31, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (302, N'SERGİO', N'ESCUDERO', 28, 3200000.0000, N'İSPANYA', CAST(0x4A150B00 AS Date), N'DEFANS', N'L', 1, 8000000.0000, 31, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (303, N'SİMON', N'KJAER', 28, 6000000.0000, N'DANİMARKA', CAST(0xAA140B00 AS Date), N'DEFANS', N'R', 2, 15000000.0000, 31, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (304, N'CLEMENT', N'LENGLET', 22, 2200000.0000, N'FRANSA', CAST(0x8C1D0B00 AS Date), N'DEFANS', N'R', 0, 3500000.0000, 31, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (305, N'PABLO', N'SARABİA', 25, 2350000.0000, N'İSPANYA', CAST(0x20190B00 AS Date), N'ORTA SAHA', N'R', 2, 5000000.0000, 31, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (306, N'JOAQUIN', N'CORREA', 23, 3500000.0000, N'ARJANTİN', CAST(0x581C0B00 AS Date), N'ORTA SAHA', N'L', 4, 25000000.0000, 31, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (307, N'STEVEN', N'N''ZONZİ', 29, 3200000.0000, N'FRANSA', CAST(0x45140B00 AS Date), N'ORTA SAHA', N'R', 2, 8500000.0000, 31, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (308, N'LUİS', N'MURİEL', 26, 2200000.0000, N'KOLOMBİYA', CAST(0x99170B00 AS Date), N'FORVET', N'R', 3, 6500000.0000, 31, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (309, N'WİSSAM BEN ', N'YEDDER', 27, 3500000.0000, N'FRANSA', CAST(0xA2160B00 AS Date), N'FORVET', N'R', 4, 11000000.0000, 31, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (310, N'LİONEL', N'CAROLLE', 26, 1750000.0000, N'FRANSA', CAST(0x95170B00 AS Date), N'DEFANS', N'L', 1, 2500000.0000, 31, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (311, N'ANTONİA', N'ADAN', 30, 2200000.0000, N'İSPANYA', CAST(0x10120B00 AS Date), N'KALECİ', N'R', 0, 2500000.0000, 32, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (312, N'RİZA', N'DURMİSİ', 23, 2250000.0000, N'DANİMARKA', CAST(0x781B0B00 AS Date), N'DEFANS', N'R', 0, 1750000.0000, 32, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (313, N'AİSSA', N'MANDİ', 26, 1750000.0000, N'FRANSA', CAST(0x56180B00 AS Date), N'DEFANS', N'L', 1, 2250000.0000, 32, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (314, N'ZOUHAİR', N'FEDDAL', 28, 1750000.0000, N'FAS', CAST(0x56140B00 AS Date), N'DEFANS', N'R', 0, 2200000.0000, 32, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (315, N'RAFA', N'NAVARRO', 23, 1250000.0000, N'İSPANYA', CAST(0xAE1B0B00 AS Date), N'DEFANS', N'L', 1, 2500000.0000, 32, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (316, N'ANDRES', N'GUARDADO', 31, 2500000.0000, N'MEKSİKA', CAST(0x1A110B00 AS Date), N'ORTA SAHA', N'R', 2, 8500000.0000, 32, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (317, N'RİYAD', N'BUDEBUZ', 27, 1850000.0000, N'FRANSA', CAST(0xF4150B00 AS Date), N'ORTA SAHA', N'L', 0, 3500000.0000, 32, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (318, N'JOEL', N'CAMPBELL', 25, 3500000.0000, N'KOSTA RİKA', CAST(0x4D190B00 AS Date), N'ORTA SAHA', N'L', 3, 17500000.0000, 32, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (319, N'JOAQUİN', N'SANCHEZ', 36, 1750000.0000, N'İSPANYA', CAST(0xB5090B00 AS Date), N'ORTA SAHA', N'R', 2, 2250000.0000, 32, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (320, N'ANTONİA', N'SANABRİA', 21, 3500000.0000, N'PARAGUAY', CAST(0x911E0B00 AS Date), N'FORVET', N'R', 6, 6500000.0000, 32, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (321, N'MANUEL', N'NEUER', 31, 7500000.0000, N'ALMANYA', CAST(0x63100B00 AS Date), N'KALECİ', N'R', 0, 25000000.0000, 33, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (322, N'JOREMO', N'BOATENG', 29, 8000000.0000, N'ALMANYA', CAST(0xDE130B00 AS Date), N'DEFANS', N'R', 2, 30000000.0000, 33, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (323, N'MATS', N'HUMMELS', 29, 8000000.0000, N'ALMANYA', CAST(0x46140B00 AS Date), N'DEFANS', N'R', 1, 45000000.0000, 33, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (324, N'DAVİD', N'ALABA', 25, 7500000.0000, N'AVUSTURYA', CAST(0x4C190B00 AS Date), N'DEFANS', N'L', 2, 50000000.0000, 33, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (325, N'ARTURO', N'VİDAL', 30, 7800000.0000, N'ŞİLİ', CAST(0x08120B00 AS Date), N'ORTA SAHA', N'R', 4, 45000000.0000, 33, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (326, N'FRANCK', N'RİBERY', 34, 8320000.0000, N'FRANSA', CAST(0x260C0B00 AS Date), N'ORTA SAHA', N'R', 5, 15000000.0000, 33, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (327, N'ARJEN', N'ROBBEN', 33, 11000000.0000, N'HOLLANDA', CAST(0x490D0B00 AS Date), N'ORTA SAHA', N'L', 6, 22000000.0000, 33, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (328, N'JAMES', N'RODRIGUEZ', 26, 7500000.0000, N'KOLOMBİYA', CAST(0xF0170B00 AS Date), N'ORTA SAHA', N'L', 4, 50000000.0000, 33, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (329, N'THOMAS', N'MÜLLER', 28, 16000000.0000, N'ALMANYA', CAST(0x55150B00 AS Date), N'FORVET', N'R', 8, 50000000.0000, 33, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (330, N'ROBERT', N'LEWANDOWSKİ', 29, 10000000.0000, N'POLONYA', CAST(0xD1130B00 AS Date), N'FORVET', N'R', 17, 80000000.0000, 33, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (331, N'ROMAN', N'BÜRKİ', 27, 4000000.0000, N'İSVİÇRE', CAST(0x00170B00 AS Date), N'KALECİ', N'R', 0, 9000000.0000, 34, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (332, N'MARCEL', N'SCHMELZER', 29, 2500000.0000, N'ALMANYA', CAST(0xFD120B00 AS Date), N'DEFANS', N'L', 1, 9000000.0000, 34, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (333, N'MARC', N'BARTRA', 26, 3500000.0000, N'İSPANYA', CAST(0x3E170B00 AS Date), N'DEFANS', N'R', 1, 15000000.0000, 34, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (334, N'SOKRATİS', N'PAPASTATOPULOS', 29, 3000000.0000, N'YUNANİSTAN', CAST(0x88130B00 AS Date), N'DEFANS', N'R', 0, 28000000.0000, 34, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (335, N'MARİO', N'GÖTZE', 25, 7000000.0000, N'ALMANYA', CAST(0x37190B00 AS Date), N'ORTA SAHA', N'R', 5, 20000000.0000, 34, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (336, N'SHİNJİ', N'KAGAWA', 28, 6000000.0000, N'JAPONYA', CAST(0xA1140B00 AS Date), N'ORTA SAHA', N'R', 4, 13000000.0000, 34, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (337, N'MARCO', N'REUS', 28, 6500000.0000, N'ALMANYA', CAST(0xEC140B00 AS Date), N'ORTA SAHA', N'R', 6, 35000000.0000, 34, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (338, N'NURİ', N'ŞAHİN', 29, 3000000.0000, N'TÜRKİYE', CAST(0xE0130B00 AS Date), N'ORTA SAHA', N'L', 2, 5000000.0000, 34, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (339, N'ANDRİY', N'YARMALENKO', 28, 5000000.0000, N'RUSYA', CAST(0x7D150B00 AS Date), N'FORVET', N'L', 4, 25000000.0000, 34, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (340, N'PİERRE-EMERİCK', N'AUBAMEYANG', 28, 8000000.0000, N'FRANSA', CAST(0xFE140B00 AS Date), N'FORVET', N'R', 12, 65000000.0000, 34, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (341, N'YANN', N'SOMMER', 29, 3500000.0000, N'İSVİÇRE', CAST(0x47140B00 AS Date), N'KALECİ', N'R', 0, 9000000.0000, 35, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (342, N'JANNİK', N'VESTERGAARD', 25, 3200000.0000, N'DANİMARKA', CAST(0x74190B00 AS Date), N'DEFANS', N'R', 1, 12000000.0000, 35, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (343, N'TONY', N'JANTSCHKE', 27, 2750000.0000, N'ALMANYA', CAST(0x23160B00 AS Date), N'DEFANS', N'R', 0, 6000000.0000, 35, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (344, N'OSCAR', N'WENDT', 32, 2750000.0000, N'İSVEÇ', CAST(0xC90F0B00 AS Date), N'DEFANS', N'L', 2, 3000000.0000, 35, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (345, N'NİCO', N'ELVEDİ', 21, 1750000.0000, N'İSVİÇRE', CAST(0x631F0B00 AS Date), N'DEFANS', N'R', 0, 7000000.0000, 35, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (346, N'THORGAN', N'HAZARD', 24, 3000000.0000, N'BELÇİKA', CAST(0x621A0B00 AS Date), N'ORTA SAHA', N'R', 4, 12000000.0000, 35, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (347, N'LARS', N'STİNDL', 29, 3500000.0000, N'ALMANYA', CAST(0xD6130B00 AS Date), N'ORTA SAHA', N'L', 1, 15000000.0000, 35, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (348, N'CRİSTOPH', N'KRAMER', 26, 3000000.0000, N'ALMANYA', CAST(0x61170B00 AS Date), N'ORTA SAHA', N'R', 2, 12000000.0000, 35, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (349, N'İBRAHİMA', N'TRAORE', 29, 1750000.0000, N'FRANSA', CAST(0x57130B00 AS Date), N'ORTA SAHA', N'R', 1, 5000000.0000, 35, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (350, N'JOSİP', N'DRMİC', 25, 1125000.0000, N'İSVİÇRE', CAST(0x79190B00 AS Date), N'FORVET', N'R', 4, 3000000.0000, 35, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (351, N'JİRİ', N'PAVLENKA', 25, 1750000.0000, N'ÇEK CUMHURİYETİ', CAST(0x03190B00 AS Date), N'KALECİ', N'R', 0, 3000000.0000, 36, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (352, N'LUDOVİC', N'SANE', 30, 2000000.0000, N'FRANSA', CAST(0xC6110B00 AS Date), N'DEFANS', N'R', 0, 3500000.0000, 36, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (353, N'THEODOR', N'SELASSİE', 30, 1750000.0000, N'ÇEK CUMHURİYETİ', CAST(0x69110B00 AS Date), N'DEFANS', N'L', 1, 3000000.0000, 36, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (354, N'NİKLAS', N'MOİSANDER', 32, 1125000.0000, N'FİNLANDİYA', CAST(0xAC0F0B00 AS Date), N'DEFANS', N'R', 2, 2000000.0000, 36, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (355, N'ROBERT', N'BAUER', 22, 1125000.0000, N'ALMANYA', CAST(0x471D0B00 AS Date), N'DEFANS', N'R', 1, 3500000.0000, 36, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (356, N'FİN', N'BARTELS', 30, 2000000.0000, N'ALMANYA', CAST(0xA0110B00 AS Date), N'ORTA SAHA', N'R', 2, 3750000.0000, 36, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (357, N'THOMAS', N'DELANEY', 26, 2500000.0000, N'DANİMARKA', CAST(0x25180B00 AS Date), N'ORTA SAHA', N'L', 3, 6000000.0000, 36, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (358, N'ZLATKO', N'JUNUZOVİC', 30, 2750000.0000, N'SIRBİSTAN', CAST(0x87120B00 AS Date), N'ORTA SAHA', N'R', 2, 6500000.0000, 36, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (359, N'MAX', N'KRUSE', 29, 4000000.0000, N'ALMANYA', CAST(0x36130B00 AS Date), N'FORVET', N'R', 6, 12000000.0000, 36, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (360, N'ARON', N'JOHANNSSON', 27, 950000.0000, N'ABD', CAST(0xFC160B00 AS Date), N'FORVET', N'R', 1, 1500000.0000, 36, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (361, N'CHRİSTİAN', N'MATHENİA', 25, 1150000.0000, N'ALMANYA', CAST(0xDB180B00 AS Date), N'KALECİ', N'R', 0, 2000000.0000, 37, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (362, N'DENNİS', N'DİEKMEİER', 28, 750000.0000, N'ALMANYA', CAST(0x7A150B00 AS Date), N'DEFANS', N'R', 1, 1500000.0000, 37, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (363, N'KİRİAKOS', N'PAPADOPULOS', 25, 3000000.0000, N'YUNANİSTAN', CAST(0xD2180B00 AS Date), N'DEFANS', N'R', 2, 7000000.0000, 37, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (364, N'GOTOKU', N'SAKAİ', 26, 1500000.0000, N'ABD', CAST(0xDC190B00 AS Date), N'DEFANS', N'R', 1, 3000000.0000, 37, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (365, N'NİCOLAİ', N'MÜLLER', 30, 2500000.0000, N'ALMANYA', CAST(0x86120B00 AS Date), N'ORTA SAHA', N'R', 5, 4500000.0000, 37, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (366, N'LEWİS', N'HOLTBY', 27, 2500000.0000, N'ALMANYA', CAST(0xC8160B00 AS Date), N'ORTA SAHA', N'L', 2, 5000000.0000, 37, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (367, N'ALBİN', N'EKDAL', 28, 1000000.0000, N'İSVEÇ', CAST(0x26150B00 AS Date), N'ORTA SAHA', N'L', 2, 2500000.0000, 37, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (368, N'FİLİP', N'KOSTİC', 25, 3200000.0000, N'SIRBİSTAN', CAST(0xCE190B00 AS Date), N'ORTA SAHA', N'R', 4, 8000000.0000, 37, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (369, N'JANN-FİETE', N'ARP', 17, 250000.0000, N'ALMANYA', CAST(0x07240B00 AS Date), N'FORVET', N'R', 0, 500000.0000, 37, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (370, N'BOBBY SHOU', N'WOOD', 25, 2250000.0000, N'ABD', CAST(0xDC190B00 AS Date), N'FORVET', N'R', 7, 4500000.0000, 37, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (371, N'RON-ROBERT', N'ZİELER', 28, 2500000.0000, N'ALMANYA', CAST(0x80140B00 AS Date), N'KALECİ', N'R', 0, 5000000.0000, 38, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (372, N'HOLGER', N'BADSTUBER', 28, 1150000.0000, N'ALMANYA', CAST(0x9D140B00 AS Date), N'DEFANS', N'R', 1, 2500000.0000, 38, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (373, N'BENJAMİN', N'PAVARD', 21, 1200000.0000, N'FRANSA', CAST(0xA21E0B00 AS Date), N'DEFANS', N'R', 0, 1500000.0000, 38, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (374, N'EMİLİANO', N'İNSUA', 28, 1850000.0000, N'ARJANTİN', CAST(0x5C140B00 AS Date), N'DEFANS', N'R', 1, 3500000.0000, 38, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (375, N'MARCİN', N'KAMİNSKİ', 25, 1500000.0000, N'POLONYA', CAST(0xAB180B00 AS Date), N'DEFANS', N'L', 2, 2500000.0000, 38, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (376, N'CHRİSTİAN', N'GENTNER', 32, 1000000.0000, N'ALMANYA', CAST(0x820F0B00 AS Date), N'ORTA SAHA', N'R', 0, 2000000.0000, 38, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (377, N'CARLOS', N'MANE', 23, 2250000.0000, N'PORTEKİZ', CAST(0xBD1B0B00 AS Date), N'ORTA SAHA', N'R', 3, 4500000.0000, 38, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (378, N'CHADRAC', N'AKOLO', 22, 2500000.0000, N'DEMOKRATİK KONGO CUMHURİYETİ', CAST(0x3F1D0B00 AS Date), N'ORTA SAHA', N'L', 4, 6000000.0000, 38, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (379, N'ANATASİOS', N'DONİS', 21, 1750000.0000, N'İNGİLTERE', CAST(0x431F0B00 AS Date), N'FORVET', N'R', 1, 3000000.0000, 38, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (380, N'TAKUMA', N'ASANO', 23, 1250000.0000, N'JAPONYA', CAST(0xB11C0B00 AS Date), N'FORVET', N'R', 2, 2500000.0000, 38, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (381, N'TİMO', N'HORN', 24, 4000000.0000, N'ALMANYA', CAST(0x8E1A0B00 AS Date), N'KALECİ', N'R', 0, 12000000.0000, 39, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (382, N'DOMİNİC', N'MAROH', 30, 750000.0000, N'ALMANYA', CAST(0xB9110B00 AS Date), N'DEFANS', N'R', 0, 2000000.0000, 39, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (383, N'JORGE', N'MERE', 20, 750000.0000, N'İSPANYA', CAST(0x2A200B00 AS Date), N'DEFANS', N'L', 1, 2000000.0000, 39, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (384, N'LUKAS', N'KLÜNTER', 21, 1250000.0000, N'ALMANYA', CAST(0xCB1E0B00 AS Date), N'DEFANS', N'R', 0, 2500000.0000, 39, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (385, N'LEONARDO', N'BİTTENCOURT', 24, 2500000.0000, N'ALMANYA', CAST(0x6B1B0B00 AS Date), N'ORTA SAHA', N'R', 2, 6000000.0000, 39, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (386, N'JONAS', N'HECTOR', 27, 4500000.0000, N'ALMANYA', CAST(0x55160B00 AS Date), N'ORTA SAHA', N'L', 3, 20000000.0000, 39, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (387, N'MİLOS', N'JOJİC', 25, 1100000.0000, N'SIRBİSTAN', CAST(0xEB180B00 AS Date), N'ORTA SAHA', N'R', 0, 2500000.0000, 39, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (388, N'YUYA', N'OSAKA', 27, 2250000.0000, N'JAPONYA', CAST(0x4C160B00 AS Date), N'FORVET', N'R', 4, 5000000.0000, 39, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (389, N'CLAUDİO', N'PİZARRO', 39, 750000.0000, N'PERU', CAST(0xB7050B00 AS Date), N'FORVET', N'L', 0, 1000000.0000, 39, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (390, N'JHON', N'CORDOBA', 24, 4500000.0000, N'KOLOMBİYA', CAST(0x8D1A0B00 AS Date), N'FORVET', N'R', 5, 10000000.0000, 39, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (391, N'RALF', N'FAHRMANN', 29, 3500000.0000, N'ALMANYA', CAST(0xF6130B00 AS Date), N'KALECİ', N'R', 0, 9000000.0000, 40, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (392, N'RONALDO', N'RODRİGUES', 35, 2000000.0000, N'BREZİLYA', CAST(0x550B0B00 AS Date), N'DEFANS', N'R', 1, 2000000.0000, 40, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (393, N'THİLO', N'KEHRER', 21, 2500000.0000, N'ALMANYA', CAST(0x5A1F0B00 AS Date), N'DEFANS', N'R', 0, 5000000.0000, 40, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (394, N'MATİJA', N'NASTASİC', 24, 4000000.0000, N'SIRBİSTAN', CAST(0x611A0B00 AS Date), N'DEFANS', N'R', 1, 12000000.0000, 40, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (395, N'MAX', N'MEYER', 22, 4000000.0000, N'ALMANYA', CAST(0xE91D0B00 AS Date), N'ORTA SAHA', N'R', 4, 15000000.0000, 40, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (396, N'AMİNE', N'HARİT', 20, 2500000.0000, N'FRANSA', CAST(0x68200B00 AS Date), N'ORTA SAHA', N'L', 4, 8000000.0000, 40, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (397, N'LEON', N'GORETZKA', 22, 5000000.0000, N'ALMANYA', CAST(0x091D0B00 AS Date), N'ORTA SAHA', N'R', 5, 23000000.0000, 40, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (398, N'YEVKEN', N'KONOPLYANKA', 28, 3000000.0000, N'UKRAYNA', CAST(0x65150B00 AS Date), N'ORTA SAHA', N'R', 6, 12500000.0000, 40, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (399, N'GUİDO', N'BURGSTALLER', 28, 2250000.0000, N'AVUSTURYA', CAST(0xCC140B00 AS Date), N'FORVET', N'R', 8, 7000000.0000, 40, 0)
INSERT [dbo].[tbl_Footballers] ([Footballers_ID], [Footballers_Name], [Footballers_Surname], [Age], [Salary], [Country], [BirthDate], [Position], [Dominant_Foot], [Goal_Number], [Testimonial], [Team], [transferlist]) VALUES (400, N'FRANCO Dİ', N'SANTA', 28, 1150000.0000, N'ARJANTİN', CAST(0xB6140B00 AS Date), N'FORVET', N'R', 1, 2500000.0000, 40, 0)
GO
INSERT [dbo].[tbl_League] ([League_ID], [League_Name], [Foundation_Year], [Country], [Sponsor], [President]) VALUES (1, N'SPOR TOTO SÜPER LİG', N'1959', N'TÜRKİYE', N'TURKİSH AİRLİNES', N'YILDIRIM DEMİRÖREN')
INSERT [dbo].[tbl_League] ([League_ID], [League_Name], [Foundation_Year], [Country], [Sponsor], [President]) VALUES (2, N'SERİE A', N'1898', N'İTALYA', NULL, N'CARLO TAVECCHİO')
INSERT [dbo].[tbl_League] ([League_ID], [League_Name], [Foundation_Year], [Country], [Sponsor], [President]) VALUES (3, N'PREMİER LEAGUE', N'1992', N'İNGİLTERE', NULL, N'WİLLİAM MOUNTBATTEN-WİNDSON')
INSERT [dbo].[tbl_League] ([League_ID], [League_Name], [Foundation_Year], [Country], [Sponsor], [President]) VALUES (4, N'LA LİGA', N'1929', N'İSPANYA', N'EA SPORTS', N'ANGEL MARİA VİLLAR LLONA')
INSERT [dbo].[tbl_League] ([League_ID], [League_Name], [Foundation_Year], [Country], [Sponsor], [President]) VALUES (5, N'BUNDESLİGA', N'1962', N'ALMANYA', NULL, N'WOLFGANG NİERSBACH')
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (1, CAST(0xA73D0B00 AS Date), 1, 2, 1, 1, 1)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (2, CAST(0xA73D0B00 AS Date), 3, 4, 2, 3, 1)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (3, CAST(0xA73D0B00 AS Date), 5, 6, 3, 5, 1)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (4, CAST(0xA73D0B00 AS Date), 7, 8, 4, 7, 1)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (5, CAST(0xAE3D0B00 AS Date), 2, 3, 1, 2, 1)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (6, CAST(0xAE3D0B00 AS Date), 4, 1, 2, 4, 1)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (7, CAST(0xAE3D0B00 AS Date), 6, 7, 3, 6, 1)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (8, CAST(0xAE3D0B00 AS Date), 8, 5, 4, 8, 1)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (9, CAST(0xB53D0B00 AS Date), 1, 6, 2, 1, 1)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (10, CAST(0xB53D0B00 AS Date), 3, 5, 3, 3, 1)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (11, CAST(0xB53D0B00 AS Date), 7, 2, 4, 7, 1)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (12, CAST(0xB53D0B00 AS Date), 8, 4, 1, 8, 1)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (13, CAST(0xBB3D0B00 AS Date), 5, 1, 3, 5, 1)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (14, CAST(0xBB3D0B00 AS Date), 2, 8, 4, 2, 1)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (15, CAST(0xBB3D0B00 AS Date), 4, 7, 2, 4, 1)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (16, CAST(0xBB3D0B00 AS Date), 6, 3, 1, 6, 1)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (17, CAST(0xA73D0B00 AS Date), 9, 10, 7, 9, 2)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (18, CAST(0xA73D0B00 AS Date), 11, 12, 6, 10, 2)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (19, CAST(0xA73D0B00 AS Date), 13, 14, 5, 12, 2)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (20, CAST(0xA73D0B00 AS Date), 15, 16, 8, 14, 2)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (21, CAST(0xAE3D0B00 AS Date), 10, 11, 5, 10, 2)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (22, CAST(0xAE3D0B00 AS Date), 12, 9, 6, 11, 2)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (23, CAST(0xAE3D0B00 AS Date), 14, 15, 7, 13, 2)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (24, CAST(0xAE3D0B00 AS Date), 16, 13, 8, 15, 2)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (25, CAST(0xB53D0B00 AS Date), 9, 14, 6, 9, 2)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (26, CAST(0xB53D0B00 AS Date), 11, 13, 7, 10, 2)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (27, CAST(0xB53D0B00 AS Date), 15, 10, 8, 14, 2)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (28, CAST(0xB53D0B00 AS Date), 16, 12, 5, 15, 2)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (29, CAST(0xBB3D0B00 AS Date), 13, 9, 5, 12, 2)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (30, CAST(0xBB3D0B00 AS Date), 10, 16, 6, 10, 2)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (31, CAST(0xBB3D0B00 AS Date), 12, 15, 7, 11, 2)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (32, CAST(0xBB3D0B00 AS Date), 14, 11, 8, 13, 2)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (33, CAST(0xA73D0B00 AS Date), 17, 18, 9, 16, 3)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (34, CAST(0xA73D0B00 AS Date), 19, 20, 10, 18, 3)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (35, CAST(0xA73D0B00 AS Date), 21, 22, 11, 20, 3)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (36, CAST(0xA73D0B00 AS Date), 23, 24, 12, 22, 3)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (37, CAST(0xAE3D0B00 AS Date), 18, 19, 12, 17, 3)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (38, CAST(0xAE3D0B00 AS Date), 20, 17, 11, 19, 3)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (39, CAST(0xAE3D0B00 AS Date), 22, 23, 10, 21, 3)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (40, CAST(0xAE3D0B00 AS Date), 24, 21, 9, 23, 3)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (41, CAST(0xB53D0B00 AS Date), 17, 22, 10, 16, 3)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (42, CAST(0xB53D0B00 AS Date), 19, 21, 11, 18, 3)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (43, CAST(0xB53D0B00 AS Date), 23, 18, 9, 22, 3)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (44, CAST(0xB53D0B00 AS Date), 24, 20, 12, 23, 3)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (45, CAST(0xBB3D0B00 AS Date), 21, 17, 9, 20, 3)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (46, CAST(0xBB3D0B00 AS Date), 18, 24, 10, 17, 3)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (47, CAST(0xBB3D0B00 AS Date), 20, 23, 11, 19, 3)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (48, CAST(0xBB3D0B00 AS Date), 22, 19, 12, 21, 3)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (49, CAST(0xA73D0B00 AS Date), 25, 26, 13, 24, 4)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (50, CAST(0xA73D0B00 AS Date), 27, 28, 14, 26, 4)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (51, CAST(0xA73D0B00 AS Date), 29, 30, 15, 28, 4)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (52, CAST(0xA73D0B00 AS Date), 31, 32, 16, 30, 4)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (53, CAST(0xAE3D0B00 AS Date), 26, 27, 13, 25, 4)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (54, CAST(0xAE3D0B00 AS Date), 28, 25, 14, 27, 4)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (55, CAST(0xAE3D0B00 AS Date), 30, 31, 15, 29, 4)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (56, CAST(0xAE3D0B00 AS Date), 32, 29, 16, 31, 4)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (57, CAST(0xB53D0B00 AS Date), 25, 30, 13, 24, 4)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (58, CAST(0xB53D0B00 AS Date), 27, 29, 14, 26, 4)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (59, CAST(0xB53D0B00 AS Date), 31, 26, 15, 30, 4)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (60, CAST(0xB53D0B00 AS Date), 32, 28, 16, 31, 4)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (61, CAST(0xBB3D0B00 AS Date), 29, 25, 13, 28, 4)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (62, CAST(0xBB3D0B00 AS Date), 26, 32, 14, 25, 4)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (63, CAST(0xBB3D0B00 AS Date), 28, 31, 15, 27, 4)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (64, CAST(0xBB3D0B00 AS Date), 30, 27, 16, 29, 4)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (65, CAST(0xA73D0B00 AS Date), 33, 34, 17, 32, 5)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (66, CAST(0xA73D0B00 AS Date), 35, 36, 18, 34, 5)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (67, CAST(0xA73D0B00 AS Date), 37, 38, 19, 36, 5)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (68, CAST(0xA73D0B00 AS Date), 39, 40, 20, 38, 5)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (69, CAST(0xAE3D0B00 AS Date), 34, 35, 17, 33, 5)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (70, CAST(0xAE3D0B00 AS Date), 36, 33, 18, 35, 5)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (71, CAST(0xAE3D0B00 AS Date), 38, 39, 19, 37, 5)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (72, CAST(0xAE3D0B00 AS Date), 40, 37, 20, 39, 5)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (73, CAST(0xB53D0B00 AS Date), 33, 38, 17, 32, 5)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (74, CAST(0xB53D0B00 AS Date), 35, 37, 18, 34, 5)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (75, CAST(0xB53D0B00 AS Date), 39, 34, 19, 38, 5)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (76, CAST(0xB53D0B00 AS Date), 40, 36, 20, 39, 5)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (77, CAST(0xBB3D0B00 AS Date), 37, 33, 17, 36, 5)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (78, CAST(0xBB3D0B00 AS Date), 34, 40, 18, 33, 5)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (79, CAST(0xBB3D0B00 AS Date), 36, 39, 19, 35, 5)
INSERT [dbo].[tbl_Match] ([Match_ID], [Match_Date], [Home_Team], [Away_Team], [Referee], [Stadium], [League]) VALUES (80, CAST(0xBB3D0B00 AS Date), 38, 35, 20, 37, 5)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (1, N'ARDA', N'KARDEŞLER', 28, 13000.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (2, N'CÜNEYT', N'ÇAKIR', 41, 35000.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (3, N'FIRAT', N'AYDINUS', 44, 30000.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (4, N'HALİS', N'ÖZKAHYA', 47, 23000.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (5, N'PAOLO', N'TAGLİAVENTO', 45, 35000.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (6, N'PİERLUİGİ', N'COLLİNA', 57, 50000.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (7, N'LUCA', N'BONTİ', 43, 25000.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (8, N'PAOLO', N'MAZZOLENİ', 43, 22500.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (9, N'MARK', N'CLATTENBURG', 42, 19500.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (10, N'MARTİN', N'ATKİNSON', 46, 20000.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (11, N'MİCHAEL', N'OLİVER', 32, 17500.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (12, N'ANTHONY', N'TAYLOR', 39, 20000.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (13, N'ANTONİO MATEU', N'LAHOZ', 40, 35000.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (14, N'DAVİD FERNANDEZ', N'BORBALAN', 44, 28500.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (15, N'ALBERTO UNDİANO', N'MALLENCO', 44, 30000.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (16, N'CARLOS VELASCO', N'CARBALLO', 46, 27500.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (17, N'DENİZ', N'AYTEKİN', 39, 35000.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (18, N'FELİX', N'BRYCH', 42, 35000.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (19, N'BİBİANA', N'STEİNHAUS', 38, 25000.0000)
INSERT [dbo].[tbl_Referee] ([Referee_ID], [Referee_Name], [Referee_Surname], [Age], [Salary]) VALUES (20, N'HOLGER', N'HENSCHEL', 44, 30000.0000)
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (1, N'TÜRK TELEKOM', 52562, 1, N'İSTANBUL')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (2, N'ŞÜKRÜ SARAÇOĞLU', 50509, 2, N'İSTANBUL')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (3, N'VODAFONE', 41903, 3, N'İSTANBUL')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (4, N'ANTALYA', 32539, 4, N'ANTALYA')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (5, N'MEDİKAL PARK', 41513, 5, N'TRABZON')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (6, N'BAŞAKŞEHİR FATİH TERİM', 17801, 6, N'İSTANBUL')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (7, N'BURSA BÜYÜKŞEHİR BELEDİYE', 43331, 7, N'BURSA')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (8, N'BORNOVA', 12500, 8, N'İZMİR')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (9, N'JUVENTUS', 41507, 9, N'TORİNO')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (10, N'GUİSEPPE MEAZZA', 80018, 10, N'MİLANO')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (11, N'SAN PAOLO', 60240, 12, N'NAPOLİ')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (12, N'OLİMPİYAT', 72698, 13, N'ROMA')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (13, N'LUİGİ FERRARİS', 36599, 14, N'GENOVA')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (14, N'TORİNO OLİMPİYAT', 27958, 15, N'TORİNO')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (15, N'RENATO DALL''ARA', 38279, 16, N'BOLOGNA')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (16, N'OLD TRAFFORD', 75643, 17, N'MANCHESTER')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (17, N'ETİHAD', 55097, 18, N'MANCHESTER')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (18, N'ANFİELD', 54074, 19, N'LİVERPOOL')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (19, N'STAMFORD BRİDGE', 41663, 20, N'LONDRA')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (20, N'EMİRATES', 59867, 21, N'LONDRA')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (21, N'WEMBLEY', 90000, 22, N'LONDRA')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (22, N'GOODİSON PARK', 40157, 23, N'LİVERPOOL')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (23, N'SUNDERLAND IŞIK ', 49000, 24, N'SUNDERLAND')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (24, N'SANTİAGO BARNABEU', 81044, 25, N'MADRİD')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (25, N'CAMP NOU', 99354, 26, N'BARSELONA')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (26, N'VİCENTE CALDERON', 54907, 27, N'MADRİD')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (27, N'MESTALLA', 55000, 28, N'VALENCİA')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (28, N'SAN MAMES', 53289, 29, N'BİLBAO')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (29, N'ANOETA', 32076, 30, N'DONOSTİA')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (30, N'RAMON SANCHEZ PİZJUAN', 42500, 31, N'SEVİLLA')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (31, N'BENİTO VİLLAMARİN', 60720, 32, N'SEVİLLA')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (32, N'ALLİANZ ARENA', 69344, 33, N'MÜNİH')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (33, N'SİGNAL İDUNA PARK', 81360, 34, N'DORTMUND')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (34, N'BORUSSİA PARK', 46287, 35, N'MÖNCHENGLADBACH')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (35, N'WESER', 42358, 36, N'BREMEN')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (36, N'VOLSPARK', 55989, 37, N'HAMBURG')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (37, N'MERCEDES-BENZ ARENA', 17000, 38, N'BERLİN')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (38, N'RHEİNENERGİE', 49968, 39, N'KÖLN')
INSERT [dbo].[tbl_Stadium] ([Stadium_ID], [Name], [Capacity], [Owner_Team], [City]) VALUES (39, N'VELTİNS ARENA', 54740, 40, N'GELSENKİRCHEN')
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (1, N'GALATASARAY', N'1905', N'İSTANBUL', N'TÜRKİYE', 2000000.0000, 500000.0000, 20, N'DURSUN ÖZBEK', N'SARI', N'KIRMIZI', 1, 1, 1)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (2, N'FENERBAHÇE', N'1907', N'İSTANBUL', N'TÜRKİYE', 26000000.0000, 600000.0000, 19, N'AZİZ YILDIRIM', N'SARI', N'LACİVERT', 1, 1, 2)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (3, N'BEŞİKTAŞ', N'1903', N'İSTANBUL', N'TÜRKİYE', 15000000.0000, 450000.0000, 15, N'FİKRET ORMAN', N'SİYAH', N'BEYAZ', 1, 0, 3)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (4, N'ANTALYASPOR', N'1966', N'ANTALYA', N'TÜRKİYE', 8000000.0000, 285000.0000, 0, N'ALİ ŞAFAK ÖZTÜRK', N'KIRMIZI', N'BEYAZ', 1, 0, 4)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (5, N'TRABZONSPOR', N'1967', N'TRABZON', N'TÜRKİYE', 1100000.0000, 385000.0000, 5, N'MUHARREM USTA', N'BORDO', N'MAVİ', 1, 0, 5)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (6, N'BAŞAKŞEHİR', N'2014', N'İSTANBUL', N'TÜRKİYE', 7500000.0000, 360000.0000, 0, N'GÖKSEL GÜMÜŞDAĞ', N'LACİVERT', N'TURUNCU', 1, 0, 6)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (7, N'BURSASPOR', N'1963', N'BURSA', N'TÜRKİYE', 9000000.0000, 300000.0000, 1, N'ALİ AY', N'BEYAZ', N'YEŞİL', 1, 0, 7)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (8, N'GÖZTEPE', N'1925', N'İZMİR', N'TÜRKİYE', 7500000.0000, 290000.0000, 0, N'MEHMET SEPİL', N'SARI', N'KIRMIZI', 1, 0, 8)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (9, N'JUVENTUS', N'1897', N'TORİNO', N'İTALYA', 250000000.0000, 22000000.0000, 33, N'ANDREA AGNELLİ', N'SİYAH', N'BEYAZ', 2, 0, 9)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (10, N'MİLAN', N'1899', N'MİLANO', N'İTALYA', 150000000.0000, 17000000.0000, 18, N'SİLVİO BERLİSCONİ', N'KIRMIZI', N'SİYAH', 2, 0, 10)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (11, N'İNTER', N'1908', N'MİLANO', N'İTALYA', 160000000.0000, 18000000.0000, 18, N'ERİCK THOHİR', N'MAVİ', N'SİYAH', 2, 0, 10)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (12, N'NAPOLİ', N'1926', N'NAPOLİ', N'İTALYA', 60000000.0000, 11000000.0000, 2, N'AURELİO DE LAURENTİİS', N'MAVİ', N'BEYAZ', 2, 0, 11)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (13, N'ROMA', N'1927', N'ROMA', N'İTALYA', 66000000.0000, 12000000.0000, 3, N'JAMES PALLOTTA', N'KIRMIZI ', N'SARI', 2, 0, 12)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (14, N'GENOA', N'1893', N'CENOVA', N'İTALYA', 25000000.0000, 9000000.0000, 9, N'ENRİCO PREZİOSİ', N'MAVİ', N'KIRMIZI', 2, 0, 13)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (15, N'TORİNO', N'1906', N'TORİNO', N'İTALYA', 14000000.0000, 8900000.0000, 7, N'SİNİSA MİHAJLOVİC', N'BORDO', N'BEYAZ', 2, 0, 14)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (16, N'BOLOGNA', N'1909', N'BOLOGNA', N'İTALYA', 12000000.0000, 7000000.0000, 7, N'FRANCESCA', N'KIRMIZI', N'MAVİ', 2, 0, 15)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (17, N'MANCHESTER UNİTED', N'1878', N'MANCHESTER', N'İNGİLTERE', 150000000.0000, 32000000.0000, 20, N'JOEL GLAZER', N'KIRMIZI', N'SİYAH', 3, 0, 16)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (18, N'MANCHESTER CİTY', N'1894', N'MANCHESTER', N'İNGİLTERE', 220000000.0000, 40000000.0000, 2, N'KHALDOON AL MUBARAK', N'MAVİ', N'BEYAZ', 3, 0, 17)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (19, N'LİVERPOOL', N'1892', N'LİVERPOOL', N'İNGİLTERE', 120000000.0000, 25000000.0000, 18, N'TOM WERNER', N'KIRMIZI', N'BEYAZ', 3, 0, 18)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (20, N'CHEALSEA', N'1905', N'LONDRA', N'İNGİLTERE', 125000000.0000, 26000000.0000, 5, N'BRUCE BUCK', N'MAVİ', N'BEYAZ', 3, 0, 19)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (21, N'ARSENAL', N'1886', N'LONDRA', N'İNGİLTERE', 110000000.0000, 22000000.0000, 13, N'CHİPS KESWİCK', N'KIRMIZI', N'BEYAZ', 3, 0, 20)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (22, N'TOTTENHAM', N'1882', N'LONDRA', N'İNGİLTERE', 100000000.0000, 20000000.0000, 2, N'DANİEL LEWY', N'KOYU MAVİ', N'BEYAZ', 3, 0, 21)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (23, N'EVERTON', N'1879', N'LİVERPOOL', N'İNGİLTERE', 95000000.0000, 17000000.0000, 9, N'BİLL KENWRİGHT', N'MAVİ', N'BEYAZ', 3, 0, 22)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (24, N'SUNDERLAND', N'1879', N'SUNDERLAND', N'İNGİLTERE', 85000000.0000, 16000000.0000, 6, N'ELLİS SHORT', N'KIRMIZI', N'BEYAZ', 3, 0, 23)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (25, N'REAL MADRİD', N'1902', N'MADRİD', N'İSPANYA', 200000000.0000, 45000000.0000, 32, N'FLORENTİNO PEREZ', N'EFLATUN', N'BEYAZ', 4, 0, 24)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (26, N'BARCELONA', N'1899', N'BARSELONA', N'İSPANYA', 200000000.0000, 45000000.0000, 24, N'JOSEP MARİA', N'BORDO', N'LACİVERT', 4, 0, 25)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (27, N'ATLETİCO MADRİD', N'1903', N'MADRİD', N'İSPANYA', 120000000.0000, 32000000.0000, 10, N'ENRİQUE CEREZO', N'KIRMIZI', N'BEYAZ', 4, 0, 26)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (28, N'VALENCİA', N'1919', N'VALENSİYA', N'İSPANYA', 100000000.0000, 26000000.0000, 6, N'LAY HAN CHOON', N'SİYAH', N'BEYAZ', 4, 0, 27)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (29, N'ATLETHİC BİLBAO', N'1898', N'BİLBAO', N'İSPANYA', 85000000.0000, 25000000.0000, 8, N'JOSU URRUTİA', N'KIRMIZI', N'BEYAZ', 4, 0, 28)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (30, N'REAL SOCİEDAD', N'1909', N'SAN SEBASTİAN', N'İSPANYA', 70000000.0000, 17000000.0000, 2, N'JOKİN APPERİBAY', N'MAVİ', N'BEYAZ', 4, 0, 29)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (31, N'SEVİLLA', N'1890', N'SEVİLLA', N'İSPANYA', 110000000.0000, 26000000.0000, 1, N'JOSE MARİA DEL NİDA', N'KIRMIZI', N'BEYAZ', 4, 0, 30)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (32, N'REAL BETİS', N'1907', N'SEVİLLA', N'İSPANYA', 30000000.0000, 8000000.0000, 1, N'PEPE MEL', N'YEŞİL', N'BEYAZ', 4, 0, 31)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (33, N'BAYERN MÜNCHEN', N'1900', N'MÜNİH', N'ALMANYA', 200000000.0000, 80000000.0000, 26, N'KARL HOPFNER', N'KIRMIZI', N'BEYAZ', 5, 0, 32)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (34, N'BORUSSİA DORTMUND', N'1909', N'DORTMUND', N'ALMANYA', 150000000.0000, 65000000.0000, 5, N'REİNHARD RAUBALL', N'SARI', N'SİYAH', 5, 0, 33)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (35, N'BORUSSİA MÖNCHENGLADBACH', N'1900', N'MÖNCHENGLADBACH', N'ALMANYA', 15000000.0000, 5500000.0000, 5, N'ROLF KÖNİGS', N'SİYAH', N'BEYAZ', 5, 0, 34)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (36, N'WERDER BREMEN', N'1899', N'BREMEN', N'ALMANYA', 22000000.0000, 7500000.0000, 4, N'KLAUS-DİETER FİSCHER', N'YEŞİL', N'BEYAZ', 5, 0, 35)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (37, N'HAMBURGER', N'1887', N'HAMBURG', N'ALMANYA', 17000000.0000, 6500000.0000, 3, N'JENS MEİER', N'MAVİ', N'BEYAZ', 5, 0, 36)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (38, N'STUTGART', N'1893', N'STUTGART', N'ALMANYA', 14000000.0000, 4500000.0000, 3, N'WOLFGANG DİETRİCH', N'KIRMIZI', N'BEYAZ', 5, 0, 37)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (39, N'1. FC KÖLN', N'1948', N'KÖLN', N'ALMANYA', 12000000.0000, 3500000.0000, 2, N'WERNER SPİNNER', N'KIRMIZI', N'SİYAH', 5, 0, 38)
INSERT [dbo].[tbl_Teams] ([Team_ID], [Team_Name], [Foundation_Year], [City], [Country], [Transfer_Budget], [Monthly_Exponse], [Championship_Number], [President], [Colour1], [Colour2], [League], [Selected], [Stadium]) VALUES (40, N'SCHALKE04', N'1904', N'GELSENKİRCHEN', N'ALMANYA', 25000000.0000, 7500000.0000, 0, N'CLEMENS TÖNNİES', N'MAVİ', N'BEYAZ', 5, 0, 39)
INSERT [dbo].[tbl_User] ([UserID], [User_Name], [Password], [Age], [BirthDate], [EMail], [Team]) VALUES (1, N'arda', N'123456', 20, CAST(0x83200B00 AS Date), N'ardonat97@hotmail.com', 2)
INSERT [dbo].[tbl_User] ([UserID], [User_Name], [Password], [Age], [BirthDate], [EMail], [Team]) VALUES (2, N'beykar', N'123456', 21, CAST(0x851E0B00 AS Date), N'asd@gmail.com', 1)
ALTER TABLE [dbo].[tbl_Coach]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Coach_tbl_Teams] FOREIGN KEY([Team])
REFERENCES [dbo].[tbl_Teams] ([Team_ID])
GO
ALTER TABLE [dbo].[tbl_Coach] CHECK CONSTRAINT [FK_tbl_Coach_tbl_Teams]
GO
ALTER TABLE [dbo].[tbl_Footballers]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Footballers_tbl_Teams] FOREIGN KEY([Team])
REFERENCES [dbo].[tbl_Teams] ([Team_ID])
GO
ALTER TABLE [dbo].[tbl_Footballers] CHECK CONSTRAINT [FK_tbl_Footballers_tbl_Teams]
GO
ALTER TABLE [dbo].[tbl_Match]  WITH CHECK ADD FOREIGN KEY([League])
REFERENCES [dbo].[tbl_League] ([League_ID])
GO
ALTER TABLE [dbo].[tbl_Match]  WITH CHECK ADD FOREIGN KEY([Stadium])
REFERENCES [dbo].[tbl_Stadium] ([Stadium_ID])
GO
ALTER TABLE [dbo].[tbl_Match]  WITH CHECK ADD FOREIGN KEY([Stadium])
REFERENCES [dbo].[tbl_Stadium] ([Stadium_ID])
GO
ALTER TABLE [dbo].[tbl_Match]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Match_tbl_Referee] FOREIGN KEY([Referee])
REFERENCES [dbo].[tbl_Referee] ([Referee_ID])
GO
ALTER TABLE [dbo].[tbl_Match] CHECK CONSTRAINT [FK_tbl_Match_tbl_Referee]
GO
ALTER TABLE [dbo].[tbl_Match]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Match_tbl_Teams] FOREIGN KEY([Home_Team])
REFERENCES [dbo].[tbl_Teams] ([Team_ID])
GO
ALTER TABLE [dbo].[tbl_Match] CHECK CONSTRAINT [FK_tbl_Match_tbl_Teams]
GO
ALTER TABLE [dbo].[tbl_Match]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Match_tbl_Teams1] FOREIGN KEY([Away_Team])
REFERENCES [dbo].[tbl_Teams] ([Team_ID])
GO
ALTER TABLE [dbo].[tbl_Match] CHECK CONSTRAINT [FK_tbl_Match_tbl_Teams1]
GO
ALTER TABLE [dbo].[tbl_Stadium]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Stadium_tbl_Teams] FOREIGN KEY([Owner_Team])
REFERENCES [dbo].[tbl_Teams] ([Team_ID])
GO
ALTER TABLE [dbo].[tbl_Stadium] CHECK CONSTRAINT [FK_tbl_Stadium_tbl_Teams]
GO
ALTER TABLE [dbo].[tbl_Teams]  WITH CHECK ADD FOREIGN KEY([Stadium])
REFERENCES [dbo].[tbl_Stadium] ([Stadium_ID])
GO
ALTER TABLE [dbo].[tbl_Teams]  WITH CHECK ADD FOREIGN KEY([Stadium])
REFERENCES [dbo].[tbl_Stadium] ([Stadium_ID])
GO
ALTER TABLE [dbo].[tbl_Teams]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Teams_tbl_League] FOREIGN KEY([League])
REFERENCES [dbo].[tbl_League] ([League_ID])
GO
ALTER TABLE [dbo].[tbl_Teams] CHECK CONSTRAINT [FK_tbl_Teams_tbl_League]
GO
ALTER TABLE [dbo].[tbl_User]  WITH CHECK ADD  CONSTRAINT [FK_tbl_User_tbl_Teams] FOREIGN KEY([Team])
REFERENCES [dbo].[tbl_Teams] ([Team_ID])
GO
ALTER TABLE [dbo].[tbl_User] CHECK CONSTRAINT [FK_tbl_User_tbl_Teams]
GO
/****** Object:  Trigger [dbo].[trig]    Script Date: 22.12.2017 00:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create trigger [dbo].[trig] on [dbo].[tbl_User]
after insert
as
begin
Update tbl_Teams set Selected=1 from inserted where  inserted.Team=tbl_Teams.Team_ID
end

GO
