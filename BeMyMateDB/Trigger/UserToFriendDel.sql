CREATE TRIGGER [UserToFriendDel]
	ON [User].[UserToFriend]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		DECLARE @TMP TABLE(i INT, userId INT, friendId INT);
		INSERT INTO @TMP(i, userId, friendId)
		SELECT ROW_NUMBER() OVER( ORDER BY userId, friendId) as 'i', userId, friendId
		FROM DELETED

		DECLARE @InsNum INT = (SELECT COUNT(userId) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			DECLARE @userId INT = (SELECT userId FROM @TMP WHERE i = @InsNum);
			DECLARE @friendId INT = (SELECT friendId FROM @TMP WHERE i = @InsNum);

			UPDATE [User].[UserToFriend]
			SET dtDeleted = GETDATE() 
			WHERE userId = @userId and friendId = @friendId

			SET @InsNum = @InsNum - 1;
		END
	END
