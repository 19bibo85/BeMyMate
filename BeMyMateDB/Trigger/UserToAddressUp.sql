CREATE TRIGGER [UserToAddressUp]
	ON [User].[UserToAddress]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON 

		UPDATE [User].[UserToAddress]
		SET dtUpdated = GETDATE() 
		WHERE 
		userId IN (SELECT DISTINCT userId FROM INSERTED) and 
		addressId IN (SELECT DISTINCT addressId FROM INSERTED);
	END
