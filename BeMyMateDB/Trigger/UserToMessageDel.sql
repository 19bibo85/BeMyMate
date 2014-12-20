CREATE TRIGGER [UserToMessageDel]
	ON [User].[UserToMessage]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		DECLARE @TMP TABLE(i INT, receiverId INT, messageId INT);
		INSERT INTO @TMP(i, receiverId, messageId)
		SELECT ROW_NUMBER() OVER( ORDER BY receiverId, messageId) as 'i', receiverId, messageId
		FROM DELETED

		DECLARE @InsNum INT = (SELECT COUNT(receiverId) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			DECLARE @receiverId INT = (SELECT receiverId FROM @TMP WHERE i = @InsNum);
			DECLARE @messageId INT = (SELECT messageId FROM @TMP WHERE i = @InsNum);

			UPDATE [User].[UserToMessage]
			SET dtDeleted = GETDATE() 
			WHERE receiverId = @receiverId and messageId = @messageId

			SET @InsNum = @InsNum - 1;
		END
	END