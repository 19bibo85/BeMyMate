CREATE TRIGGER [MenuItemUp]
	ON [Application].[MenuItem]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [Application].[MenuItem]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
