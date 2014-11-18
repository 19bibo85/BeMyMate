CREATE TABLE [Application].[Section]
(
	[id] INT NOT NULL PRIMARY KEY, 
	[refCode] VARCHAR(MAX) NOT NULL, 
    [name] VARCHAR(MAX) NOT NULL, 
    [level] INT NOT NULL, 
    [parentId] INT NULL, 
	[objectId] INT NOT NULL,
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_Section_Section] FOREIGN KEY ([parentId]) REFERENCES [Application].[Section]([id]), 
    CONSTRAINT [FK_Section_Object] FOREIGN KEY ([objectId]) REFERENCES [Security].[Object]([id])
)
