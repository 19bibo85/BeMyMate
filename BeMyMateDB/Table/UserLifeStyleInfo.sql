﻿CREATE TABLE [User].[UserLifeStyleInfo]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [userId] INT NOT NULL, 
    [questionnaireId] INT NOT NULL, 
    [answerId] INT NOT NULL, 
    [objectId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_UserLifeStyleInfo_User] FOREIGN KEY ([userId]) REFERENCES [User].[User]([id]), 
    CONSTRAINT [FK_UserLifeStyleInfo_Questionnaire] FOREIGN KEY ([questionnaireId]) REFERENCES [User].[LifeStyleQuestionnaire]([id]), 
    CONSTRAINT [FK_UserLifeStyleInfo_Answer] FOREIGN KEY ([answerId]) REFERENCES [User].[LifeStyleAnswer]([id]), 
    CONSTRAINT [FK_UserLifeStyleInfo_Object] FOREIGN KEY ([objectId]) REFERENCES [Security].[Object]([id])
)