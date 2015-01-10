﻿CREATE TRIGGER [ObjectRightUp]
	ON [Security].[ObjectRight]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Security].[ObjectRight]
		SET dtUpdated = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM INSERTED)
	END
