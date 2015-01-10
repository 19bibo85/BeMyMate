CREATE TRIGGER [MenuToMenuItemDel]
	ON [Application].[MenuToMenuItem]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Application].[MenuToMenuItem]
		SET dtDeleted = GETDATE() 
		WHERE 
		menuId IN (SELECT DISTINCT menuId FROM DELETED) and 
		menuItemId IN (SELECT DISTINCT menuItemId FROM DELETED);
	END
