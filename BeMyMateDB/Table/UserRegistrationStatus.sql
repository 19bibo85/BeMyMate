CREATE TABLE [User].[UserRegistrationStatus]
(
	[id] INT NOT NULL PRIMARY KEY, 
	[refCode] AS Application.GetReferenceCode('user_registration_status_', id, 6, 0),
    [name] VARCHAR(MAX) NOT NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL
)
