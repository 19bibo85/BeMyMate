﻿CREATE TABLE [User].[UserPrivacyInfo]
(
    [userId] INT NOT NULL, 
    [questionnaireId] INT NOT NULL, 
    [answerId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
	[dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_UserPrivacyInfo_User] FOREIGN KEY ([userId]) REFERENCES [User].[User]([id]), 
    CONSTRAINT [FK_UserPrivacyInfo_Questionnaire] FOREIGN KEY ([questionnaireId]) REFERENCES [User].[PrivacyQuestionnaire]([id]), 
    CONSTRAINT [FK_UserPrivacyInfo_Answer] FOREIGN KEY ([answerId]) REFERENCES [User].[PrivacyAnswer]([id]), 
    CONSTRAINT [PK_UserPrivacyInfo] PRIMARY KEY ([userId], [questionnaireId], [answerId])
)