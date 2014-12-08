CREATE TRIGGER [UserProfileInfoIns]
	ON [User].[User]
	AFTER INSERT
	AS
	BEGIN
		-- Index users insterting
		DECLARE @USER_LIST TABLE(i INT, id INT, name VARCHAR(MAX), email VARCHAR(MAX), username VARCHAR(MAX), [password] VARCHAR(MAX), typeId INT, avatarId INT, statusId INT, registrationStatusId INT);
		INSERT INTO @USER_LIST(i, id, name, email, username, [password], typeId, avatarId, statusId, registrationStatusId)
		SELECT ROW_NUMBER() OVER( ORDER BY id DESC ) AS 'i', id, name, email, username, [password], typeId, avatarId, statusId, registrationStatusId
		FROM INSERTED AS ins

		DECLARE @userNum INT = (SELECT COUNT(id) FROM @USER_LIST);
		WHILE(@userNum > 0)
		BEGIN
			DECLARE @UserID INT = (SELECT id FROM @USER_LIST as ins WHERE ins.i = @userNum);
			IF(@UserID IS NOT NULL)
			BEGIN 

				-- Assing user to a role
				INSERT INTO [Security].[RoleToUser] (roleId, userId)
				SELECT [role].id, @UserID
				FROM @USER_LIST as ul
				INNER JOIN [Security].[Role] on ul.typeId = [role].id
				WHERE ul.id = @UserID
				
				-- Get permissions of the user
				DECLARE @TMP TABLE(ViewObjectId INT, EditObjectId INT, DeleteObjectId INT);
				INSERT @TMP	EXEC [Security].[GetSecurityByUser] @UserID = @UserID

				-- Insert profile default profile info base on the permissions
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
	END
