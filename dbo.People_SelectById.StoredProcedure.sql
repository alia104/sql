USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[People_SelectById]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[People_SelectById]
			@Id int

as
/*
	Declare @Id int = 20;

	Execute dbo.People_SelectById @Id

*/


BEGIN

	SELECT [Id]
      ,[Name]
      ,[Age]
      ,[IsSmoker]
      ,[DateAdded]
      ,[DateModified]
      ,[UserId]
  FROM [dbo].[People]
  Where Id = @Id



END
GO
