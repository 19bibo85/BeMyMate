CREATE TRIGGER [TableUp]
	ON [Application].[Table]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Application].[Table]
		SET dtUpdated = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM INSERTED)
	END
