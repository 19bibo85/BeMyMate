CREATE PROCEDURE [User].[SetUserPrivacy]
	@userId INT = NULL
AS
	SET @userId = (SELECT u.id FROM [User].[User] as u WHERE u.id = @userId);
	
	IF(@userId IS NOT NULL)
	BEGIN
		-- Get permissions of the user
		DECLARE @TMP TABLE(ViewObjectId INT, EditObjectId INT, DeleteObjectId INT);
		INSERT @TMP	EXEC [Security].[GetUserSecurity] @UserID = @UserID

		-- Insert default privacy info base on the permissions
		INSERT INTO [User].[UserSettingInfo] (userId, questionnaireId, answerId)
		SELECT @UserID, pq.id, pa.id
		FROM @TMP as pqt 
		INNER JOIN [User].[SettingQuestionnaire] as pq on pqt.ViewObjectId = pq.objectId
		INNER JOIN [User].[SettingQuestionnaireToAnswer] as pqa on pq.id = pqa.questionnaireId
		INNER JOIN [User].[SettingAnswer] as pa on pqa.answerId = pa.id
		WHERE pa.isDefault = 1
	END
RETURN 0
