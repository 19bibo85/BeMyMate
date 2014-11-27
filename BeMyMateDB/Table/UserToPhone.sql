CREATE TABLE [User].[UserToPhone]
(
    [userId] INT NOT NULL, 
    [phoneId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [PK_UserToPhone] PRIMARY KEY ([userId], [phoneId]), 
    CONSTRAINT [FK_UserToPhone_User] FOREIGN KEY ([userId]) REFERENCES [User].[User]([id]), 
    CONSTRAINT [FK_UserToPhone_Phone] FOREIGN KEY ([phoneId]) REFERENCES [User].[Phone]([id])
)
