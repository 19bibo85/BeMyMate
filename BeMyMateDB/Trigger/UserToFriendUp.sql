CREATE TRIGGER [UserToFriendUp]
	ON [User].[UserToFriend]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON
		DECLARE @userId INT = (SELECT userId FROM INSERTED);
		DECLARE @friendId INT = (SELECT friendId FROM INSERTED);
        UPDATE [User].[UserToFriend]
		SET dtUpdated = GETDATE() 
		WHERE userId = @userId and friendId = @friendId
	END
