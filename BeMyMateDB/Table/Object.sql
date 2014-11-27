CREATE TABLE [Security].[Object]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY,
	[tableId] INT NOT NULL,
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_Object_Table] FOREIGN KEY ([tableId]) REFERENCES [Application].[Table]([id])
)
