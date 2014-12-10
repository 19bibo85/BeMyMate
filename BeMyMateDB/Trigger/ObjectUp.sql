CREATE TRIGGER [ObjectUp]
	ON [Security].[Object]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [Security].[Object]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
