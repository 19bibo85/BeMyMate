CREATE TRIGGER [MenuUp]
	ON [Application].[Menu]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [Application].[Menu]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
