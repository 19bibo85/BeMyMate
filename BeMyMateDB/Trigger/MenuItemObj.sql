CREATE TRIGGER [MenuItemObj]
	ON [Application].[MenuItem]
	INSTEAD OF INSERT
	AS
	BEGIN
		DECLARE @TMP TABLE(i INT, id INT, name VARCHAR(MAX), link VARCHAR(MAX), contextId INT)
		INSERT INTO @TMP(i, id, name, link, contextId)
		SELECT ROW_NUMBER() OVER( ORDER BY id DESC) AS 'i', id, name, link, contextId
		FROM INSERTED AS ins
		WHERE ins.objectId IS NULL

		DECLARE @InsNum INT = (SELECT COUNT(id) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			INSERT INTO [Security].[Object] (tableId) VALUES (3)
			DECLARE @objID INT = (SCOPE_IDENTITY());
			
			INSERT INTO [Application].[MenuItem] (id, name, link, objectId, contextId)
			SELECT id, name, link, @objId, contextId
			FROM @TMP as tmp
			WHERE tmp.i = @InsNum

			SET @InsNum = @InsNum - 1;
		END
	END