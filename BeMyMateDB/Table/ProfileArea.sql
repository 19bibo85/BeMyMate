CREATE TABLE [User].[ProfileArea]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [refCode] AS Application.GetReferenceCode('profile_area_', id, 6, 0),
	[name] VARCHAR(MAX) NOT NULL,
	[description] VARCHAR(MAX) NULL, 
    [objectId] INT NOT NULL, 
	[contextId] INT NOT NULL,
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_LifeStyleArea_Object] FOREIGN KEY ([objectId]) REFERENCES [Security].[Object]([id])
)
