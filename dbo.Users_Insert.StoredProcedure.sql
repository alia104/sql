USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_Insert]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Users_Insert]
				@FirstName nvarchar(100)
			   ,@LastName nvarchar(100) 
			   ,@Email nvarchar(100)
			   ,@AvatarUrl nvarchar(255) 
			   ,@TenantId nvarchar(30)  
			   ,@Password nvarchar(64) 
			   ,@Id int OUTPUT

AS

/* ------ Test Code ------

		Declare @Id int = 0

		Declare @FirstName nvarchar(100) = 'Too'
			   ,@LastName nvarchar(100) = 'Short'
			   ,@Email nvarchar(100) = 'tooshort@bops.com'
			   ,@AvatarUrl nvarchar(255) = 'www.google.com'
			   ,@TenantId nvarchar(30) = 'U02TAAAxxxx'
			   ,@Password nvarchar(64) = 'Ilovetocode1!'

		Execute dbo.Users_Insert
								@FirstName
								,@LastName
								,@Email
								,@AvatarUrl
								,@TenantId
								,@Password
								,@Id OUTPUT

		Select @Id

		Select *
		From dbo.Users

		Where Id = @Id

*/


BEGIN	

		INSERT INTO [dbo].[Users]
				([FirstName]
				,[LastName]
				,[Email]
				,[AvatarUrl]
				,[TenantId]
				,[Password]
				)
		 VALUES
			   (@FirstName
			   ,@LastName
			   ,@Email
			   ,@AvatarUrl
			   ,@TenantId
			   ,@Password
			   )


		SET @Id = SCOPE_IDENTITY()
		

END
GO
