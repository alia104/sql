USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Search_PaginationV3]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[Friends_Search_PaginationV3]
			@PageIndex int
			,@PageSize int
			,@Query nvarchar(100)
		
AS
/* ---- Test Code ------

		DECLARE @PageIndex int = 0
				,@PageSize int = 10
				,@Query nvarchar(100) = 'Doctor'

		Execute dbo.Friends_Search_PaginationV3
				@PageIndex
				,@PageSize
				,@Query


*/

BEGIN

		Declare @Offset int = @PageIndex * @PageSize

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


		WHERE (Title LIKE '%' + @Query + '%'
				OR Bio LIKE '%' + @Query + '%'
				OR Summary LIKE '%' + @Query + '%'
				OR Headline LIKE '%' + @Query + '%'
				OR Slug LIKE '%' + @Query + '%')
			


		ORDER BY f.Id
		OFFSET @Offset ROWS 
		FETCH NEXT @PageSize ROWS ONLY 



END
GO
