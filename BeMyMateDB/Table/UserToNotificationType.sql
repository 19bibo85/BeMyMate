CREATE TABLE [User].[UserToNotificationType]
(
	[userId] INT NOT NULL , 
    [notificationTypeId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([userId], [notificationTypeId])
)
