CREATE TRIGGER [JobUp]
	ON [User].[Job]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [User].[Job]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
