﻿CREATE TABLE [Security].[RoleGroupObjectRight]
(
	[roleId] INT NOT NULL , 
    [groupObjectId] INT NOT NULL, 
    [rightId] INT NOT NULL, 
    [deny] BIT NOT NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([roleId], [groupObjectId]), 
    CONSTRAINT [FK_RoleGroupObjectRight_Role] FOREIGN KEY ([roleId]) REFERENCES [Security].[Role]([id]), 
    CONSTRAINT [FK_RoleGroupObjectRight_GroupObject] FOREIGN KEY ([groupObjectId]) REFERENCES [Security].[GroupObject]([id]), 
    CONSTRAINT [FK_RoleGroupObjectRight_ObjectRight] FOREIGN KEY ([rightId]) REFERENCES [Security].[ObjectRight]([id])
)
