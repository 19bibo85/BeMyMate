CREATE TABLE [User].[Message]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY, 
	[parentId] INT,
    [authorId] INT NOT NULL,
	[subject] VARCHAR(MAX) NOT NULL,
    [body] VARCHAR(MAX) NOT NULL,
	[guid] UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(),
    [dtUpdated] DATETIME NULL,
    [dtDeleted] DATETIME NULL,
    CONSTRAINT [FK_Message_User] FOREIGN KEY ([authorId]) REFERENCES [User].[User]([id]), 
    CONSTRAINT [FK_Message_Message] FOREIGN KEY ([parentId]) REFERENCES [User].[Message]([id])
)
