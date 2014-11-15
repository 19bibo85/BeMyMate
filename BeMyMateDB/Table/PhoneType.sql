CREATE TABLE [User].[PhoneType]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [name] VARCHAR(MAX) NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL
)
