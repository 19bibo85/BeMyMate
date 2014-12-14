CREATE TRIGGER [UserToPhoneUp]
	ON [User].[UserToPhone]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON
		DECLARE @userId INT = (SELECT userId FROM INSERTED);
		DECLARE @phoneId INT = (SELECT phoneId FROM INSERTED);
        UPDATE [User].[UserToPhone]
		SET dtUpdated = GETDATE() 
		WHERE userId = @userId and phoneId = @phoneId
	END
