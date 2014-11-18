CREATE TABLE [User].[PhoneType]
(
	[id] INT NOT NULL PRIMARY KEY, 
	[refCode] VARCHAR(MAX) NULL, 
    [name] VARCHAR(MAX) NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL
)
