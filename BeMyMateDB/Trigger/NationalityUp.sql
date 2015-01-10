CREATE TRIGGER [NationalityUp]
	ON [User].[Nationality]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[Nationality]
		SET dtUpdated = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM INSERTED)
	END
