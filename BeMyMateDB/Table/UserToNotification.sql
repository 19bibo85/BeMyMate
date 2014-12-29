CREATE TABLE [User].[UserToNotification]
(
	[receiverId] INT NOT NULL , 
    [notificationId] INT NOT NULL, 
	[isReaded] BIT, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([receiverId], [notificationId]), 
    CONSTRAINT [FK_UserToNotification_User] FOREIGN KEY ([receiverId]) REFERENCES [User].[User]([id]), 
    CONSTRAINT [FK_UserToNotification_Message] FOREIGN KEY ([notificationId]) REFERENCES [User].[Notification]([id])
)
