CREATE TABLE [User].[Address]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [street] VARCHAR(MAX) NULL, 
    [zipCode] INT NULL, 
    [city] VARCHAR(MAX) NULL, 
    [country] VARCHAR(MAX) NULL, 
    [isPrimary] BIT NULL, 
    [objectId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL,
)
