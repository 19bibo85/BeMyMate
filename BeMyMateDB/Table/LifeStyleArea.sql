CREATE TABLE [User].[LifeStyleArea]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [name] VARCHAR(MAX) NOT NULL, 
    [objectId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_LifeStyleArea_Object] FOREIGN KEY ([objectId]) REFERENCES [Security].[Object]([id])
)
