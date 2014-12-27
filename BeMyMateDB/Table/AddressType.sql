CREATE TABLE [User].[AddressType]
(
	[id] INT NOT NULL PRIMARY KEY,
	[refCode] AS Application.GetReferenceCode('address_type_', id, 6, 0),
    [name] VARCHAR(MAX) NOT NULL, 
	[description] VARCHAR(MAX) NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL
)
