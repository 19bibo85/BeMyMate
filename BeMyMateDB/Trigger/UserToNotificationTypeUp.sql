CREATE TRIGGER [UserToNotificationTypeUp]
	ON [User].[UserToNotificationType]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		--DECLARE @TMP TABLE(i INT, userId INT, notificationTypeId INT);
		--INSERT INTO @TMP(i, userId, notificationTypeId)
		--SELECT ROW_NUMBER() OVER( ORDER BY userId, notificationTypeId) as 'i', userId, notificationTypeId
		--FROM INSERTED

		--DECLARE @InsNum INT = (SELECT COUNT(userId) FROM @TMP);

		--WHILE(@InsNum > 0)
		--BEGIN
		--	DECLARE @userId INT = (SELECT userId FROM @TMP WHERE i = @InsNum);
		--	DECLARE @notificationTypeId INT = (SELECT notificationTypeId FROM @TMP WHERE i = @InsNum);

		--	UPDATE [User].[UserToNotificationType]
		--	SET dtUpdated = GETDATE() 
		--	WHERE userId = @userId and notificationTypeId = @notificationTypeId

		--	SET @InsNum = @InsNum - 1;
		--END

		UPDATE [User].[UserToNotificationType]
		SET dtUpdated = GETDATE() 
		WHERE 
		userId IN (SELECT DISTINCT userId FROM INSERTED) and 
		notificationTypeId IN (SELECT DISTINCT notificationTypeId FROM INSERTED);
	END
