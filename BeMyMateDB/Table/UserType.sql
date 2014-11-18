CREATE TABLE [User].[Type]
(
	[id] INT NOT NULL PRIMARY KEY, 
	[refCode] VARCHAR(MAX) NOT NULL, 
    [name] VARCHAR(MAX) NOT NULL, 
    [dtCreated] VARCHAR(MAX) NOT NULL, 
    [dtUpdated] VARCHAR(MAX) NULL
)
