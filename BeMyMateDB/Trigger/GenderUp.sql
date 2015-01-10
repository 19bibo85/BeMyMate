﻿CREATE TRIGGER [GenderUp]
	ON [User].[Gender]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON	

		UPDATE [User].[Gender]
		SET dtUpdated = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM INSERTED)
	END
