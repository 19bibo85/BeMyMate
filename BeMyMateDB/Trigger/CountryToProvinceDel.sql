CREATE TRIGGER [CountryToProvinceDel]
	ON [User].[CountryToProvince]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		DECLARE @TMP TABLE(i INT, countryId INT, provinceId INT);
		INSERT INTO @TMP(i, countryId, provinceId)
		SELECT ROW_NUMBER() OVER( ORDER BY countryId, provinceId) as 'i', countryId, provinceId
		FROM DELETED

		DECLARE @InsNum INT = (SELECT COUNT(countryId) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			DECLARE @countryId INT = (SELECT countryId FROM @TMP WHERE i = @InsNum);
			DECLARE @provinceId INT = (SELECT provinceId FROM @TMP WHERE i = @InsNum);

			UPDATE [User].[CountryToProvince]
			SET dtDeleted = GETDATE() 
			WHERE countryId = @countryId and provinceId = @provinceId;

			SET @InsNum = @InsNum - 1;
		END
	END
