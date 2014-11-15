CREATE TABLE [User].[LifeStyleQuestionnaireToAnswer]
(
	[questionnaireId] INT NOT NULL , 
    [answerId] INT NOT NULL, 
    [objectId] INT NOT NULL, 
    [dtCreated] DATETIME NOT NULL, 
    [dtUpdated] DATETIME NULL, 
    [dtDeleted] DATETIME NULL, 
    CONSTRAINT [FK_LifeStyleQuestionnaireToAnswer_Object] FOREIGN KEY ([objectId]) REFERENCES [Security].[Object]([id]), 
    PRIMARY KEY ([questionnaireId], [answerId]), 
    CONSTRAINT [FK_LifeStyleQuestionnaireToAnswer_Questionnaire] FOREIGN KEY ([questionnaireId]) REFERENCES [User].[LifeStyleQuestionnaire]([id]), 
    CONSTRAINT [FK_LifeStyleQuestionnaireToAnswer_Answer] FOREIGN KEY ([answerId]) REFERENCES [User].[LifeStyleAnswer]([id])
)
