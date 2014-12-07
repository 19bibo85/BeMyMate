CREATE PROCEDURE [User].[InsertUserProfileInfo]
AS
	DECLARE @USER_LIST TABLE(i INT, userId INT);
	INSERT INTO @USER_LIST(i, userId)
	SELECT ROW_NUMBER() OVER( ORDER BY u.id ) AS 'i', u.id
	FROM [User].[User] as u

	DECLARE @userNum INT = (SELECT COUNT(userId) FROM @USER_LIST);

	WHILE(@userNum > 0)
	BEGIN
	DECLARE @UserID INT = (SELECT userId FROM @USER_LIST as ins WHERE ins.i = @userNum);
		IF(@UserID IS NOT NULL)
		BEGIN 
			DECLARE @TMP TABLE(ViewObjectId INT, EditObjectId INT, DeleteObjectId INT);
			INSERT @TMP	EXEC [Security].[GetSecurityByUser] @UserID = @UserID

			INSERT INTO [User].[UserProfileInfo] (userId, questionnaireId, answerId)
			SELECT @UserID, pq.id, pa.id
			FROM @TMP as pqt 
			INNER JOIN [User].[ProfileQuestionnaire] as pq on pqt.ViewObjectId = pq.objectId
			INNER JOIN [User].[ProfileQuestionnaireToAnswer] as pqa on pq.id = pqa.questionnaireId
			INNER JOIN [User].[ProfileAnswer] as pa on pqa.answerId = pa.id
			WHERE pa.isDefault = 1
		END

	SET @userNum = @userNum - 1;
	END
RETURN 0
