CREATE TRIGGER [SectionToMenuUp]
	ON [Application].[SectionToMenu]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		--DECLARE @TMP TABLE(i INT, sectionId INT, menuId INT);
		--INSERT INTO @TMP(i, sectionId, menuId)
		--SELECT ROW_NUMBER() OVER( ORDER BY sectionId, menuId) as 'i', sectionId, menuId
		--FROM INSERTED

		--DECLARE @InsNum INT = (SELECT COUNT(sectionId) FROM @TMP);

		--WHILE(@InsNum > 0)
		--BEGIN
		--	DECLARE @sectionId INT = (SELECT sectionId FROM @TMP WHERE i = @InsNum);
		--	DECLARE @menuId INT = (SELECT menuId FROM @TMP WHERE i = @InsNum);

		--	 UPDATE [Application].[SectionToMenu]
		--	 SET dtUpdated = GETDATE() 
		--	 WHERE sectionId = @sectionId and menuId = @menuId;

		--	SET @InsNum = @InsNum - 1;
		--END

		UPDATE [Application].[SectionToMenu]
		SET dtUpdated = GETDATE() 
		WHERE 
		sectionId IN (SELECT DISTINCT sectionId FROM INSERTED) and 
		menuId IN (SELECT DISTINCT menuId FROM INSERTED);
	END
