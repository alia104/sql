USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Insert]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[Friends_Insert]
				@Title nvarchar(120)
				,@Bio nvarchar(700)
				,@Summary nvarchar(255)
				,@Headline nvarchar(255)
				,@Slug nvarchar(100)
				,@StatusId int
				,@PrimaryImageUrl nvarchar(255)
				,@UserId int
				,@Id int OUTPUT

AS
/* ---------- Test Code ---------

		Declare @Id int = 0

		Declare @PersonTitle nvarchar(120) = 'Pirate'
				,@PersonBio nvarchar(700) = 'Captain of the Black Pearl and legendary pirate of the Seven Seas, Captain Jack Sparrow is the irreverent trickster of the Caribbean.'
				,@PersonSum nvarchar(255) = 'A captain of equally dubious morality and sobriety, a master of self-promotion and self interest, he ﬁghts a constant and losing battle with his own best tendencies.'
				,@Headliner nvarchar(255) = 'But you have heard of me!'
				,@Slug nvarchar(100) = 'rumisgone'
				,@StatusId int = 1
				,@PrimaryImageUrl nvarchar(255) = 'https://tinyurl.com/yw87k8jm'
				,@UserId int = 3

		Execute dbo.Friends_Insert
				@PersonTitle
				,@PersonBio
				,@PersonSum
				,@Headliner
				,@Slug
				,@StatusId
				,@PrimaryImageUrl
				,@UserId
				,@Id OUTPUT

		

		SELECT	Id
				,Title
				,Bio
				,Summary
				,Headline
				,Slug
				,StatusId
				,PrimaryImageUrl
				,UserId
				,DateCreated
				,DateModified

		From dbo.Friends
		Where Id = @Id

*/


BEGIN
		
		INSERT INTO [dbo].[Friends]
					([Title]
					,[Bio]
					,[Summary]
					,[Headline]
					,[Slug]
					,[StatusId]
					,PrimaryImageUrl
					,UserId)
		VALUES
					(@Title
					,@Bio
					,@Summary
					,@Headline
					,@Slug
					,@StatusId
					,@PrimaryImageUrl
					,@UserId)

		SET @Id = SCOPE_IDENTITY()
	
END
GO
