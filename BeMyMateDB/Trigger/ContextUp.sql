CREATE TRIGGER [ContextUp]
	ON [Application].[Context]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [Application].[Context]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
