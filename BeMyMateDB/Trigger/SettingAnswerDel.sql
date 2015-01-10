CREATE TRIGGER [SettingAnswerDel]
	ON [User].[SettingAnswer]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[SettingAnswer]
		SET dtDeleted = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM DELETED)
	END
