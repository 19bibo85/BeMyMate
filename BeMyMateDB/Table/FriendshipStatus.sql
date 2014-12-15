CREATE TABLE [User].[FriendshipStatus]
(
	[id] INT NOT NULL PRIMARY KEY,
	[refCode] AS Application.GetReferenceCode('friendship_status_', id, 6, 0),
    [name] VARCHAR(MAX) NOT NULL,
	[description] VARCHAR(MAX) NULL,
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL,
)
