CREATE TRIGGER [ProfileAnswerUp]
	ON [User].[ProfileAnswer]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [User].[ProfileAnswer]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
