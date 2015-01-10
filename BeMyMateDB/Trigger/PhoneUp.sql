﻿CREATE TRIGGER [PhoneUp]
	ON [User].[Phone]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[Phone]
		SET dtUpdated = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM INSERTED)
	END