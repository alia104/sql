USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Courses_SelectById]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[Courses_SelectById]
			@Id int

AS
/*
		Declare @Id int = 6;

		Execute dbo.Courses_SelectById
				@Id


*/


BEGIN

			SELECT	c.Id
					,c.Name
					,c.Description
					,st.Term as SeasonTerm
					,t.Name as Teacher
					,Student = (
								Select s.Id as Id
										,s.Name as Name
								FROM dbo.Student as s inner join dbo.StudentCourses as sc
												on s.Id = sc.StudentId

								Where sc.CourseId = c.Id
								FOR JSON AUTO
								)
					
			From dbo.Course AS c inner join dbo.Teacher as t
								on c.TeacherId = t.Id 
								
								inner join dbo.SeasonTerms as st
								on c.SeasonTermId = st.Id
			
			Where c.Id = @Id
			ORDER BY c.Id

END
GO
