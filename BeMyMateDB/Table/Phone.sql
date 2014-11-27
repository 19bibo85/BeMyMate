CREATE TABLE [User].[Phone]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [prefix] INT NULL, 
    [number] INT NULL, 
    [typeId] INT NULL, 
    [isPrimary] BIT NULL, 
    [objectId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_Phone_PhoneType] FOREIGN KEY ([typeId]) REFERENCES [User].[PhoneType]([id])
)
