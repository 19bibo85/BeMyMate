﻿CREATE TABLE [Application].[Menu]
(
	[id] INT NOT NULL PRIMARY KEY, 
	[refCode] AS Application.GetReferenceCode('menu_', id, 6, 0),
    [name] VARCHAR(MAX) NOT NULL, 
	[description] VARCHAR(MAX) NULL,
	[link] VARCHAR(MAX) NULL,
    [objectId] INT NOT NULL,
	[order] INT NOT NULL, 
	[contextId] INT NOT NULL,
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
	CONSTRAINT [FK_Menu_Object] FOREIGN KEY ([objectId]) REFERENCES [Security].[Object]([id]),
	CONSTRAINT [FK_Menu_Context] FOREIGN KEY ([contextId]) REFERENCES [Application].[ObjectContext]([id])
)
