USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectByIdV2]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[Friends_SelectByIdV2]
				@Id int
AS
/*
	Declare @Id int = 22;

	Execute dbo.Friends_SelectByIdV2 
				@Id

*/

BEGIN


			SELECT 	f.Id
					,i.Url
					,i.Id as ImageId
					,i.TypeId as TypeId
					,f.Title
					,f.Bio
					,f.Summary
					,f.Headline
					,f.Slug
					,f.StatusId
		
			FROM dbo.FriendsV2 as f inner join dbo.Images as i
				on f.PrimaryImageId = i.Id

			WHERE f.Id = @Id
		

END
GO
