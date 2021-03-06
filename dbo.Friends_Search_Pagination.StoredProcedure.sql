USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Search_Pagination]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[Friends_Search_Pagination]
			@PageIndex int
			,@PageSize int
			,@Query nvarchar(100)
	
AS
/* ---- Test Code ------

		DECLARE @PageIndex int = 0
				,@PageSize int = 5
				,@Query nvarchar(100) = 'Monkey'

		Execute dbo.Friends_Search_Pagination
				@PageIndex
				,@PageSize
				,@Query

*/


BEGIN

		Declare @Offset int = @PageIndex * @PageSize

		SELECT  Id
				,Title
				,Bio
				,Summary
				,Headline
				,Slug
				,StatusId
				,PrimaryImageUrl
				,DateCreated
				,DateModified
				,TotalCount = COUNT(1) OVER()


		FROM [dbo].[Friends]

		WHERE (Title LIKE '%' + @Query + '%')

		ORDER BY Id
		OFFSET @Offset ROWS 
		FETCH NEXT @PageSize ROWS ONLY 

END
GO
