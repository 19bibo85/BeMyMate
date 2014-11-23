CREATE TABLE [User].[Type]
(
	[id] INT NOT NULL PRIMARY KEY, 
	[refCode] AS Application.GetReferenceCode('user_type_', id, 6, 0),
    [name] VARCHAR(MAX) NOT NULL, 
    [dtCreated] VARCHAR(MAX) NOT NULL, 
    [dtUpdated] VARCHAR(MAX) NULL
)
