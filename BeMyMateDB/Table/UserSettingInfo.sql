CREATE TABLE [User].[UserSettingInfo]
(
    [userId] INT NOT NULL, 
    [questionnaireId] INT NOT NULL, 
    [answerId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
	[dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_UserSettingInfo_User] FOREIGN KEY ([userId]) REFERENCES [User].[User]([id]), 
    CONSTRAINT [FK_UserSettingInfo_Questionnaire] FOREIGN KEY ([questionnaireId]) REFERENCES [User].[SettingQuestionnaire]([id]), 
    CONSTRAINT [FK_UserSettingInfo_Answer] FOREIGN KEY ([answerId]) REFERENCES [User].[SettingAnswer]([id]), 
    CONSTRAINT [PK_UserSettingInfo] PRIMARY KEY ([userId], [questionnaireId], [answerId])
)