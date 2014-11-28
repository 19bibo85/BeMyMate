CREATE TRIGGER [LanguageDel]
	ON [Application].[Language]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON
		DECLARE @id INT = (SELECT id FROM DELETED);
        UPDATE [Application].[Language]
		SET dtDeleted = GETDATE()
		WHERE id = @id;
	END
