USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Update]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Friends_Update]
				@Title nvarchar(120)
				,@Bio nvarchar(700)
				,@Summary nvarchar(255)
				,@Headline nvarchar(255)
				,@Slug nvarchar(100)
				,@StatusId int
				,@PrimaryImageUrl nvarchar(255)
				,@UserId int
				,@Id int 

AS
/* ------ Test Code ---------

		Declare @Id int = 482

		Declare @Title nvarchar(120) = 'Monkey'
				,@Bio nvarchar(700) = 'Named after Jack Sparrow, this capuchin monkey is fiercely loyal to his owner Captain Barbossa.'
				,@Summary nvarchar(255) = 'Capuchin monkey sidekick with a rotten temper and an eye for treasure.'
				,@Headline nvarchar(255) = 'Youre Welcome'
				,@Slug nvarchar(100) = 'jackjack'
				,@StatusId int = 1
				,@PrimaryImageUrl nvarchar(255) = 'https://tinyurl.com/yw87k8jm'
				,@UserId int = 1

		SELECT *
		From dbo.Friends
		Where Id = @Id

		Execute dbo.Friends_Update
				@Title
				,@Bio
				,@Summary
				,@Headline
				,@Slug
				,@StatusId
				,@PrimaryImageUrl
				,@UserId
				,@Id 

		SELECT	*
		From dbo.Friends

*/

BEGIN

	Declare @DateNow datetime2 = GETUTCDATE();
	
	UPDATE [dbo].[Friends]
	   SET 
			[Title] = @Title
			,[Bio] = @Bio
			,[Summary] = @Summary
			,[Headline] = @Headline
			,[Slug] = @Slug
			,[StatusId] = @StatusId
			,PrimaryImageUrl = @PrimaryImageUrl
			,UserId = @UserId

	 WHERE Id = @Id

END
GO
