USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_PaginationV2]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[Friends_PaginationV2]	
			@PageIndex int
			,@PageSize int


AS
/* ----- Test Code --------

		DECLARE @PageIndex int = 0
				,@PageSize int = 10

		EXECUTE dbo.Friends_PaginationV2
				@PageIndex
				,@PageSize	
						
*/

BEGIN

		Declare @offset int = @PageIndex * @PageSize


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
		ORDER BY Id

		OFFSET @offSet Rows
		Fetch Next @PageSize Rows ONLY

END
GO
