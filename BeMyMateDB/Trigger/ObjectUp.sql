﻿CREATE TRIGGER [ObjectUp]
	ON [Security].[Object]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [Security].[Object]
		SET dtUpdated = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM INSERTED)
	END
