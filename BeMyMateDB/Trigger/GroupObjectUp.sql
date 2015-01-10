CREATE TRIGGER [GroupObjectUp]
	ON [Security].[GroupObject]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Security].[GroupObject]
		SET dtUpdated = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM INSERTED)
	END
