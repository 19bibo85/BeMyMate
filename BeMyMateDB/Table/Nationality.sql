CREATE TABLE [User].[Nationality]
(
	[id] INT NOT NULL PRIMARY KEY,
	[refCode] AS Application.GetReferenceCode('nationality_', id, 6, 0), 
    [name] VARCHAR(MAX) NOT NULL, 
    [description] VARCHAR(MAX) NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL

)
