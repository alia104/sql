USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectByIdV3]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[Friends_SelectByIdV3]
				@Id int
AS
/*
	Declare @Id int = 44;

	Execute dbo.Friends_SelectByIdV3 @Id

*/

BEGIN


		SELECT		 f.Id
					,i.Url as ImageUrl
					,i.Id as ImageId
					,i.TypeId as TypeId
					,f.Title
					,f.Bio
					,f.Summary
					,f.Headline
					,f.Slug
					,f.StatusId					
					,Skills = (
							Select s.Name as Name
							FROM	dbo.Skills as s inner join dbo.FriendSkills as fs
												on s.Id = fs.SkillId
							WHERE fs.FriendId = f.Id
							FOR JSON AUTO
							)
					,f.DateCreated
					,f.DateModified

		From dbo.FriendsV2 AS f INNER JOIN dbo.Images as i
							ON f.PrimaryImageId = i.Id
		WHERE f.Id = @Id
		

END
GO
