CREATE TRIGGER [MenuToMenuItemDel]
	ON [Application].[MenuToMenuItem]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		--DECLARE @TMP TABLE(i INT, menuId INT, menuItemId INT);
		--INSERT INTO @TMP(i, menuId, menuItemId)
		--SELECT ROW_NUMBER() OVER( ORDER BY menuId, menuItemId) as 'i', menuId, menuItemId
		--FROM DELETED

		--DECLARE @InsNum INT = (SELECT COUNT(menuId) FROM @TMP);

		--WHILE(@InsNum > 0)
		--BEGIN
		--	DECLARE @menuId INT = (SELECT menuId FROM @TMP WHERE i = @InsNum);
		--	DECLARE @menuItemId INT = (SELECT menuItemId FROM @TMP WHERE i = @InsNum);

		--	UPDATE [Application].[MenuToMenuItem]
		--	SET dtDeleted = GETDATE()
		--	WHERE menuId = @menuId and menuItemId = @menuItemId

		--	SET @InsNum = @InsNum - 1;
		--END

		UPDATE [Application].[MenuToMenuItem]
		SET dtDeleted = GETDATE() 
		WHERE 
		menuId IN (SELECT DISTINCT menuId FROM DELETED) and 
		menuItemId IN (SELECT DISTINCT menuItemId FROM DELETED);
	END
