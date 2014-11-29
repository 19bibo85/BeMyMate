CREATE TABLE [Application].[MenuItem]
(
	[id] INT NOT NULL PRIMARY KEY, 
	[refCode] AS Application.GetReferenceCode('menu_item_', id, 6, 0),
    [name] VARCHAR(MAX) NOT NULL,
    [objectId] INT NOT NULL, 
	[contextId] INT NOT NULL,
	[link] VARCHAR(MAX) NOT NULL,
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_MenuItem_Object] FOREIGN KEY ([objectId]) REFERENCES [Security].[Object]([id]),
	CONSTRAINT [FK_MenuItem_Context] FOREIGN KEY ([contextId]) REFERENCES [Application].[ObjectContext]([id]) 
)
