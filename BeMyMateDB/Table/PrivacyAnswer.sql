CREATE TABLE [User].[PrivacyAnswer]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [refCode] AS Application.GetReferenceCode('privacy_answer_', id, 6, 0),
	[name] VARCHAR(MAX) NOT NULL,
	[description] VARCHAR(MAX) NULL,
	[objectId] INT NOT NULL, 
	[contextId] INT NOT NULL,
	[isDefault] BIT NOT NULL,
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL,
	CONSTRAINT [FK_PrivacyAnswer_Object] FOREIGN KEY ([objectId]) REFERENCES [Security].[Object]([id])
)
