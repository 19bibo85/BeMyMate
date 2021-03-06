﻿CREATE TRIGGER [UserDel]
	ON [User].[User]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[User]
		SET dtDeleted = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM DELETED)
	END
