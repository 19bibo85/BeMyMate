﻿CREATE TABLE [Security].[RoleToUser]
(
	[userId] INT NOT NULL , 
    [roleId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([userId], [roleId]), 
    CONSTRAINT [FK_RoleToUser_Role] FOREIGN KEY ([roleId]) REFERENCES [Security].[Role]([id]), 
    CONSTRAINT [FK_RoleToUser_User] FOREIGN KEY ([userId]) REFERENCES [User].[User]([id])
)
