CREATE TABLE [User].[UserStatus]
(
	[id] INT NOT NULL PRIMARY KEY, 
	[refCode] VARCHAR(MAX) NOT NULL, 
    [name] VARCHAR(MAX) NOT NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdate] DATETIME NULL
)
