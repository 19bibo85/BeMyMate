﻿CREATE TRIGGER [SettingAreaUp]
	ON [User].[SettingArea]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[SettingArea]
		SET dtUpdated = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM INSERTED)
	END
