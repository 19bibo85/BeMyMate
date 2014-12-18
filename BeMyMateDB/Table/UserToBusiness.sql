CREATE TABLE [User].[UserToBusiness]
(
	[userId] INT NOT NULL , 
    [businessId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([userId], [businessId]), 
    CONSTRAINT [FK_UserToBusiness_User] FOREIGN KEY ([userId]) REFERENCES [User].[User]([id]), 
    CONSTRAINT [FK_UserToBusiness_Business] FOREIGN KEY ([businessId]) REFERENCES [User].[Business]([id])
)
