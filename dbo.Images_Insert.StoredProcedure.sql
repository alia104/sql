USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Images_Insert]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Images_Insert]
				@TypeId int
				,@Url nvarchar(255)
				,@Id int OUTPUT

AS
/* --- Test Code -----

	Declare @Id int = 67

	Declare @TypeId int =1
			,@Url nvarchar(255) = 'https://tinyurl.com/4k3bn7rf'

	
	Execute dbo.Images_Insert
				@TypeId
				,@Url
				,@Id OUTPUT

	Select @Id
	Select *
	From dbo.Images
	   
*/

BEGIN

		INSERT INTO [dbo].[Images]
					([TypeId]
					,[Url])
		VALUES
		(@TypeId
		,@Url)
		
END
GO
