CREATE TABLE [User].[UserLog]
(
    [userId] INT NOT NULL, 
    [activationDate] DATETIME NULL, 
    [lastRecoveringDate] DATETIME NULL, 
    [lastLoginDate] DATETIME NULL, 
    [lastLogoutDate] DATETIME NULL, 
    [dtCreated] DATETIME NULL DEFAULT GETDATE(), 
    CONSTRAINT [PK_UserLog] PRIMARY KEY ([userId]), 
    CONSTRAINT [FK_UserLog_User] FOREIGN KEY ([userId]) REFERENCES [User].[User]([id]) 
)
