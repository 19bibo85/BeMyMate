CREATE TRIGGER [UserToFriendDel]
	ON [User].[UserToFriend]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[UserToFriend]
		SET dtDeleted = GETDATE() 
		WHERE 
		userId IN (SELECT DISTINCT userId FROM DELETED) and 
		friendId IN (SELECT DISTINCT friendId FROM DELETED);
	END
