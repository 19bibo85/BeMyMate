CREATE TABLE [User].[Phone]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY(0, 1), 
    [prefix] VARCHAR(MAX) NULL, 
    [number] VARCHAR(MAX) NULL, 
    [typeId] INT NULL, 
    [isPrimary] BIT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_Phone_PhoneType] FOREIGN KEY ([typeId]) REFERENCES [User].[PhoneType]([id])
)
