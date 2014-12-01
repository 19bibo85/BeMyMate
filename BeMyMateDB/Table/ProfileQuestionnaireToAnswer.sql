CREATE TABLE [User].[ProfileQuestionnaireToAnswer]
(
	[questionnaireId] INT NOT NULL , 
    [answerId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL DEFAULT GETDATE(), 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    PRIMARY KEY ([questionnaireId], [answerId]), 
    CONSTRAINT [FK_ProfileQuestionnaireToAnswer_Questionnaire] FOREIGN KEY ([questionnaireId]) REFERENCES [User].[ProfileQuestionnaire]([id]), 
    CONSTRAINT [FK_ProfileQuestionnaireToAnswer_Answer] FOREIGN KEY ([answerId]) REFERENCES [User].[ProfileAnswer]([id])
)
