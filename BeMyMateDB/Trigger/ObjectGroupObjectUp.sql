CREATE TRIGGER [ObjectGroupObjectUp]
	ON [Security].[ObjectGroupObject]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		DECLARE @TMP TABLE(i INT, groupId INT, objectId INT);
		INSERT INTO @TMP(i, groupId, objectId)
		SELECT ROW_NUMBER() OVER( ORDER BY groupId, objectId) as 'i', groupId, objectId
		FROM INSERTED

		DECLARE @InsNum INT = (SELECT COUNT(groupId) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			DECLARE @groupId INT = (SELECT groupId FROM @TMP WHERE i = @InsNum);
			DECLARE @objectId INT = (SELECT objectId FROM @TMP WHERE i = @InsNum);

			UPDATE [Security].[ObjectGroupObject]
			SET dtUpdated = GETDATE() 
			WHERE groupId = @groupId and objectId = @objectId;

			SET @InsNum = @InsNum - 1;
		END
	END
