USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Pagination]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[Friends_Pagination]	
			@PageIndex int
			,@PageSize int

AS
/* ----- Test Code --------

		DECLARE @PageIndex int = 0
				,@PageSize int = 10

		Execute dbo.Friends_Pagination
				@PageIndex
				,@PageSize
						
*/

BEGIN

		Declare @offset int = @PageIndex * @PageSize


		SELECT	Id
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



		FROM dbo.Friends
		ORDER BY Id

		OFFSET @offSet Rows
		Fetch Next @PageSize Rows ONLY

END
GO
