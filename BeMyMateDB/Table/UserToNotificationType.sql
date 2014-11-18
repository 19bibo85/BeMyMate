CREATE TABLE [dbo].[UserToNotificationType]
(
	[userId] INT NOT NULL , 
    [notificationTypeId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([userId], [notificationTypeId])
)
