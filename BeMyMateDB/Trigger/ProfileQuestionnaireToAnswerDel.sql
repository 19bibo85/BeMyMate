﻿CREATE TRIGGER [ProfileQuestionnaireToAnswerDel]
	ON [User].[ProfileQuestionnaireToAnswer]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[ProfileQuestionnaireToAnswer]
		SET dtDeleted = GETDATE() 
		WHERE 
		questionnaireId IN (SELECT DISTINCT questionnaireId FROM DELETED) and 
		answerId IN (SELECT DISTINCT answerId FROM DELETED);
	END
