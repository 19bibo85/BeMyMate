CREATE TRIGGER [GroupUp]
	ON [Security].[Group]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [Security].[Group]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END