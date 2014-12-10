CREATE TRIGGER [GenderUp]
	ON [User].[Gender]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [User].[Gender]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
