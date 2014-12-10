CREATE TRIGGER [ObjectRightUp]
	ON [Security].[ObjectRight]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);	
        UPDATE [Security].[ObjectRight]
		SET dtUpdated = GETDATE() 
		WHERE id = @id
	END
