CREATE TRIGGER [UserToNotificationTypeUp]
	ON [User].[UserToNotificationType]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON
		DECLARE @userId INT = (SELECT userId FROM INSERTED);
		DECLARE @notificationTypeId INT = (SELECT notificationTypeId FROM INSERTED);
        UPDATE [User].[UserToNotificationType]
		SET dtUpdated = GETDATE() 
		WHERE userId = @userId and notificationTypeId = @notificationTypeId
	END
