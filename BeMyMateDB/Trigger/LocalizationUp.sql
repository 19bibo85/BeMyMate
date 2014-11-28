CREATE TRIGGER [LocalizationUp]
	ON [Application].[Localization]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [Application].[Localization]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
