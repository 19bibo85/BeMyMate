CREATE TRIGGER [UserToMessageUp]
	ON [User].[UserToMessage]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON
		DECLARE @receiverId INT = (SELECT receiverId FROM INSERTED);
		DECLARE @messageId INT = (SELECT messageId FROM INSERTED);
        UPDATE [User].[UserToMessage]
		SET dtUpdated = GETDATE() 
		WHERE receiverId = @receiverId and messageId = @messageId
	END
