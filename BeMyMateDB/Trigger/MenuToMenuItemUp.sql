CREATE TRIGGER [MenuToMenuItemUp]
	ON [Application].[MenuToMenuItem]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @menuId INT = (SELECT menuId FROM INSERTED);
		DECLARE @menuItemId INT = (SELECT menuItemId FROM INSERTED);
        UPDATE [Application].[MenuToMenuItem]
		SET dtUpdated = GETDATE() 
		WHERE menuId = @menuId and menuItemId = @menuItemId;
	END
