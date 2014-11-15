﻿CREATE TABLE [Security].[Object]
(
	[id] INT NOT NULL PRIMARY KEY,
	[name] VARCHAR(MAX) NOT NULL,
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL
)
