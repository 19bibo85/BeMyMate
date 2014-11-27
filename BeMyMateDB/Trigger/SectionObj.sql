﻿CREATE TRIGGER [SectionObj]
	ON [Application].[Section]
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
			INSERT INTO [Security].[Object] (tableId) VALUES (1)
			DECLARE @objID INT = (SCOPE_IDENTITY());
			
			INSERT INTO [Application].[Section] (id, name, level, parentId, objectId, contextId)
			SELECT id, name, level, parentId, @objId, 1
			FROM @TMP as tmp
			WHERE tmp.i = @InsNum

			SET @InsNum = @InsNum - 1;
		END
	END