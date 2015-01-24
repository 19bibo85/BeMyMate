CREATE TABLE [Application].[MenuItem]
(
	[id] INT NOT NULL PRIMARY KEY, 
	[refCode] AS Application.GetReferenceCode('menu_item_', id, 6, 0),
    [name] VARCHAR(MAX) NOT NULL,
	[description] VARCHAR(MAX) NULL, 
    [parentId] INT NULL, 
    [objectId] INT NOT NULL, 
	[order] INT NOT NULL, 
	[contextId] INT NOT NULL,
	[icon] VARCHAR(MAX) NULL,
	[link] VARCHAR(MAX) NOT NULL,
	[isActive] BIT NULL,
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_MenuItem_Object] FOREIGN KEY ([objectId]) REFERENCES [Security].[Object]([id]),	
    CONSTRAINT [FK_MenuItem_MenuItem] FOREIGN KEY ([parentId]) REFERENCES [Application].[MenuItem]([id]),
	CONSTRAINT [FK_MenuItem_Context] FOREIGN KEY ([contextId]) REFERENCES [Application].[ObjectContext]([id]) 
)
