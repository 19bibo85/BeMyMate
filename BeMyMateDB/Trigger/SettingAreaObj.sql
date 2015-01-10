CREATE TRIGGER [SettingAreaObj]
	ON [User].[SettingArea]
	INSTEAD OF INSERT
	AS
	BEGIN
		DECLARE @TMP TABLE(i INT, id INT,  name VARCHAR(MAX), contextId INT)
		INSERT INTO @TMP(i, id, name, contextId)
		SELECT ROW_NUMBER() OVER( ORDER BY id DESC) AS 'i', id, name, contextId
		FROM INSERTED AS ins
		WHERE ins.objectId IS NULL

		DECLARE @InsNum INT = (SELECT COUNT(id) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			INSERT INTO [Security].[Object] (tableId) VALUES (20)
			DECLARE @objID INT = (SCOPE_IDENTITY());
			
			INSERT INTO [User].[SettingArea] (id, name, objectId, contextId)
			SELECT id, name, @objId, contextId
			FROM @TMP as tmp
			WHERE tmp.i = @InsNum

			SET @InsNum = @InsNum - 1;
		END
	END
