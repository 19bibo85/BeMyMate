﻿CREATE TRIGGER [GroupObjectDel]
	ON [Security].[GroupObject]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Security].[GroupObject]
		SET dtDeleted = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM DELETED)
	END
