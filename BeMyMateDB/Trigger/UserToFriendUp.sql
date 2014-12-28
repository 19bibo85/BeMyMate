CREATE TRIGGER [UserToFriendUp]
	ON [User].[UserToFriend]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		--DECLARE @TMP TABLE(i INT, userId INT, friendId INT);
		--INSERT INTO @TMP(i, userId, friendId)
		--SELECT ROW_NUMBER() OVER( ORDER BY userId, friendId) as 'i', userId, friendId
		--FROM INSERTED

		--DECLARE @InsNum INT = (SELECT COUNT(userId) FROM @TMP);

		--WHILE(@InsNum > 0)
		--BEGIN
		--	DECLARE @userId INT = (SELECT userId FROM @TMP WHERE i = @InsNum);
		--	DECLARE @friendId INT = (SELECT friendId FROM @TMP WHERE i = @InsNum);

		--	UPDATE [User].[UserToFriend]
		--	SET dtUpdated = GETDATE() 
		--	WHERE userId = @userId and friendId = @friendId

		--	SET @InsNum = @InsNum - 1;
		--END

		UPDATE [User].[UserToFriend]
		SET dtUpdated= GETDATE() 
		WHERE 
		userId IN (SELECT DISTINCT userId FROM INSERTED) and 
		friendId IN (SELECT DISTINCT friendId FROM INSERTED);
	END
