CREATE PROCEDURE [User].[GetProfileDetailInfo]
	@UserID INT = 0,
	@UserGuid uniqueidentifier = null,
	@LanguageCode VARCHAR(MAX) = 'en-us'
AS

	DECLARE @TMP TABLE(ViewObjectId INT, EditObjectId INT, DeleteObjectId INT)
	
	INSERT @TMP	
	EXEC [Security].[GetSecurity]
		 @UserID = @UserID,
		 @UserGuid = @UserGuid

	SELECT DISTINCT pqr.Area, pqr.name as Questionnaire, upir.name as Answer
	FROM (SELECT pq.id, loc.name, par.Area
		  FROM @TMP as pqt 
		  INNER JOIN [User].[ProfileQuestionnaire] as pq on pqt.ViewObjectId = pq.objectId
		  INNER JOIN [Application].[Localization] as loc on pq.refCode = loc.refCode
		  INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
		  INNER JOIN (SELECT pa.id, pa.name as Area
					  FROM [User].[ProfileArea] as pa
					  INNER JOIN [Application].[Localization] as loc on pa.refCode = loc.refCode
					  INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
					  WHERE lan.code = @LanguageCode) as par on pq.areaId = par.id
		  WHERE lan.code = @LanguageCode)
		  as pqr
	INNER JOIN (SELECT upi.questionnaireId, loc.name
				FROM [User].[UserProfileInfo] as upi
				INNER JOIN [User].[ProfileAnswer] as pa on upi.answerId = pa.id
				INNER JOIN [Application].[Localization] as loc on pa.refCode = loc.refCode
				INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
				WHERE lan.code = @LanguageCode)
				as upir
				on pqr.id = upir.questionnaireId
RETURN 0
