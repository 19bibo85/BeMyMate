CREATE TABLE [User].[Address]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY(0, 1), 
    [addressLine] VARCHAR(MAX) NULL,     
    [city] VARCHAR(MAX) NULL, 
    [provinceId] INT NOT NULL, 
	[postalCode] VARCHAR(MAX) NULL, 
    [isPrimary] BIT NULL, 
	[typeId] INT NOT NULL,
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL,     
    CONSTRAINT [FK_Address_Province] FOREIGN KEY ([provinceId]) REFERENCES [User].[province]([id]), 
    CONSTRAINT [FK_Address_AddressType] FOREIGN KEY ([typeId]) REFERENCES [User].[AddressType]([id])
)
