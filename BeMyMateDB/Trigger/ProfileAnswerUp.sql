CREATE TRIGGER [ProfileAnswerUp]
	ON [User].[ProfileAnswer]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[ProfileAnswer]
		SET dtUpdated = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM INSERTED)
	END
