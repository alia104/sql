USE [C114_felicia.archuleta104_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Presidents_SelectByParty]    Script Date: 6/7/2022 18:57:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Presidents_SelectByParty]
				@PartyAffiliation nvarchar(50)
AS


/* ----- Test Code ------

Republican
Democrat

		DECLARE @PartyAffiliation nvarchar(50) = 'Republican'

		Execute dbo.Presidents_SelectByParty
				@PartyAffiliation

*/

BEGIN

		SELECT [Id]
			  ,[FirstName]
			  ,[LastName]
      
		  FROM [dbo].[Presidents]
		  WHERE PartyAffiliation = @PartyAffiliation
  



END
GO
