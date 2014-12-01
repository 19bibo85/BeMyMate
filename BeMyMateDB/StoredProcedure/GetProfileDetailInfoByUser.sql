CREATE PROCEDURE [User].[GetProfileDetailInfoByUser]
	@UserID INT = 1,
	@LanguageCode VARCHAR(MAX) = 'en-us'
AS
	DECLARE @TMP TABLE(ViewObjectId INT, EditObjectId INT, DeleteObjectId INT)

	INSERT @TMP	
	EXEC [Security].[GetSecurityByUser] 
		@UserID = @UserID

	SELECT pqr.name as Questionnaire, par.name as Answer
	FROM (SELECT pq.id, loc.name
		  FROM @TMP as pqt 
		  INNER JOIN [User].[ProfileQuestionnaire] as pq on pqt.ViewObjectId = pq.objectId
		  INNER JOIN [Application].[Localization] as loc on pq.refCode = loc.refCode
		  INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
		  WHERE lan.code = @LanguageCode)
		  as pqr
	INNER JOIN [User].[ProfileQuestionnaireToAnswer] as pqa on pqr.id = pqa.questionnaireId
	INNER JOIN (SELECT pa.id, loc.name
				FROM @TMP as at
				INNER JOIN [User].[ProfileAnswer] as pa on at.ViewObjectId = pa.objectId
				INNER JOIN [Application].[Localization] as loc on pa.refCode = loc.refCode
				INNER JOIN [Application].[Language] as lan on loc.languageId = lan.id
				WHERE lan.code = @LanguageCode) 
				as par
				on pqa.answerId = par.id
	ORDER BY pqr.name, par.name

RETURN 0
