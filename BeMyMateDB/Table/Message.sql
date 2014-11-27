CREATE TABLE [User].[Message]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [senderId] INT NOT NULL, 
    [message] VARCHAR(MAX) NOT NULL, 
    [objectId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_Message_User] FOREIGN KEY ([senderId]) REFERENCES [User].[User]([id])
)
