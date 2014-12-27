CREATE TABLE [User].[Province]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [refCode] AS Application.GetReferenceCode('province_', id, 6, 0),
	[name] VARCHAR(MAX) NOT NULL, 
    [description] VARCHAR(MAX) NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL
)
