CREATE TABLE [User].[UserToNotificationType]
(
	[userId] INT NOT NULL , 
    [notificationTypeId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([userId], [notificationTypeId]), 
    CONSTRAINT [FK_UserToNotificationType_User] FOREIGN KEY ([userId]) REFERENCES [User].[User]([id]),
	CONSTRAINT [FK_UserToNotificationType_NotificationType] FOREIGN KEY ([notificationTypeId]) REFERENCES [User].[NotificationType]([id])
)
