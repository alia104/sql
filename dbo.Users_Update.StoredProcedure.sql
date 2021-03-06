USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_Update]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Users_Update]
				@Id int
				,@FirstName nvarchar(100)
				,@LastName nvarchar(100) 
				,@Email nvarchar(100)
				,@AvatarUrl nvarchar(255) 
				,@TenantId nvarchar(30)  
				,@Password nvarchar(64) 

				--these are our parameters

AS
/* ------ Test Code ---------

		Declare @Id int = 4

		Declare @FirstName nvarchar(100) = 'LL'
			   ,@LastName nvarchar(100) = 'Cool J'
			   ,@Email nvarchar(100) = 'toocoolforschool@bops.com'
			   ,@AvatarUrl nvarchar(255) = 'https://tinyurl.com/yc3rbvac'
			   ,@TenantId nvarchar(30) = 'U02TAAAxxxx'
			   ,@Password nvarchar(64) = 'Ilovetocode1!'
			   		
		Select *
		From dbo.Users
		Where Id = @Id

		Execute dbo.Users_Update
								@FirstName
								,@LastName
								,@Email
								,@AvatarUrl
								,@TenantId
								,@Password
								,@Id
		
		Select *
		From dbo.Users

		Where Id = @Id

*/

BEGIN

	Declare @DateNow datetime2 = GETUTCDATE();


	UPDATE [dbo].[Users]
	   SET 
					[FirstName] = @FirstName
					,[LastName] = @LastName
					,[Email] = @Email
					,[AvatarUrl] = @AvatarUrl
					,[TenantId] = @TenantId
					,[Password] = @Password
					
		
		WHERE Id = @Id

END
GO
