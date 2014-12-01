﻿CREATE TABLE [User].[UserProfileInfo]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [userId] INT NOT NULL, 
    [questionnaireId] INT NOT NULL, 
    [answerId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_UserLifeStyleInfo_User] FOREIGN KEY ([userId]) REFERENCES [User].[User]([id]), 
    CONSTRAINT [FK_UserLifeStyleInfo_Questionnaire] FOREIGN KEY ([questionnaireId]) REFERENCES [User].[ProfileQuestionnaire]([id]), 
    CONSTRAINT [FK_UserLifeStyleInfo_Answer] FOREIGN KEY ([answerId]) REFERENCES [User].[ProfileAnswer]([id])
)