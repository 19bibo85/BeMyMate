CREATE TRIGGER [PhoneUp]
	ON [User].[Phone]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [User].[Phone]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END