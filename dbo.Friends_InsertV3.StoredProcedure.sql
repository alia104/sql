USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_InsertV3]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[Friends_InsertV3]

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

		Declare @Title nvarchar(120) = 'Sonic'
				,@Bio nvarchar(700) = 'Hes a blue hedgehog.'
				,@Summary nvarchar(255) = 'Best known for his speed.'
				,@Headline nvarchar(255) = 'Lets do it to it!'
				,@Slug nvarchar(100) = 'needforspeed'
				,@StatusId int = 1
				,@TypeId int = 1
				,@PrimaryImageUrl nvarchar(255) = 'https://tinyurl.com/mt8baaj8'
				,@SkillName nvarchar (50) = 'Super strength'				

		EXECUTE dbo.Friends_InsertV3
				@Title
				,@Bio
				,@Summary
				,@Headline
				,@Slug
				,@StatusId
				,@TypeId
				,@Url
				,@SkillName
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
						

		SET @Id = SCOPE_IDENTITY()


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
					,Skills = (
								Select s.Name
										, fs.SkillId as skillId
								FROM	dbo.FriendSkills as fs inner join dbo.Skills as s
														on fs.SkillId = s.Id

								Where fs.FriendId = f.Id
								FOR JSON AUTO
							)


		From dbo.FriendsV2 AS f INNER JOIN Images as i
							ON f.PrimaryImageId = i.Id

		ORDER BY f.Id
	
	   	

END
GO
