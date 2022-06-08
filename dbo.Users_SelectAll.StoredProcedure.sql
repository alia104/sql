USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectAll]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[Users_SelectAll]
				
AS
/* ----- Test Code ------
	

	Execute dbo.Users_SelectAll

*/

BEGIN


		SELECT [Id]
				,[FirstName]
				,[LastName]
				,[Email]
				,[AvatarUrl]
				,[TenantId]
				,[Password]
				,[DateCreated]
				,[DateModified]
		FROM [dbo].[Users]
		
END
GO
