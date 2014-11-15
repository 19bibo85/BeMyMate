CREATE TABLE [User].[LifeStyleQuestionnaire]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [Name] VARCHAR(MAX) NULL, 
    [objectId] INT NOT NULL,
	[areaId] INT NOT NULL,
	[dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_LifeStyleQuestionnaire_Object] FOREIGN KEY ([objectId]) REFERENCES [Security].[Object]([id]), 
    CONSTRAINT [FK_LifeStyleQuestionnaire_Area] FOREIGN KEY ([areaId]) REFERENCES [User].[LifeStyleArea]([id])
    
)
