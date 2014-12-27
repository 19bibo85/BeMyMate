CREATE TABLE [User].[UserToNationality]
(
	[userId] INT NOT NULL , 
    [nationalityId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([userId], [nationalityId]), 
    CONSTRAINT [FK_UserToNationality_User] FOREIGN KEY ([userId]) REFERENCES [User].[User]([id]), 
    CONSTRAINT [FK_UserToNationality_Nationality] FOREIGN KEY ([nationalityId]) REFERENCES [User].[Nationality]([id])
)
