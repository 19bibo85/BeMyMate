CREATE TRIGGER [ReviewUp]
	ON [User].[Review]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		DECLARE @TMP TABLE(i INT, id INT);
		INSERT INTO @TMP(i, id)
		SELECT ROW_NUMBER() OVER( ORDER BY id) as 'i', id 
		FROM INSERTED

		DECLARE @InsNum INT = (SELECT COUNT(id) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN

			UPDATE [User].[Review]
			SET dtUpdated = GETDATE()
			WHERE id = (SELECT id FROM @TMP WHERE i = @InsNum)

			SET @InsNum = @InsNum - 1;
		END
	END
