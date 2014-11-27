CREATE TABLE [User].[Business]
(
	[id] INT NOT NULL PRIMARY KEY, 
    [jobId] INT NOT NULL, 
    [address] VARCHAR(MAX) NULL, 
    [objectId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_Bussiness_Job] FOREIGN KEY ([jobId]) REFERENCES [User].[Job]([id])
)
