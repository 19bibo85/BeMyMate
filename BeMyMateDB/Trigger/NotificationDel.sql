﻿CREATE TRIGGER [NotificationDel]
	ON [User].[Notification]
	INSTEAD OF DELETE
	AS
	BEGIN
		SET NOCOUNT ON

		--DECLARE @TMP TABLE(i INT, id INT);
		--INSERT INTO @TMP(i, id)
		--SELECT ROW_NUMBER() OVER( ORDER BY id) as 'i', id 
		--FROM DELETED

		--DECLARE @InsNum INT = (SELECT COUNT(id) FROM @TMP);

		--WHILE(@InsNum > 0)
		--BEGIN

		--	UPDATE [User].[Notification]
		--	SET dtDeleted = GETDATE()
		--	WHERE id = (SELECT id FROM @TMP WHERE i = @InsNum)

		--	SET @InsNum = @InsNum - 1;
		--END

		UPDATE [User].[Notification]
		SET dtDeleted = GETDATE()
		WHERE id IN (SELECT DISTINCT id FROM DELETED)
	END