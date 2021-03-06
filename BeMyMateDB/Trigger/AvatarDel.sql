﻿CREATE TRIGGER [AvatarDel]
	ON [User].[Avatar]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[Avatar]
		SET dtDeleted = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM DELETED)
	END
