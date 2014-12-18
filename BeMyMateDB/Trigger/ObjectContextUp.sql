CREATE TRIGGER [ObjectContextUp]
	ON [Application].[ObjectContext]
	FOR UPDATE
	AS
	BEGIN

		DECLARE @TMP TABLE(i INT, id INT);
		INSERT INTO @TMP(i, id)
		SELECT ROW_NUMBER() OVER( ORDER BY id) as 'i', id 
		FROM INSERTED

		DECLARE @InsNum INT = (SELECT COUNT(id) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN

			UPDATE [Application].[ObjectContext]
			SET dtUpdated = GETDATE()
			WHERE id = (SELECT id FROM @TMP WHERE i = @InsNum)

			SET @InsNum = @InsNum - 1;
		END
	END
