CREATE TABLE [Application].[Context]
(
	[id] INT NOT NULL PRIMARY KEY,
	[name] VARCHAR(MAX) NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] VARCHAR(MAX) NULL
)
