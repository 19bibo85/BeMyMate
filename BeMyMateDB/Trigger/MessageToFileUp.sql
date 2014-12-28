CREATE TRIGGER [MessageToFileUp]
	ON [User].[MessageToFile]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		--DECLARE @TMP TABLE(i INT, messageId INT, fileId INT);
		--INSERT INTO @TMP(i, messageId, fileId)
		--SELECT ROW_NUMBER() OVER( ORDER BY messageId, fileId) as 'i', messageId, fileId
		--FROM INSERTED

		--DECLARE @InsNum INT = (SELECT COUNT(messageId) FROM @TMP);

		--WHILE(@InsNum > 0)
		--BEGIN
		--	DECLARE @messageId INT = (SELECT messageId FROM @TMP WHERE i = @InsNum);
		--	DECLARE @fileId INT = (SELECT fileId FROM @TMP WHERE i = @InsNum);

		--	UPDATE [User].[MessageToFile]
		--	SET dtUpdated = GETDATE()
		--	WHERE messageId = @messageId and fileId = @fileId

		--	SET @InsNum = @InsNum - 1;
		--END

		UPDATE [User].[MessageToFile]
		SET dtUpdated = GETDATE() 
		WHERE 
		messageId IN (SELECT DISTINCT messageId FROM INSERTED) and 
		fileId IN (SELECT DISTINCT fileId FROM INSERTED);
	END
