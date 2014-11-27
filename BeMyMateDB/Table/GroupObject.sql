CREATE TABLE [Security].[GroupObject]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [name] VARCHAR(MAX) NOT NULL, 
	[objectId] INT NOT NULL,
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL,
	CONSTRAINT [FK_GroupObject_Object] FOREIGN KEY ([objectId]) REFERENCES [Security].[Object]([id])
)
