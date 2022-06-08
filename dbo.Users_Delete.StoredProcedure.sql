USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_Delete]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[Users_Delete]
			@Id int

as
/*---- Test Code -------

	Declare @Id int = 5

	Select *
	From dbo.Users
    WHERE Id = @Id;

	Execute dbo.Users_Delete @Id

	Select *
	From dbo.Users
    WHERE Id = @Id;

*/

BEGIN	

	DELETE FROM [dbo].[Users]
	WHERE Id = @Id;	

END
GO
