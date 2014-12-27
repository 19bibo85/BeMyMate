CREATE TABLE [User].[UserToLanguage]
(
	[userId] INT NOT NULL , 
    [languageId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([userId], [languageId]), 
    CONSTRAINT [FK_UserToLanguage_User] FOREIGN KEY ([userId]) REFERENCES [User].[User]([id]), 
    CONSTRAINT [FK_UserToLanguage_Language] FOREIGN KEY ([languageId]) REFERENCES [Application].[Language]([id])
)
