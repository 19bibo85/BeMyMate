CREATE TRIGGER [SettingQuestionnaireObj]
	ON [User].[SettingQuestionnaire]
	INSTEAD OF INSERT
	AS
	BEGIN
		DECLARE @TMP TABLE(i INT, id INT,  name VARCHAR(MAX), contextId INT, areaId INT)
		INSERT INTO @TMP(i, id, name, contextId, areaId)
		SELECT ROW_NUMBER() OVER( ORDER BY id DESC) AS 'i', id, name, contextId, areaId
		FROM INSERTED AS ins
		WHERE ins.objectId IS NULL

		DECLARE @InsNum INT = (SELECT COUNT(id) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			INSERT INTO [Security].[Object] (tableId) VALUES (20)
			DECLARE @objID INT = (SCOPE_IDENTITY());
			
			INSERT INTO [User].[SettingQuestionnaire] (id, name, objectId, contextId, areaId)
			SELECT id, name, @objId, contextId, areaId
			FROM @TMP as tmp
			WHERE tmp.i = @InsNum

			SET @InsNum = @InsNum - 1;
		END
	END
