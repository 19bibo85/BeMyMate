CREATE TRIGGER [User].[SettingQuestionnaireLoc]
	ON [User].[SettingQuestionnaire]
	AFTER INSERT
	AS
	BEGIN
		SET NOCOUNT ON

		DECLARE @TMP TABLE(i INT, refCode VARCHAR(MAX), name VARCHAR(MAX), [description] VARCHAR(MAX))
		INSERT INTO @TMP(i, refCode, name, [description])
		SELECT ROW_NUMBER() OVER( ORDER BY refCode ) AS 'i', refCode, name, [description]
		FROM INSERTED AS ins

		DECLARE @InsNum INT = (SELECT COUNT(refCode) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			DECLARE @refCode VARCHAR(MAX) = (SELECT refCode FROM @TMP as ins WHERE ins.i = @InsNum);
			DECLARE @idLoc INT = (SELECT TOP(1) id FROM [Application].[Localization] as loc WHERE LTRIM(RTRIM(loc.refCode)) = LTRIM(RTRIM(@refCode)));

			IF(@idLoc IS NULL)
			BEGIN
				DECLARE @name VARCHAR(MAX) = (SELECT name FROM @TMP as ins WHERE ins.i = @InsNum);
				DECLARE @description VARCHAR(MAX) = (SELECT [description] FROM @TMP as ins WHERE ins.i = @InsNum);
				INSERT INTO [Application].[Localization] (languageId, refCode, name, [description], tableId)
				SELECT lan.id, @refCode, @name, @description, 21
				FROM [Application].[Language] as lan
			END

			SET @InsNum = @InsNum - 1;
		END
	END
