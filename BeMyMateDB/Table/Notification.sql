CREATE TABLE [User].[Notification]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [userId] INT NOT NULL, 
    [typeId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtChecked] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_Notification_User] FOREIGN KEY ([userId]) REFERENCES [User].[User]([id]), 
    CONSTRAINT [FK_Notification_Type] FOREIGN KEY ([typeId]) REFERENCES [User].[NotificationType]([id])
)
