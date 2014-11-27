CREATE TRIGGER [GroupObjectObj]
	ON [Security].[GroupObject]
	INSTEAD OF INSERT
	AS
	BEGIN
		DECLARE @TMP TABLE(i INT, id INT, name VARCHAR(MAX))
		INSERT INTO @TMP(i, id, name)
		SELECT ROW_NUMBER() OVER( ORDER BY id DESC) AS 'i', id, name
		FROM INSERTED AS ins
		WHERE ins.objectId IS NULL

		DECLARE @InsNum INT = (SELECT COUNT(id) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			INSERT INTO [Security].[Object] (tableId) VALUES (11)
			DECLARE @objID INT = (SCOPE_IDENTITY());
			
			INSERT INTO [Security].[GroupObject] (id, name, objectId)
			SELECT id, name, @objId
			FROM @TMP as tmp
			WHERE tmp.i = @InsNum

			SET @InsNum = @InsNum - 1;
		END
	END
