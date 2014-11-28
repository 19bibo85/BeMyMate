CREATE TRIGGER [SectionUp]
	ON [Application].[Section]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON		
		DECLARE @id INT = (SELECT id FROM INSERTED);		
        UPDATE [Application].[Section]
		SET dtUpdated = GETDATE() 
		WHERE id = @id;
	END
