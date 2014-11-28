CREATE TRIGGER [LanguageUp]
	ON [Application].[Language]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [Application].[Language]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
