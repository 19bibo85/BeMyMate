CREATE TRIGGER [UserToNotificationTypeDel]
	ON [User].[UserToNotificationType]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		--DECLARE @TMP TABLE(i INT, userId INT, notificationTypeId INT);
		--INSERT INTO @TMP(i, userId, notificationTypeId)
		--SELECT ROW_NUMBER() OVER( ORDER BY userId, notificationTypeId) as 'i', userId, notificationTypeId
		--FROM DELETED

		--DECLARE @InsNum INT = (SELECT COUNT(userId) FROM @TMP);

		--WHILE(@InsNum > 0)
		--BEGIN
		--	DECLARE @userId INT = (SELECT userId FROM @TMP WHERE i = @InsNum);
		--	DECLARE @notificationTypeId INT = (SELECT notificationTypeId FROM @TMP WHERE i = @InsNum);

		--	UPDATE [User].[UserToNotificationType]
		--	SET dtDeleted = GETDATE() 
		--	WHERE userId = @userId and notificationTypeId = @notificationTypeId

		--	SET @InsNum = @InsNum - 1;
		--END

		UPDATE [User].[UserToNotificationType]
		SET dtDeleted = GETDATE() 
		WHERE 
		userId IN (SELECT DISTINCT userId FROM DELETED) and 
		notificationTypeId IN (SELECT DISTINCT notificationTypeId FROM DELETED);
	END
