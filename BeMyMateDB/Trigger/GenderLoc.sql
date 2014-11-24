﻿CREATE TRIGGER [User].[GenderLocalization]
	ON [User].[Gender]
	AFTER INSERT
	AS
	BEGIN
		SET NOCOUNT ON

		DECLARE @TMP TABLE(i INT, refCode VARCHAR(MAX), name VARCHAR(MAX))
		INSERT INTO @TMP(i, refCode, name)
		SELECT ROW_NUMBER() OVER( ORDER BY refCode ) AS 'i', refCode, name
		FROM INSERTED AS ins

		DECLARE @InsNum INT = (SELECT COUNT(refCode) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			DECLARE @refCode VARCHAR(MAX) = (SELECT refCode FROM @TMP as ins WHERE ins.i = @InsNum);
			DECLARE @idLoc INT = (SELECT TOP(1) id FROM [Application].[Localization] as loc WHERE loc.refCode = @refCode);

			IF(@idLoc IS NULL)
			BEGIN
				DECLARE @name VARCHAR(MAX) = (SELECT name FROM @TMP as ins WHERE ins.i = @InsNum);
				INSERT INTO [Application].[Localization] (languageId, refCode, name, dtCreated)
				SELECT lan.id, @refCode, @name, GETDATE()
				FROM [Application].[Language] as lan
			END

			SET @InsNum = @InsNum - 1;
		END
	END
