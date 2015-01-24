CREATE TRIGGER [MenuItemObj]
	ON [Application].[MenuItem]
	INSTEAD OF INSERT
	AS
	BEGIN
		DECLARE @TMP TABLE(i INT, id INT, name VARCHAR(MAX), link VARCHAR(MAX), parentId INT, [order] INT, contextId INT, icon INT, isActive BIT)
		INSERT INTO @TMP(i, id, name, link, parentId, [order], contextId, icon, isActive)
		SELECT ROW_NUMBER() OVER( ORDER BY id DESC) AS 'i', id, name, link, parentId, [order], contextId, icon, isActive
		FROM INSERTED AS ins
		WHERE ins.objectId IS NULL

		DECLARE @InsNum INT = (SELECT COUNT(id) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			INSERT INTO [Security].[Object] (tableId) VALUES (3)
			DECLARE @objID INT = (SCOPE_IDENTITY());
			
			INSERT INTO [Application].[MenuItem] (id, name, parentId, objectId, [order], contextId, icon, link, isActive)
			SELECT id, name, parentID, @objId, [order], contextId, icon, link, isActive
			FROM @TMP as tmp
			WHERE tmp.i = @InsNum

			SET @InsNum = @InsNum - 1;
		END
	END