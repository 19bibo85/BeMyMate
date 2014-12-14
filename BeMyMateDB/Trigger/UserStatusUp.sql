CREATE TRIGGER [UserStatusUp]
	ON [User].[UserStatus]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [User].[UserStatus]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
