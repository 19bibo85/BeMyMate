﻿CREATE TRIGGER [LanguageLoc]
	ON [Application].[Language]
	AFTER INSERT
	AS
	BEGIN
		SET NOCOUNT ON
		DECLARE @lanId INT = 1;

		DECLARE @TMP TABLE(i INT, id INT)
		INSERT INTO @TMP(i, id)
		SELECT ROW_NUMBER() OVER( ORDER BY id ) AS 'i', id
		FROM INSERTED AS ins

		DECLARE @InsNum INT = (SELECT COUNT(id) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			DECLARE @id INT = (SELECT id FROM @TMP as ins WHERE ins.i = @InsNum);
						
			INSERT INTO [Application].[Localization] (languageId, refCode, name, dtCreated)
			SELECT @id, loc.refCode, loc.name, GETDATE()
			FROM [Application].[Localization] as loc
			WHERE loc.languageId = @lanId

			SET @InsNum = @InsNum - 1;
		END
	END