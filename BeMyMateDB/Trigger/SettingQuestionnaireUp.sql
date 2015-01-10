CREATE TRIGGER [SettingQuestionnaireUp]
	ON [User].[SettingQuestionnaire]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[SettingQuestionnaire]
		SET dtUpdated = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM INSERTED)
	END
