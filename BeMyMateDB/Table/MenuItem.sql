CREATE TABLE [Application].[MenuItem]
(
	[id] INT NOT NULL PRIMARY KEY, 
	[refCode] AS Application.GetReferenceCode('menu_item_', id, 6, 0),
    [name] VARCHAR(MAX) NOT NULL,
    [objectId] INT NOT NULL, 
	[link] VARCHAR(MAX) NOT NULL,
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_MenuItem_Object] FOREIGN KEY ([objectId]) REFERENCES [Security].[Object]([id])
)
