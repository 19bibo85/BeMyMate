CREATE TABLE [User].[UserStatus]
(
	[id] INT NOT NULL PRIMARY KEY, 
	[refCode] AS Application.GetReferenceCode('user_status_', id, 6, 0),
    [name] VARCHAR(MAX) NOT NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdate] DATETIME NULL
)
