CREATE TRIGGER [UserToMessageUp]
	ON [User].[UserToMessage]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		--DECLARE @TMP TABLE(i INT, receiverId INT, messageId INT);
		--INSERT INTO @TMP(i, receiverId, messageId)
		--SELECT ROW_NUMBER() OVER( ORDER BY receiverId, messageId) as 'i', receiverId, messageId
		--FROM INSERTED

		--DECLARE @InsNum INT = (SELECT COUNT(receiverId) FROM @TMP);

		--WHILE(@InsNum > 0)
		--BEGIN
		--	DECLARE @receiverId INT = (SELECT receiverId FROM @TMP WHERE i = @InsNum);
		--	DECLARE @messageId INT = (SELECT messageId FROM @TMP WHERE i = @InsNum);

		--	UPDATE [User].[UserToMessage]
		--	SET dtUpdated = GETDATE() 
		--	WHERE receiverId = @receiverId and messageId = @messageId

		--	SET @InsNum = @InsNum - 1;
		--END

		UPDATE [User].[UserToMessage]
		SET dtUpdated = GETDATE() 
		WHERE 
		receiverId IN (SELECT DISTINCT receiverId FROM INSERTED) and 
		messageId IN (SELECT DISTINCT messageId FROM INSERTED);
	END