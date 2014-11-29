CREATE TABLE [Application].[ObjectContext]
(
	[id] INT NOT NULL PRIMARY KEY,
	[anonymous] BIT NOT NULL, 
	[tennant] BIT NOT NULL, 
    [landlord] BIT NOT NULL , 
    [agency] BIT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL
)
