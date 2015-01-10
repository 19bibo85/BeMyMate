CREATE TRIGGER [SettingAnswerUp]
	ON [User].[SettingAnswer]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[SettingAnswer]
		SET dtUpdated = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM INSERTED)
	END
