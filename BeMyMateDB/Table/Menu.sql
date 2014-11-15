CREATE TABLE [Application].[Menu]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [name] VARCHAR(MAX) NOT NULL, 
	[level] INT NOT NULL, 
    [parentId] INT NULL, 
    [objectId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_Menu_Menu] FOREIGN KEY ([parentId]) REFERENCES [Application].[Menu]([id])
)
