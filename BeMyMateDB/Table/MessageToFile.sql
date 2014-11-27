CREATE TABLE [User].[MessageToFile]
(
	[messageId] INT NOT NULL , 
    [fileId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([messageId], [fileId]), 
    CONSTRAINT [FK_MessageToFile_Message] FOREIGN KEY ([messageId]) REFERENCES [User].[Message]([id]), 
    CONSTRAINT [FK_MessageToFile_File] FOREIGN KEY ([fileId]) REFERENCES [User].[File]([id])
)
