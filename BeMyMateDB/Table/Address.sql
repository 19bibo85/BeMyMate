CREATE TABLE [User].[Address]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY(0, 1), 
    [street] VARCHAR(MAX) NULL, 
    [zipCode] VARCHAR(MAX) NULL, 
    [city] VARCHAR(MAX) NULL, 
    [country] VARCHAR(MAX) NULL, 
    [isPrimary] BIT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL,
)
