CREATE TABLE [User].[SettingQuestionnaireToAnswer]
(
	[questionnaireId] INT NOT NULL , 
    [answerId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([questionnaireId], [answerId]), 
    CONSTRAINT [FK_SettingQuestionnaireToAnswer_Questionnaire] FOREIGN KEY ([questionnaireId]) REFERENCES [User].[SettingQuestionnaire]([id]), 
    CONSTRAINT [FK_SettingQuestionnaireToAnswer_Answer] FOREIGN KEY ([answerId]) REFERENCES [User].[SettingAnswer]([id])
)
