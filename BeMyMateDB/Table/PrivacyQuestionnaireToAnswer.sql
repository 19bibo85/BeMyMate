CREATE TABLE [User].[PrivacyQuestionnaireToAnswer]
(
	[questionnaireId] INT NOT NULL , 
    [answerId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([questionnaireId], [answerId]), 
    CONSTRAINT [FK_PrivacyQuestionnaireToAnswer_Questionnaire] FOREIGN KEY ([questionnaireId]) REFERENCES [User].[PrivacyQuestionnaire]([id]), 
    CONSTRAINT [FK_PrivacyQuestionnaireToAnswer_Answer] FOREIGN KEY ([answerId]) REFERENCES [User].[PrivacyAnswer]([id])
)
