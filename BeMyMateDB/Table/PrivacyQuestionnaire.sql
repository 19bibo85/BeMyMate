CREATE TABLE [User].[PrivacyQuestionnaire]
(
	[id] INT NOT NULL PRIMARY KEY,
	[refCode] AS Application.GetReferenceCode('privacy_questionnaire_', id, 6, 0),
	[name] VARCHAR(MAX) NOT NULL, 
	[description] VARCHAR(MAX) NULL, 
	[objectId] INT NOT NULL,
	[contextId] INT NOT NULL,
	[areaId] INT NOT NULL,
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL,
	CONSTRAINT [FK_PrivacyQuestionnaire_Object] FOREIGN KEY ([objectId]) REFERENCES [Security].[Object]([id]), 
    CONSTRAINT [FK_PrivacyQuestionnaire_Area] FOREIGN KEY ([areaId]) REFERENCES [User].[PrivacyArea]([id])
)
