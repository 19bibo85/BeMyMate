CREATE TABLE [User].[ProfileQuestionnaire]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [refCode] AS Application.GetReferenceCode('profile_questionnaire_', id, 6, 0),
	[name] VARCHAR(MAX) NULL, 
	[description] VARCHAR(MAX) NULL, 
    [objectId] INT NOT NULL,
	[contextId] INT NOT NULL,
	[areaId] INT NOT NULL,
	[dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_LifeStyleQuestionnaire_Object] FOREIGN KEY ([objectId]) REFERENCES [Security].[Object]([id]), 
    CONSTRAINT [FK_LifeStyleQuestionnaire_Area] FOREIGN KEY ([areaId]) REFERENCES [User].[ProfileArea]([id])
    
)
