CREATE TRIGGER [ObjectContextUp]
	ON [Application].[ObjectContext]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Application].[ObjectContext]
		SET dtUpdated = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM INSERTED)
	END
