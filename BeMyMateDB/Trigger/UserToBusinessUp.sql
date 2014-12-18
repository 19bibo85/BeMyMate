﻿CREATE TRIGGER [UserToBusinessUp]
	ON [User].[UserToBusiness]
	FOR UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		DECLARE @TMP TABLE(i INT, userId INT, businessId INT);
		INSERT INTO @TMP(i, userId, businessId)
		SELECT ROW_NUMBER() OVER( ORDER BY userId, businessId) as 'i', userId, businessId
		FROM INSERTED

		DECLARE @InsNum INT = (SELECT COUNT(userId) FROM @TMP);

		WHILE(@InsNum > 0)
		BEGIN
			DECLARE @userId INT = (SELECT userId FROM @TMP WHERE i = @InsNum);
			DECLARE @businessId INT = (SELECT businessId FROM @TMP WHERE i = @InsNum);

			UPDATE [User].[UserToBusiness]
			SET dtUpdated = GETDATE() 
			WHERE userId = @userId and businessId = @businessId

			SET @InsNum = @InsNum - 1;
		END
	END
