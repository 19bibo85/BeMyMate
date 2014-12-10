CREATE TRIGGER [AvatarUp]
	ON [User].[Avatar]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [User].[Avatar]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
