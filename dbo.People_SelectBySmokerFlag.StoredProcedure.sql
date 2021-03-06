USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[People_SelectBySmokerFlag]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[People_SelectBySmokerFlag]
			@SmokerFlag bit

as
/*
	Declare @SmokerFlag bit = null

	Execute dbo.[People_SelectBySmokerFlag] @SmokerFlag

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
		Where ([IsSmoker] = @SmokerFlag) OR
				(@SmokerFlag IS NULL AND [IsSmoker] IS NULL)

			   
END
GO
