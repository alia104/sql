USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Course_Insert]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[Course_Insert]

			@Name nvarchar(50)
			,@Description nvarchar(120)
			,@SeasonTermId int
			,@TeacherId int
			,@Id int OUTPUT

AS
/* ------ Test Code ---------

		Declare @Id int =0

		Declare @Name nvarchar(50) = 'Astronomy'
				,@Description nvarchar(120) = 'Observations of the night skies with telescopes.'
				,@SeasonTermId int = 2
				,@TeacherId int = 4

		EXECUTE dbo.Course_Insert
				@Name
				,@Description
				,@SeasonTermId
				,@TeacherId
				,@Id OUTPUT

*/


BEGIN
						
			INSERT INTO [dbo].[Course]
						([Name]
						,[Description]
						,[SeasonTermId]
						,[TeacherId])

			VALUES
						(@Name
						,@Description
						,@SeasonTermId
						,@TeacherId)


			SET @Id = SCOPE_IDENTITY()

			Select
					c.Id
					,c.Name
					,c.Description
					,c.SeasonTermId
					,c.TeacherId
					,s.Id
					,s.Term
					,t.Name

			From dbo.Course AS c inner join dbo.SeasonTerms as s
							ON c.SeasonTermId = s.Id
				
								inner join dbo.Teacher as t
								ON c.TeacherId = t.Id

END




GO
