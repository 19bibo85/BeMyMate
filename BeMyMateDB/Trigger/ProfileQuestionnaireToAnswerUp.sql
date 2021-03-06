﻿CREATE TRIGGER [ProfileQuestionnaireToAnswerUp]
	ON [User].[ProfileQuestionnaireToAnswer]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[ProfileQuestionnaireToAnswer]
		SET dtUpdated = GETDATE() 
		WHERE 
		questionnaireId IN (SELECT DISTINCT questionnaireId FROM INSERTED) and 
		answerId IN (SELECT DISTINCT answerId FROM INSERTED);
	END
