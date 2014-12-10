CREATE TABLE [User].[Job]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [refCode] AS Application.GetReferenceCode('job_', id, 6, 0),
	[name] VARCHAR(MAX) NOT NULL, 	
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL
)
