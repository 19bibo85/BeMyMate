CREATE TABLE [User].[PhoneType]
(
	[id] INT NOT NULL PRIMARY KEY, 
	[refCode] AS Application.GetReferenceCode('phone_type_', id, 6, 0),
    [name] VARCHAR(MAX) NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL
)
