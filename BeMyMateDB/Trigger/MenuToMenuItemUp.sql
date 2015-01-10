CREATE TRIGGER [MenuToMenuItemUp]
	ON [Application].[MenuToMenuItem]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Application].[MenuToMenuItem]
		SET dtUpdated = GETDATE() 
		WHERE 
		menuId IN (SELECT DISTINCT menuId FROM INSERTED) and 
		menuItemId IN (SELECT DISTINCT menuItemId FROM INSERTED);
	END
