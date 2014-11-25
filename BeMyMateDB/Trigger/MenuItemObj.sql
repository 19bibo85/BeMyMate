CREATE TRIGGER [MenuItemObj]
	ON [Application].[MenuItem]
	INSTEAD OF INSERT
	AS
	BEGIN
		DECLARE @TMP TABLE(i INT, id INT, name VARCHAR(MAX), link VARCHAR(MAX))
		INSERT INTO @TMP(i, id, name, link)
		SELECT ROW_NUMBER() OVER( ORDER BY id DESC) AS 'i', id, name, link
		FROM INSERTED AS ins
		WHERE ins.objectId IS NULL

		DECLARE @InsNum INT = (SELECT COUNT(id) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			INSERT INTO [Security].[Object] (objectTableId, dtCreated) VALUES (3, GETDATE())
			DECLARE @objID INT = (SCOPE_IDENTITY());
			
			INSERT INTO [Application].[MenuItem] (id, name, link, objectId, dtCreated)
			SELECT id, name, link, @objId, GETDATE()
			FROM @TMP as tmp
			WHERE tmp.i = @InsNum

			SET @InsNum = @InsNum - 1;
		END
	END