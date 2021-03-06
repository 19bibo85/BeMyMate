﻿CREATE TRIGGER [ProfileAnswerObj]
	ON [User].[ProfileAnswer]
	INSTEAD OF INSERT
	AS
	BEGIN
		DECLARE @TMP TABLE(i INT, id INT,  name VARCHAR(MAX), contextId INT, isDefault INT, value INT)
		INSERT INTO @TMP(i, id, name, contextId, isDefault, value)
		SELECT ROW_NUMBER() OVER( ORDER BY id DESC) AS 'i', id, name, contextId, isDefault, value
		FROM INSERTED AS ins
		WHERE ins.objectId IS NULL

		DECLARE @InsNum INT = (SELECT COUNT(id) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			INSERT INTO [Security].[Object] (tableId) VALUES (14)
			DECLARE @objID INT = (SCOPE_IDENTITY());
			
			INSERT INTO [User].[ProfileAnswer] (id, name, objectId, contextId, isDefault, value)
			SELECT id, name, @objId, contextId, isDefault, value
			FROM @TMP as tmp
			WHERE tmp.i = @InsNum

			SET @InsNum = @InsNum - 1;
		END
	END
