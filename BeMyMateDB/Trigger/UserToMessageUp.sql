CREATE TRIGGER [UserToMessageUp]
	ON [User].[UserToMessage]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[UserToMessage]
		SET dtUpdated = GETDATE() 
		WHERE 
		receiverId IN (SELECT DISTINCT receiverId FROM INSERTED) and 
		messageId IN (SELECT DISTINCT messageId FROM INSERTED);
	END