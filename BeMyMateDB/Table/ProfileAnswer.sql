﻿CREATE TABLE [User].[ProfileAnswer]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [refCode] AS Application.GetReferenceCode('profile_answer_', id, 6, 0),
	[name] VARCHAR(MAX) NOT NULL, 	
    [objectId] INT NOT NULL, 
	[contextId] INT NOT NULL,
	[isDefault] BIT NOT NULL,
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_LifeStyleAnswer_Object] FOREIGN KEY ([objectId]) REFERENCES [Security].[Object]([id])
)
