CREATE TRIGGER [UserRegistrationStatusUp]
	ON [User].[UserRegistrationStatus]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [User].[UserRegistrationStatus]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
