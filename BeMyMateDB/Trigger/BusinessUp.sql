CREATE TRIGGER [BusinessUp]
	ON [User].[Business]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [User].[Business]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END