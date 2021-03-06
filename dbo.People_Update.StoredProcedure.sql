USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[People_Update]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[People_Update]
		@PersonName nvarchar(50)
		,@Age int
		,@UserId nvarchar(128)
		,@IsASmoker bit
		,@Id int 
as
/* ----- Test Code --------

	Declare @Id int =20

	Declare @PersonName nvarchar(50) = 'Joe'
		,@Age int = 55
		,@UserId nvarchar(128) = '444444'
		,@IsASmoker bit = 1

	Select *
	From dbo.People
	Where Id = @Id

	Execute dbo.People_Update 
							@PersonName
							,@Age
							,@UserId
							,@IsASmoker
							,@Id 

		Select *
		From dbo.People
		Where Id = @Id
		
*/

BEGIN

	Declare @DateNow datetime2 = GETUTCDATE();

	UPDATE [dbo].[People]
	   SET [Name] = @PersonName
		  ,[IsSmoker] = @IsASmoker
		  ,[DateModified] = @DateNow
		  ,[UserId] = @UserId
		  ,[Age] = @Age

		WHERE Id = @Id


END
GO
