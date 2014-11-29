CREATE TRIGGER [ObjectContextUp]
	ON [Application].[ObjectContext]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [Application].[ObjectContext]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
