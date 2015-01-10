CREATE TRIGGER [SectionUp]
	ON [Application].[Section]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Application].[Section]
		SET dtUpdated = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM INSERTED)
	END
