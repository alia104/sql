USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Skills_Insert]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[Skills_Insert]
			@Name nvarchar(50)



/*


			Declare @Name nvarchar(50) = 'Talking to Animals';

			Execute dbo.Skills_Insert
					@Name

			SELECT *
			FROM dbo.Skills


*/

AS

BEGIN


			INSERT INTO [dbo].[Skills]
						([Name])

			VALUES								
						(@Name)

END
GO
