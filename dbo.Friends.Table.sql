USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 6/7/2022 18:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](120) NULL,
	[Bio] [nvarchar](700) NULL,
	[Summary] [nvarchar](255) NULL,
	[Headline] [nvarchar](255) NULL,
	[Slug] [nvarchar](100) NULL,
	[StatusId] [int] NULL,
	[PrimaryImageUrl] [nvarchar](255) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Friends_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Friends] ADD  CONSTRAINT [DF_Friends_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Friends] ADD  CONSTRAINT [DF_Friends_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
