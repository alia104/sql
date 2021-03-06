USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Presidents_Insert]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Presidents_Insert]
				@FirstName nvarchar(128)
				,@LastName nvarchar(128)
				,@InaugurationDate nvarchar(50)
				,@FirstYearInOffice int
				,@LastYearInOffice int
				,@PartyAffiliation nvarchar(50)
				,@Id int OUTPUT

AS
/* ----- Test Code -------

		DECLARE @Id int = 0

		DECLARE @FirstName nvarchar(128)='Barack'
				,@LastName nvarchar(128)='Obama'
				,@InaugurationDate nvarchar(50)='January 20, 2009'
				,@FirstYearInOffice int= 2008
				,@LastYearInOffice int= 2016
				,@PartyAffiliation nvarchar(50)='Democratic'

		Execute dbo.Presidents_Insert
				@FirstName
				,@LastName
				,@InaugurationDate
				,@FirstYearInOffice
				,@LastYearInOffice
				,@PartyAffiliation
				,@Id OUTPUT

		
		Select 
				FirstName
				,LastName
				,PartyAffiliation
		
		From dbo.Presidents

*/


BEGIN
		
		INSERT INTO [dbo].[Presidents]
					([FirstName]
					,[LastName]
					,[InaugurationDate]
					,[FirstYearInOffice]
					,[LastYearInOffice]
					,[PartyAffiliation])
		VALUES
					(@FirstName
					,@LastName
					,@InaugurationDate
					,@FirstYearInOffice
					,@LastYearInOffice
					,@PartyAffiliation)

		SET @Id = SCOPE_IDENTITY()



END
GO
