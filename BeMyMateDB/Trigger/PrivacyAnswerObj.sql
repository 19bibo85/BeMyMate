CREATE TRIGGER [PrivacyAnswerObj]
	ON [User].[PrivacyAnswer]
	INSTEAD OF INSERT
	AS
	BEGIN
		DECLARE @TMP TABLE(i INT, id INT,  name VARCHAR(MAX), contextId INT, isDefault INT)
		INSERT INTO @TMP(i, id, name, contextId, isDefault)
		SELECT ROW_NUMBER() OVER( ORDER BY id DESC) AS 'i', id, name, contextId, isDefault
		FROM INSERTED AS ins
		WHERE ins.objectId IS NULL

		DECLARE @InsNum INT = (SELECT COUNT(id) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			INSERT INTO [Security].[Object] (tableId) VALUES (21)
			DECLARE @objID INT = (SCOPE_IDENTITY());
			
			INSERT INTO [User].[PrivacyAnswer] (id, name, objectId, contextId, isDefault)
			SELECT id, name, @objId, contextId, isDefault
			FROM @TMP as tmp
			WHERE tmp.i = @InsNum

			SET @InsNum = @InsNum - 1;
		END
	END
