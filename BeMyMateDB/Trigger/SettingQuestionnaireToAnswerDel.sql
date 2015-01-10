CREATE TRIGGER [SettingQuestionnaireToAnswerDel]
	ON [User].[SettingQuestionnaireToAnswer]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[SettingQuestionnaireToAnswer]
		SET dtDeleted = GETDATE() 
		WHERE 
		questionnaireId IN (SELECT DISTINCT questionnaireId FROM DELETED) and 
		answerId IN (SELECT DISTINCT answerId FROM DELETED);
	END
