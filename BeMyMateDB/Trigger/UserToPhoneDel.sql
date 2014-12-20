CREATE TRIGGER [UserToPhoneDel]
	ON [User].[UserToPhone]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		DECLARE @TMP TABLE(i INT, userId INT, phoneId INT);
		INSERT INTO @TMP(i, userId, phoneId)
		SELECT ROW_NUMBER() OVER( ORDER BY userId, phoneId) as 'i', userId, phoneId
		FROM DELETED

		DECLARE @InsNum INT = (SELECT COUNT(userId) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			DECLARE @userId INT = (SELECT userId FROM @TMP WHERE i = @InsNum);
			DECLARE @phoneId INT = (SELECT phoneId FROM @TMP WHERE i = @InsNum);

			UPDATE [User].[UserToPhone]
			SET dtDeleted = GETDATE() 
			WHERE userId = @userId and phoneId = @phoneId

			SET @InsNum = @InsNum - 1;
		END
	END
