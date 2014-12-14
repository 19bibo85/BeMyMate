CREATE TRIGGER [RoleUp]
	ON [Security].[Role]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [Security].[Role]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
