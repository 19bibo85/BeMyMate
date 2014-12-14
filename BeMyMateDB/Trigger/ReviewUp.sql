CREATE TRIGGER [ReviewUp]
	ON [User].[Review]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [User].[Review]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
