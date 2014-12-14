CREATE TRIGGER [UserToAddressUp]
	ON [User].[UserToAddress]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON
		DECLARE @userId INT = (SELECT userId FROM INSERTED);
		DECLARE @addressId INT = (SELECT addressId FROM INSERTED);
        UPDATE [User].[UserToAddress]
		SET dtUpdated = GETDATE() 
		WHERE userId = @userId and addressId = @addressId
	END
