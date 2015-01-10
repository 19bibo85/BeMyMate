﻿CREATE TRIGGER [ProfileAreaUp]
	ON [User].[ProfileArea]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		UPDATE [User].[ProfileArea]
		SET dtUpdated = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM INSERTED)
	END
