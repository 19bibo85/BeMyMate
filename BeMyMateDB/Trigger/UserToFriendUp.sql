CREATE TRIGGER [UserToFriendUp]
	ON [User].[UserToFriend]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[UserToFriend]
		SET dtUpdated= GETDATE() 
		WHERE 
		userId IN (SELECT DISTINCT userId FROM INSERTED) and 
		friendId IN (SELECT DISTINCT friendId FROM INSERTED);
	END
