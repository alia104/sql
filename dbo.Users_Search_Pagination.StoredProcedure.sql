USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_Search_Pagination]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[Users_Search_Pagination]
			@PageIndex int
			,@PageSize int
			,@Query nvarchar(100)

AS

/* ----- Test Code -----

		DECLARE @PageIndex int = 0
				,@PageSize int = 2
				,@Query nvarchar(100) = 'LL'

		Execute dbo.Users_Search_Pagination
				@PageIndex
				,@PageSize
				,@Query

		SELECT*
		From dbo.Users		

*/

BEGIN

		Declare @Offset int = @PageIndex * @PageSize

		SELECT Id
				,FirstName
				,LastName
				,Email
				,AvatarUrl
				,TenantId
				,Password
				,DateCreated
				,DateModified

		FROM [dbo].[Users]

		WHERE (FirstName LIKE '%' + @Query + '%' OR 
         lastName LIKE '%' + @Query + '%')

		ORDER BY Id
		OFFSET @Offset ROWS
		FETCH NEXT @PageSize ROWS ONLY

END
GO
