CREATE PROCEDURE [User].[GetSettingQuestionnaireAnswer]
	@UserID INT = 0,
	@LanguageCode VARCHAR(MAX) = 'en-us'
AS
	DECLARE @TMP TABLE(ViewObjectId INT, EditObjectId INT, DeleteObjectId INT)

	INSERT @TMP	
	EXEC [Security].[GetUserSecurity] 
		 @UserID = @UserID

	SELECT pqr.Area, pqr.Questionnaire, par.Answer
	FROM (SELECT pq.id, par.Area, loc.name as Questionnaire
		  FROM @TMP as pqt 
		  INNER JOIN [User].[SettingQuestionnaire] as pq on pqt.ViewObjectId = pq.objectId		  
		  INNER JOIN [Application].[Localization] as loc on pq.refCode = loc.refCode
		  INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
		  INNER JOIN (SELECT pa.id, pa.name as Area
					  FROM [User].[SettingArea] as pa
					  INNER JOIN [Application].[Localization] as loc on pa.refCode = loc.refCode
					  INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
					  WHERE lan.code = @LanguageCode) as par on pq.areaId = par.id
		  WHERE lan.code = @LanguageCode)
		  as pqr
	INNER JOIN [User].[SettingQuestionnaireToAnswer] as pqa on pqr.id = pqa.questionnaireId
	INNER JOIN (SELECT pa.id, loc.name as Answer
				FROM @TMP as at
				INNER JOIN [User].[SettingAnswer] as pa on at.ViewObjectId = pa.objectId
				INNER JOIN [Application].[Localization] as loc on pa.refCode = loc.refCode
				INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
				WHERE lan.code = @LanguageCode) 
				as par
				on pqa.answerId = par.id
	ORDER BY pqr.Area, pqr.Questionnaire, par.Answer

RETURN 0
