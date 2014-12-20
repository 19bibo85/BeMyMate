CREATE TRIGGER [SectionToMenuDel]
	ON [Application].[SectionToMenu]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		DECLARE @TMP TABLE(i INT, sectionId INT, menuId INT);
		INSERT INTO @TMP(i, sectionId, menuId)
		SELECT ROW_NUMBER() OVER( ORDER BY sectionId, menuId) as 'i', sectionId, menuId
		FROM DELETED

		DECLARE @InsNum INT = (SELECT COUNT(sectionId) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			DECLARE @sectionId INT = (SELECT sectionId FROM @TMP WHERE i = @InsNum);
			DECLARE @menuId INT = (SELECT menuId FROM @TMP WHERE i = @InsNum);

			 UPDATE [Application].[SectionToMenu]
			 SET dtDeleted = GETDATE() 
			 WHERE sectionId = @sectionId and menuId = @menuId;

			SET @InsNum = @InsNum - 1;
		END
	END
