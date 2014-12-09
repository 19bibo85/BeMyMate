CREATE TABLE [Security].[Group]
(
	[id] INT NOT NULL PRIMARY KEY,
	[refCode] AS Application.GetReferenceCode('group_', id, 6, 0),
    [name] VARCHAR(MAX) NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL
)
