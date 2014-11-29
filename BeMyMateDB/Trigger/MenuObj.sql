CREATE TRIGGER [MenuObj]
	ON [Application].[Menu]
	INSTEAD OF INSERT
	AS
	BEGIN
		DECLARE @TMP TABLE(i INT, id INT,  name VARCHAR(MAX), [level] INT, parentId INT, contextId INT)
		INSERT INTO @TMP(i, id, name, [level], parentId, contextId)
		SELECT ROW_NUMBER() OVER( ORDER BY id DESC) AS 'i', id, name, [level], parentId, contextId
		FROM INSERTED AS ins
		WHERE ins.objectId IS NULL

		DECLARE @InsNum INT = (SELECT COUNT(id) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			INSERT INTO [Security].[Object] (tableId) VALUES (2)
			DECLARE @objID INT = (SCOPE_IDENTITY());
			
			INSERT INTO [Application].[Menu] (id, name, level, parentId, objectId, contextId)
			SELECT id, name, level, parentId, @objId, contextId
			FROM @TMP as tmp
			WHERE tmp.i = @InsNum

			SET @InsNum = @InsNum - 1;
		END
	END
