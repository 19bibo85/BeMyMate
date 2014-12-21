CREATE TRIGGER [TableObj]
	ON [Application].[Table]
	INSTEAD OF INSERT
	AS
	BEGIN
		DECLARE @TMP TABLE(i INT, id INT, name VARCHAR(MAX))
		INSERT INTO @TMP(i, id, name)
		SELECT ROW_NUMBER() OVER( ORDER BY id DESC) AS 'i', id, name
		FROM INSERTED AS ins
		WHERE ins.objectId IS NULL

		DECLARE @InsNum INT = (SELECT COUNT(id) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			DECLARE @tableID INT = (SELECT id FROM @TMP as tmp	WHERE tmp.i = @InsNum);

			IF(@tableID <> 0)
			BEGIN
				INSERT INTO [Security].[Object] (tableId) VALUES (0)
				DECLARE @objID INT = (SCOPE_IDENTITY());			

				INSERT INTO [Application].[Table] (id, name, objectId)
				SELECT id, name, @objId
				FROM @TMP as tmp
				WHERE tmp.i = @InsNum
			END
			ELSE
			BEGIN
				INSERT INTO [Application].[Table] (id, name, objectId)
				SELECT id, name, 0
				FROM @TMP as tmp
				WHERE tmp.i = @InsNum

				SET IDENTITY_INSERT [Security].[Object] ON
				INSERT INTO [Security].[Object] (id, tableId) VALUES (0,0)
				SET IDENTITY_INSERT [Security].[Object] OFF
			END

			SET @InsNum = @InsNum - 1;
		END
	END
