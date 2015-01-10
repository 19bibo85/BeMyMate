CREATE TRIGGER [SettingQuestionnaireToAnswerUp]
	ON [User].[SettingQuestionnaireToAnswer]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[SettingQuestionnaireToAnswer]
		SET dtUpdated = GETDATE() 
		WHERE 
		questionnaireId IN (SELECT DISTINCT questionnaireId FROM INSERTED) and 
		answerId IN (SELECT DISTINCT answerId FROM INSERTED);
	END
