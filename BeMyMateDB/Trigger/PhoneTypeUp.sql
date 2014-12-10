CREATE TRIGGER [PhoneTypeUp]
	ON [User].[PhoneType]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [User].[PhoneType]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
