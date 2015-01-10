CREATE TRIGGER [UserToMessageDel]
	ON [User].[UserToMessage]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[UserToMessage]
		SET dtDeleted = GETDATE() 
		WHERE 
		receiverId IN (SELECT DISTINCT receiverId FROM DELETED) and 
		messageId IN (SELECT DISTINCT messageId FROM DELETED);
	END