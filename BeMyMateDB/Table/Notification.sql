CREATE TABLE [User].[Notification]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [senderId] INT NOT NULL,
    [typeId] INT NOT NULL, 
	[guid] UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
	[dtUpdated] DATETIME NULL, 
    [dtChecked] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_Notification_Sender] FOREIGN KEY ([senderId]) REFERENCES [User].[User]([id]),
    CONSTRAINT [FK_Notification_Type] FOREIGN KEY ([typeId]) REFERENCES [User].[NotificationType]([id])
)
