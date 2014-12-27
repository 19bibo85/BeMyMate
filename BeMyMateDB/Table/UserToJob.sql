CREATE TABLE [User].[UserToJob]
(
	[userId] INT NOT NULL , 
    [jobId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([userId], [jobId]), 
    CONSTRAINT [FK_UserToBusiness_User] FOREIGN KEY ([userId]) REFERENCES [User].[User]([id]), 
    CONSTRAINT [FK_UserToBusiness_Job] FOREIGN KEY ([jobId]) REFERENCES [User].[Job]([id])
)
