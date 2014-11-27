﻿CREATE TABLE [User].[LifeStyleAnswer]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [refCode] VARCHAR(MAX) NOT NULL, 
	[name] VARCHAR(MAX) NOT NULL, 	
    [objectId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_LifeStyleAnswer_Object] FOREIGN KEY ([objectId]) REFERENCES [Security].[Object]([id])
)
