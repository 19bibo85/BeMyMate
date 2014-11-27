CREATE TABLE [Security].[ObjectRight]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [name] VARCHAR(MAX) NOT NULL, 
    [dtCreated] VARCHAR(MAX) NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] VARCHAR(MAX) NULL
)
