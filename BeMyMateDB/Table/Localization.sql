CREATE TABLE [Application].[Localization]
(
	[id] INT NOT NULL IDENTITY,
	[languageId] INT NOT NULL,  
    [refCode] VARCHAR(MAX) NOT NULL, 
    [name] VARCHAR(MAX) NOT NULL,     
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_Localization_Language] FOREIGN KEY ([languageId]) REFERENCES [Application].[Language]([id]), 
    CONSTRAINT [PK_Localization] PRIMARY KEY ([id]) 
)
