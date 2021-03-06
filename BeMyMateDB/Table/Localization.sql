﻿CREATE TABLE [Application].[Localization]
(
	[id] INT NOT NULL IDENTITY,
	[languageId] INT NOT NULL,  
    [refCode] VARCHAR(MAX) NOT NULL, 
    [name] VARCHAR(MAX) NOT NULL,
	[description] VARCHAR(MAX) NULL, 
	[tableId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [PK_Localization] PRIMARY KEY ([id], [languageId], [tableId]), 
    CONSTRAINT [FK_Localization_Language] FOREIGN KEY ([languageId]) REFERENCES [Application].[Language]([id]), 
    CONSTRAINT [FK_Localization_Table] FOREIGN KEY ([tableId]) REFERENCES [Application].[Table]([id]) 
)
