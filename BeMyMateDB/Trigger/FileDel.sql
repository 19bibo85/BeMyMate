﻿CREATE TRIGGER [FileDel]
	ON [User].[File]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[File]
		SET dtDeleted = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM DELETED)
	END
