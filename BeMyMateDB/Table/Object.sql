CREATE TABLE [Security].[Object]
(
	[id] INT NOT NULL PRIMARY KEY,
	[objectTableId] INT NOT NULL,
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_Object_ObjectTable] FOREIGN KEY ([objectTableId]) REFERENCES [Security].[ObjectTable]([id])
)
