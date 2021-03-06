USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectById]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Users_SelectById]
				@Id int
AS
/*
	Declare @Id int = 6;

	Execute dbo.Users_SelectById @Id

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
		Where Id = @Id

END
GO
