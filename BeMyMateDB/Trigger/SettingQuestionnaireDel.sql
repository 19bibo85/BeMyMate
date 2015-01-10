CREATE TRIGGER [SettingQuestionnaireDel]
	ON [User].[SettingQuestionnaire]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[SettingQuestionnaire]
		SET dtDeleted = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM DELETED)
	END
