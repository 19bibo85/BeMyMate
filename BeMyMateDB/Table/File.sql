CREATE TABLE [User].[File]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [name] VARCHAR(MAX) NOT NULL, 
    [path] VARCHAR(MAX) NOT NULL, 
    [infoId] INT NOT NULL, 
    [appId] INT NOT NULL, 
    [userId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_File_FileInfo] FOREIGN KEY ([infoId]) REFERENCES [User].[FileInfo]([id]), 
    CONSTRAINT [FK_File_FileApp] FOREIGN KEY ([appId]) REFERENCES [User].[FileApp]([id])
)
