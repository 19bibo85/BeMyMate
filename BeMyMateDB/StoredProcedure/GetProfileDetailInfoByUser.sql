CREATE PROCEDURE [User].[GetProfileDetailInfoByUser]
	@UserID INT = 0,
	@LanguageCode VARCHAR(MAX) = 'en-us'
AS

	DECLARE @TMP TABLE(ViewObjectId INT, EditObjectId INT, DeleteObjectId INT)
	
	INSERT @TMP	
	EXEC [Security].[GetSecurityByUser] 
		 @UserID = @UserID

	SELECT pqr.name as Questionnaire, upir.name as Answer
	FROM (SELECT pq.id, loc.name
		  FROM @TMP as pqt 
		  INNER JOIN [User].[ProfileQuestionnaire] as pq on pqt.ViewObjectId = pq.objectId
		  INNER JOIN [Application].[Localization] as loc on pq.refCode = loc.refCode
		  INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
		  WHERE lan.code = @LanguageCode)
		  as pqr
	LEFT OUTER JOIN (SELECT upi.questionnaireId, loc.name
					 FROM [User].[UserProfileInfo] as upi
					 INNER JOIN [User].[ProfileAnswer] as pa on upi.answerId = pa.id
					 INNER JOIN [Application].[Localization] as loc on pa.refCode = loc.refCode
					 INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
					 WHERE lan.code = @LanguageCode)
					 as upir
					 on pqr.id = upir.questionnaireId
RETURN 0
