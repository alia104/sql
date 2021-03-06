USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_InsertV2]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[Friends_InsertV2]

				@Title nvarchar(120)
				,@Bio nvarchar(700)
				,@Summary nvarchar(255)
				,@Headline nvarchar(255)
				,@Slug nvarchar(100)
				,@StatusId int
				,@TypeId int
				,@PrimaryImageUrl nvarchar(255)
				,@UserId int
				,@Id int OUTPUT
				
							   
AS
/* ---------- Test Code ---------

		Declare @Id int = 0

		Declare @Title nvarchar(120) = 'Physician'
				,@Bio nvarchar(700) = 'The greatest doctor ever '
				,@Summary nvarchar(255) = 'The best doctor in the universe.'
				,@Headline nvarchar(255) = 'Health is wealth!'
				,@Slug nvarchar(100) = 'doc4life'
				,@StatusId int = 1
				,@TypeId int = 1
				,@PrimaryImageUrl nvarchar(255) = 'https://tinyurl.com/5729enw9'
				,@UserId int = 3
				

		EXECUTE dbo.Friends_InsertV2
				@Title
				,@Bio
				,@Summary
				,@Headline
				,@Slug
				,@StatusId
				,@TypeId
				,@PrimaryImageUrl
				,@UserId
				,@Id OUTPUT	
												
*/


BEGIN

		DECLARE @ImageId int = 0
			

		INSERT INTO dbo.Images
					(TypeId
					,Url)

		VALUES		
					(@TypeId
					,@PrimaryImageUrl)


		SET @ImageId = SCOPE_IDENTITY()	
								   				 
			
		INSERT INTO [dbo].[FriendsV2]
					([Title]
					,[Bio]
					,[Summary]
					,[Headline]
					,[Slug]
					,[StatusId]
					,PrimaryImageId
					,UserId)
		VALUES
					(@Title
					,@Bio
					,@Summary
					,@Headline
					,@Slug
					,@StatusId
					,@ImageId
					,@UserId)
						

		Select		f.Id
					,f.PrimaryImageId as ImageId
					,f.StatusId
					,f.Title
					,f.Bio
					,f.Summary
					,f.Headline
					,f.Slug
					,f.DateCreated
					,f.DateModified


		From dbo.FriendsV2 AS f inner join dbo.Images as i
						ON f.PrimaryImageId =i.Id
	   	
END
GO
