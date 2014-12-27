CREATE PROCEDURE [Security].[SetUserSecurity]
	@userId INT = NULL,
	@groupId INT = NULL
AS
	SET @userId = (SELECT u.id FROM [User].[User] as u WHERE u.id = @userId);
	SET @groupId = (SELECT grp.id FROM [Security].[Group] as grp WHERE grp.id = @groupId);
	
	IF(@userId IS NOT NULL AND @groupId IS NOT NULL)
	BEGIN
		-- Assing user to a role
		INSERT INTO [Security].[RoleToUser] (roleId, userId)
		SELECT grpToRol.roleId, @userID
		FROM [group] as grp
		INNER JOIN GroupToRole as grpToRol on grp.id = grpToRol.groupId 
		WHERE grp.id = @groupId
				
		-- Get permissions of the user
		DECLARE @TMP TABLE(ViewObjectId INT, EditObjectId INT, DeleteObjectId INT);
		INSERT @TMP	EXEC [Security].[GetSecurity] @UserID = @UserID

		-- Insert default profile info base on the permissions
		INSERT INTO [User].[UserProfileInfo] (userId, questionnaireId, answerId)
		SELECT @UserID, pq.id, pa.id
		FROM @TMP as pqt 
		INNER JOIN [User].[ProfileQuestionnaire] as pq on pqt.ViewObjectId = pq.objectId
		INNER JOIN [User].[ProfileQuestionnaireToAnswer] as pqa on pq.id = pqa.questionnaireId
		INNER JOIN [User].[ProfileAnswer] as pa on pqa.answerId = pa.id
		WHERE pa.isDefault = 1
	END
RETURN 0
