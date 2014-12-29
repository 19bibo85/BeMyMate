CREATE TABLE [User].[UserToMessage]
(
	[receiverId] INT NOT NULL , 
    [messageId] INT NOT NULL, 
	[isReaded] BIT, 
	[isStarred] BIT, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([receiverId], [messageId]), 
    CONSTRAINT [FK_UserToMessage_User] FOREIGN KEY ([receiverId]) REFERENCES [User].[User]([id]), 
    CONSTRAINT [FK_UserToMessage_Message] FOREIGN KEY ([messageId]) REFERENCES [User].[Message]([id])
)
