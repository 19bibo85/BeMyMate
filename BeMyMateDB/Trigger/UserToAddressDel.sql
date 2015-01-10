CREATE TRIGGER [UserToAddressDel]
	ON [User].[UserToAddress]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[UserToAddress]
		SET dtDeleted = GETDATE() 
		WHERE 
		userId IN (SELECT DISTINCT userId FROM DELETED) and 
		addressId IN (SELECT DISTINCT addressId FROM DELETED);
	END
