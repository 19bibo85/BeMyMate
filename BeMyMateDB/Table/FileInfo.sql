CREATE TABLE [User].[FileInfo]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [name] VARCHAR(MAX) NOT NULL, 
    [extension] VARCHAR(MAX) NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL
)
