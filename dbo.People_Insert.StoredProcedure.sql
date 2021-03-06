USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[People_Insert]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[People_Insert]


		 @PersonName nvarchar(50)
		,@Age int
		,@UserId nvarchar(128)
		,@IsASmoker bit
		,@Id int OUTPUT

AS
/* --------- Test Code -----------

	Declare @Id int =0

	Declare  @PersonName nvarchar(50) = 'Joe'
			,@Age int = 30
			,@UserId nvarchar(128) = '1234'
			,@IsASmoker bit = 0

	Execute dbo.People_Insert 
							@PersonName
							,@Age
							,@UserId
							,@IsASmoker
							,@Id OUTPUT

		Select @Id						

		Select *						
		From dbo.People

*/


BEGIN


	INSERT INTO [dbo].[People]
			   ([Name]
			   ,[Age]
			   ,[IsSmoker]
           
			   ,[UserId])
		 VALUES
			   (@PersonName
			   ,@Age
			   ,@IsASmoker
			   ,@UserId)

		SET @Id = SCOPE_IDENTITY()
		

END
GO
