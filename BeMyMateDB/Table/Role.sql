CREATE TABLE [Security].[Role]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [name] VARCHAR(MAX) NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] NCHAR(10) NULL
)
