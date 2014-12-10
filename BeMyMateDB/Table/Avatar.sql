CREATE TABLE [User].[Avatar]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [name] VARCHAR(MAX) NOT NULL, 
    [path] VARCHAR(MAX) NOT NULL,
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL
)
