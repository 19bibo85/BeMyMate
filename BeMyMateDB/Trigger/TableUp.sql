CREATE TRIGGER [TableUp]
	ON [Application].[Table]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [Application].[Table]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
