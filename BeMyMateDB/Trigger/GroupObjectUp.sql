CREATE TRIGGER [GroupObjectUp]
	ON [Security].[GroupObject]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [Security].[GroupObject]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
