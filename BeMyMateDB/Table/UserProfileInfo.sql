CREATE TABLE [User].[UserProfileInfo]
(
    [userId] INT NOT NULL, 
    [questionnaireId] INT NOT NULL, 
    [answerId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(),
	[dtUpdated] DATETIME NULL,  
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_UserProfileInfo_User] FOREIGN KEY ([userId]) REFERENCES [User].[User]([id]), 
    CONSTRAINT [FK_UserProfileInfo_Questionnaire] FOREIGN KEY ([questionnaireId]) REFERENCES [User].[ProfileQuestionnaire]([id]), 
    CONSTRAINT [FK_UserProfileInfo_Answer] FOREIGN KEY ([answerId]) REFERENCES [User].[ProfileAnswer]([id]), 
    CONSTRAINT [PK_UserProfileInfo] PRIMARY KEY ([userId], [questionnaireId], [answerId])
)