USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_Pagination]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[Users_Pagination]	
			@PageIndex int
			,@PageSize int


/* ----- Test Code --------

		Declare @PageIndex int = 0
				,@PageSize int = 5

		Execute dbo.Users_Pagination
				@PageIndex
				,@PageSize


*/

AS

BEGIN

		Declare @offset int = @PageIndex * @PageSize

		SELECT	Id
				,FirstName
				,LastName
				,Email
				,AvatarUrl
				,TenantId
				,Password
				,DateCreated
				,DateModified
				,TotalCount = COUNT(1) OVER() 

		FROM dbo.Users
		ORDER BY Id

		OFFSET @offSet Rows
		Fetch Next @PageSize Rows ONLY

END
GO
