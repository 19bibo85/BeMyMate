CREATE TABLE [Application].[Language]
(
	[id] INT NOT NULL PRIMARY KEY, 
	[code] VARCHAR(MAX) NOT NULL, 
    [name] VARCHAR(MAX) NOT NULL, 
	[icon] VARCHAR(MAX),
	[link] VARCHAR(MAX) NOT NULL,
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL 
)
