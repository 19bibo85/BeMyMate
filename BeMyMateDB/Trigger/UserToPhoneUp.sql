CREATE TRIGGER [UserToPhoneUp]
	ON [User].[UserToPhone]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[UserToPhone]
		SET dtUpdated = GETDATE() 
		WHERE 
		userId IN (SELECT DISTINCT userId FROM INSERTED) and 
		phoneId IN (SELECT DISTINCT phoneId FROM INSERTED);
	END
