USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[People_DeleteByName]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[People_DeleteByName]
		@Name nvarchar(50)

AS
/*
		Declare @Name nvarchar(50) = 'Ronny'

		Select *
		From dbo.People
		WHERE Name = @Name;

		Execute dbo.People_DeleteByName @Name

		Select *
		From dbo.People
		WHERE Name = @Name;

*/


BEGIN

		DELETE FROM [dbo].[People]
		WHERE Name = @Name;
	
END
GO
