CREATE PROCEDURE [User].[GetPrivacyInfo]
	@UserID INT = 0,
	@LanguageCode VARCHAR(MAX) = 'en-us'
AS

	DECLARE @TMP TABLE(ViewObjectId INT, EditObjectId INT, DeleteObjectId INT)
	
	INSERT @TMP	
	EXEC [Security].[GetUserSecurity]
		 @UserID = @UserID

	SELECT DISTINCT pqr.Area, pqr.name as Questionnaire, upir.name as Answer
	FROM (SELECT pq.id, loc.name, par.Area
		  FROM @TMP as pqt 
		  INNER JOIN [User].[PrivacyQuestionnaire] as pq on pqt.ViewObjectId = pq.objectId
		  INNER JOIN [Application].[Localization] as loc on pq.refCode = loc.refCode
		  INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
		  INNER JOIN (SELECT pa.id, pa.name as Area
					  FROM [User].[PrivacyArea] as pa
					  INNER JOIN [Application].[Localization] as loc on pa.refCode = loc.refCode
					  INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
					  WHERE lan.code = @LanguageCode) as par on pq.areaId = par.id
		  WHERE lan.code = @LanguageCode)
		  as pqr
	INNER JOIN (SELECT upi.questionnaireId, loc.name
				FROM [User].[UserPrivacyInfo] as upi
				INNER JOIN [User].[PrivacyAnswer] as pa on upi.answerId = pa.id
				INNER JOIN [Application].[Localization] as loc on pa.refCode = loc.refCode
				INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
				WHERE lan.code = @LanguageCode)
				as upir
				on pqr.id = upir.questionnaireId
RETURN 0
