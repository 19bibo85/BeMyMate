CREATE TABLE [User].[Business]
(
	[id] INT NOT NULL PRIMARY KEY IDENTITY(0, 1), 
    [jobId] INT NOT NULL, 
    [address] VARCHAR(MAX) NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_Bussiness_Job] FOREIGN KEY ([jobId]) REFERENCES [User].[Job]([id])
)
