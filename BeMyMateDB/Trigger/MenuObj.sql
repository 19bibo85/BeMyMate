CREATE TRIGGER [MenuObj]
	ON [Application].[Menu]
	INSTEAD OF INSERT
	AS
	BEGIN
		DECLARE @TMP TABLE(i INT, id INT,  name VARCHAR(MAX), [level] INT, parentId INT)
		INSERT INTO @TMP(i, id, name, [level], parentId)
		SELECT ROW_NUMBER() OVER( ORDER BY id DESC) AS 'i', id, name, [level], parentId
		FROM INSERTED AS ins
		WHERE ins.objectId IS NULL

		DECLARE @InsNum INT = (SELECT COUNT(id) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			INSERT INTO [Security].[Object] (objectTableId, dtCreated) VALUES (2, GETDATE())
			DECLARE @objID INT = (SCOPE_IDENTITY());
			
			INSERT INTO [Application].[Menu] (id, name, level, parentId, objectId, dtCreated)
			SELECT id, name, level, parentId, @objId, GETDATE()
			FROM @TMP as tmp
			WHERE tmp.i = @InsNum

			SET @InsNum = @InsNum - 1;
		END
	END
