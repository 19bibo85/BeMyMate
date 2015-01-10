CREATE TRIGGER [LanguageUp]
	ON [Application].[Language]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Application].[Language]
		SET dtUpdated = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM INSERTED)
	END
