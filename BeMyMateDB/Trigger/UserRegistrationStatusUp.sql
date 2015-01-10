CREATE TRIGGER [UserRegistrationStatusUp]
	ON [User].[UserRegistrationStatus]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[UserRegistrationStatus]
		SET dtUpdated = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM INSERTED)
	END
