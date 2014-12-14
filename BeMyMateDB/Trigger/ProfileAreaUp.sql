CREATE TRIGGER [ProfileAreaUp]
	ON [User].[ProfileArea]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [User].[ProfileArea]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
