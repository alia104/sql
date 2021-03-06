USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Search_PaginationV2]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[Friends_Search_PaginationV2]
			@PageIndex int
			,@PageSize int
			,@Query nvarchar(100)
		
AS
/* ---- Test Code ------

		DECLARE @PageIndex int = 0
				,@PageSize int = 5
				,@Query nvarchar(100) = 'Doctor'

		Execute dbo.Friends_Search_PaginationV2
				@PageIndex
				,@PageSize
				,@Query

		SELECT*
		From dbo.FriendsV2	
		
*/
		
BEGIN

		Declare @Offset int = @PageIndex * @PageSize

		SELECT	f.Id
				,i.Url as ImageUrl
				,i.Id as ImageId
				,i.TypeId as TypeId
				,f.Title
				,f.Bio
				,f.Summary
				,f.Headline
				,f.Slug
				,f.StatusId
				,f.DateCreated
				,f.DateModified
				,TotalCount = COUNT(1) OVER()

		FROM dbo.FriendsV2 AS f inner join dbo.Images as i
						on f.PrimaryImageId = i.Id

		WHERE (Title LIKE '%' + @Query + '%'
				OR Bio LIKE '%' + @Query + '%'
				OR Summary LIKE '%' + @Query + '%'
				OR Headline LIKE '%' + @Query + '%'
				OR Slug LIKE '%' + @Query + '%')

		ORDER BY Id

		OFFSET @Offset ROWS 
		FETCH NEXT @PageSize ROWS ONLY		
		
END
GO
