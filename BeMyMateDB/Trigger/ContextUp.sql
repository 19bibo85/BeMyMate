CREATE TRIGGER [ContextUp]
	ON [Application].[RowContext]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [Application].[RowContext]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
