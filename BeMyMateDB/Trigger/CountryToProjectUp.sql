CREATE TRIGGER [CountryToProvinceUp]
	ON [User].[CountryToProvince]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		--DECLARE @TMP TABLE(i INT, countryId INT, provinceId INT);
		--INSERT INTO @TMP(i, countryId, provinceId)
		--SELECT ROW_NUMBER() OVER( ORDER BY countryId, provinceId) as 'i', countryId, provinceId
		--FROM INSERTED

		--DECLARE @InsNum INT = (SELECT COUNT(countryId) FROM @TMP);

		--WHILE(@InsNum > 0)
		--BEGIN
		--	DECLARE @countryId INT = (SELECT countryId FROM @TMP WHERE i = @InsNum);
		--	DECLARE @provinceId INT = (SELECT provinceId FROM @TMP WHERE i = @InsNum);

		--	UPDATE [User].[CountryToProvince]
		--	SET dtUpdated = GETDATE() 
		--	WHERE countryId = @countryId and provinceId = @provinceId;

		--	SET @InsNum = @InsNum - 1;
		--END

		UPDATE [User].[CountryToProvince]
		SET dtUpdated = GETDATE() 
		WHERE 
		countryId IN (SELECT DISTINCT countryId FROM INSERTED) and 
		provinceId IN (SELECT DISTINCT provinceId FROM INSERTED);
	END
