CREATE TRIGGER [MenuObj]
	ON [Application].[Menu]
	INSTEAD OF INSERT
	AS
	BEGIN
		DECLARE @TMP TABLE(i INT, id INT,  name VARCHAR(MAX), [level] INT, parentId INT, [order] INT, contextId INT)
		INSERT INTO @TMP(i, id, name, [order], contextId)
		SELECT ROW_NUMBER() OVER( ORDER BY id DESC) AS 'i', id, name, [order], contextId
		FROM INSERTED AS ins
		WHERE ins.objectId IS NULL

		DECLARE @InsNum INT = (SELECT COUNT(id) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			INSERT INTO [Security].[Object] (tableId) VALUES (2)
			DECLARE @objID INT = (SCOPE_IDENTITY());
			
			INSERT INTO [Application].[Menu] (id, name, objectId, [order], contextId)
			SELECT id, name, @objId, [order], contextId
			FROM @TMP as tmp
			WHERE tmp.i = @InsNum

			SET @InsNum = @InsNum - 1;
		END
	END
